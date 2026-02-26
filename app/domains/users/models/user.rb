module Domains
  module Users
      class User < ApplicationRecord
              self.table_name = "users"
              include Devise::JWT::RevocationStrategies::Allowlist

              # Include default devise modules. Others available are:
              # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
              devise :timeoutable, :database_authenticatable, :registerable, :trackable,
                    :recoverable, :rememberable, :validatable,
                    :jwt_authenticatable, jwt_revocation_strategy: self

              validate :password_complexity
              enum role: { user: 0, admin: 1 }
              enum status: { active: 0, suspended: 1, deleted: 2 }

              scope :push_enabled, -> {
                        where("notification_settings @> ?",
                          {
                            allow_notifications: true,
                            allow_push: true
                          }.to_json
                        )
                      }

              scope :croupier_recommended_frequency, -> {
                where(
                  "notification_settings @> ?",
                  {
                    frequency: { croupier_recommended: true }
                  }.to_json
                )
              }

      

              DEFAULT_NOTIFICATION_SETTINGS = {
                allow_notifications: false,

                allow_push: false,
                allow_email: false,

                frequency: {
                  croupier_recommended: true,
                  individual: false,
                  weekly: false
                },

                notification_types: {
                  scanned_available_product: true,
                  new_alternative_product: false,
                  snapshot_update: false,
                  useful_ratings_reviews: false
                }
              }.freeze
              
              mount_uploader :photo, Uploaders::PhotoUploader
              mount_uploader :avatar, Uploaders::AvatarUploader

              has_many :scans, class_name: "Domains::CroupierCore::Scan", dependent: :destroy
              has_many :upload_records, class_name: "Domains::CroupierCore::UploadRecord", dependent: :destroy
              has_many :bit_records, class_name: "Domains::CroupierCore::BitRecord", dependent: :destroy
              has_many :invitations, class_name: "Domains::Users::Invitation", foreign_key: :invited_by_id
              has_many :invited_users, through: :invitations, class_name: "Domains::Users::User"
              has_many :reviews, class_name: "Domains::Features::Reviewable::Review", dependent: :destroy
              
              after_create :send_welcome_email
              validates :username, :country, :email, :postal_code, presence: true
              validates :username, uniqueness: { case_sensitive: true }
              validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

              default_scope -> { order(created_at: :desc) }
              
              before_destroy :remove_photo_from_s3
              before_destroy :remove_avatar_from_s3

              after_initialize :set_default_notification_settings, if: :new_record?
              before_save :normalize_notification_settings

              def set_default_notification_settings
                self.notification_settings ||= DEFAULT_NOTIFICATION_SETTINGS.deep_dup
              end

              def generate_password_token!
                token = generate_token.downcase
                self.reset_password_token = token
                self.reset_password_sent_at = Time.now.utc
                save!
                token
              end

              def password_token_valid?
                  (reset_password_sent_at + 4.hours) > Time.now.utc
              end

              def reset_password!(password)
                self.password = password
                self.reset_password_token = nil
                save!
              end

        #   def on_jwt_dispatch(token, payload)
        #   super
        #   do_something(token, payload)
        # end

        private


        def normalize_notification_settings
            return if notification_settings.blank?

            if notification_settings["allow_notifications"] == false
              disable_all_notifications
            else
              enable_defaults_if_missing
            end
          end

          def disable_all_notifications
            notification_settings["allow_push"] = false
            notification_settings["allow_email"] = false

            notification_settings["frequency"]&.each_key do |key|
              notification_settings["frequency"][key] = false
            end

            notification_settings["notification_types"]&.each_key do |key|
              notification_settings["notification_types"][key] = false
            end
          end

    def enable_defaults_if_missing
      notification_settings["allow_push"] = true if notification_settings["allow_push"].nil?
      notification_settings["allow_email"] = true if notification_settings["allow_email"].nil?

      notification_settings["frequency"] ||= {
        croupier_recommended: true,
        individual: false,
        weekly: false
      }

      notification_settings["notification_types"] ||= {
        scanned_available_product: true,
        new_alternative_product: true,
        snapshot_update: true,
        useful_ratings_reviews: true
      }
    end


        def generate_token
          token = String.random(6, ['0'..'9', 'A'..'Z'])
          user = Domains::Users::User.find_by(reset_password_token: token.downcase)
          while user.present? 
            token = String.random(6, ['0'..'9', 'A'..'Z'])
            user = Domains::Users::User.find_by(reset_password_token: token.downcase)
          end
          token
        end

          def password_complexity
            return if password.blank?

            return if password.match?(/\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^A-Za-z0-9])\S{8,}\z/)

              errors.add :password, 
        "must be at least 8 characters and include at least one lowercase letter, one uppercase letter, one number, and one special character"
            
          end

          def send_welcome_email
            create_default_list(self.id)
            UserMailer.welcome_email(self).deliver_later
          end

          def create_default_list(user_id)
            Domains::Users::ListRoutine.new(user_id: user_id).spawn_default
          end

          def remove_avatar_from_s3
            return if avatar.blank?

              avatar.remove!
          end

          def remove_photo_from_s3
            return if photo.blank?

              photo.remove!
          end
              

      end
  end
end

# Domains::Users::User.all.map{|u| Domains::Users::ListRoutine.new(user_id: u.id).spawn_default}