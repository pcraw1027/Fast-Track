class UploadRecord < ApplicationRecord
  belongs_to :scan
  belongs_to :user
  has_many :media, as: :mediaable, dependent: :destroy
  accepts_nested_attributes_for :media, allow_destroy: true

  validates :product_name, presence: true
  validates :company_name, presence: true
  default_scope -> { order(created_at: :desc) }

  def self.user_uploads(page, per_page, user_id)
    per_page = per_page.to_i
    page = page.to_i
    offset = (page - 1) * per_page
    total_count = UploadRecord.includes(:media).where(user_id: user_id).count
    uploads = UploadRecord.includes(:media).where(user_id: user_id).limit(per_page).offset(offset)
    mapped = uploads.map do |up|
      h = {}
      h["upload"] = up
      h["media"] = up.media
    end
    PaginatedResult.new(mapped, per_page, page, total_count)
  end

end
