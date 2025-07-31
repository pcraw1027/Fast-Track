class InvitationMailer < ApplicationMailer
	default from: 'Croupier147 <info@croupier147.com>'

	def invitation_email(invitation)
    @url = "#"
  	@invitation = invitation
  	mail(to: @invitation.email, subject: 'Invitation to Croupier147')
  end

end
