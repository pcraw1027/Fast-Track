class WebsiteMessage < ApplicationRecord
  validates :sender_name, :sender_email, :message_type, presence: true
  validates :sender_email, format: { with: URI::MailTo::EMAIL_REGEXP }

  after_create :send_message_email


  private


  def send_message_email
    WebsiteMessageMailer.internal_email(self).deliver_later
    WebsiteMessageMailer.sender_acknowledgment_email(self).deliver_later 
    update(sender_response_sent: true, internal_response_sent: true)
  end

end
