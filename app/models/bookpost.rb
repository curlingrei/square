class Bookpost < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { maximum: 255 }
  mount_uploader :bookimage, BookimageUploader
  has_many :booklikes, dependent: :destroy
  has_many :bookcomments, dependent: :destroy
end
