class WebsiteMessageMailer < ApplicationMailer
  default from: 'Croupier147 <welcome@croupier147.com>'

  def internal_email(website_message)
    @website_message = website_message
    mail(to: @website_message.sender_email, subject: "#{@website_message.sender_name} : #{@website_message.message_type}")
  end


  def sender_acknowledgment_email(website_message)
    @website_message = website_message
    mail(to: @website_message.sender_email, subject: 'Thanks for your message to Croupier147')
  end
end



