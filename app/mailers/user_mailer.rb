class UserMailer < ApplicationMailer
	default from: 'Croupier147 <welcome@croupier147.com>'

	def welcome_email(user)
    @url = "#"
  	@user = user
  	mail(to: @user.email, subject: 'Welcome to Croupier147')
  end

  def reset_password_email(user, token)
    @url = "#"
    @user = user
    @token = token
    mail(to: @user.email, subject: 'Reset Password Instructions from Croupier147')
  end

end
