class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Allowlist
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :trackable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  enum role: { user: 0, admin: 1 }
  
  after_create :send_welcome_email
  validates :username, :country, :email, :postal_code, presence: true
  

      def generate_password_token!
        token = generate_token.downcase
        self.reset_password_token = token
        self.reset_password_sent_at = Time.now.utc
        self.save!
        token
      end
    
      def password_token_valid?
          (self.reset_password_sent_at + 4.hours) > Time.now.utc
      end
    
      def reset_password!(password)
        self.password = password
        self.reset_password_token =  nil
        self.save!
      end

  #   def on_jwt_dispatch(token, payload)
  #   super
  #   do_something(token, payload)
  # end

  private

  def generate_token
    token = String.random(6, ['0'..'9','A'..'Z'] )
    user = User.find_by(reset_password_token: token.downcase)
    while user.present? 
      token = String.random(6, ['0'..'9','A'..'Z'] )
      user = User.find_by(reset_password_token: token.downcase)
    end
    token
 end

 def send_welcome_email
  UserMailer.welcome_email(self).deliver_later
 end

end
