class Invitation < ApplicationRecord

  belongs_to :invited_by, class_name: "User"
  before_create :generate_invite_code
  enum status: { pending: 0, resolved: 1, deleted: 2 }

  def generate_invite_code
    self.invite_code = loop do
      code = rand(100_000_000).to_s.rjust(8, '0') 
      break code unless User.exists?(invite_code: code)
    end
  end

end
