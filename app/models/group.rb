class Group < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  # validates :image, presence: true, unless: :default_img_ptn?
  # validates :default_img_ptn, presence: true, unless: :image?
  validates :group_name, presence: true, length: { maximum: 50 }
  validates :first_category, presence: true
  validates :target_number, presence: true
  validates :group_description, presence: true
  validates :sample_or_upload, presence: {message: ''}
  has_many :participates, dependent: :destroy
  has_many :groupcomments, dependent: :destroy

  private
    def sample_or_upload
      default_img_ptn.presence or image.presence
    end
end
