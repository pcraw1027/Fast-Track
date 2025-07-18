class Invitation < ApplicationRecord

  belongs_to :invited_by, class_name: "User"
  before_create :generate_invite_code
  enum status: { pending: 0, resolved: 1, deleted: 2 }

  validates :email, :first_name, presence: true

  after_create :send_invitation_email

  def generate_invite_code
    self.invite_code = loop do
      code = rand(100_000_000).to_s.rjust(8, '0') 
      break code unless User.exists?(invite_code: code)
    end
  end


  private


  def send_invitation_email
    InvitationMailer.invitation_email(self).deliver_later
  end

end
