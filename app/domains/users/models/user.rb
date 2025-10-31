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
                UserMailer.welcome_email(self).deliver_later
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

