class Group < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  # validates :image, presence: true, unless: :default_img_ptn?
  # validates :default_img_ptn, presence: true, unless: :image?
  validates :group_name, presence: true
  validates :group_description, presence: true
  validates :first_category, presence: true
  validates :sample_or_upload, presence: true
  has_many :participates, dependent: :destroy

  private
    def sample_or_upload
      default_img_ptn.presence or image.presence
    end
end
