class Bookpost < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { maximum: 30 }
  validates :category, presence: true
  validates :description, presence: true
  mount_uploader :bookimage, BookimageUploader
  has_many :booklikes, dependent: :destroy
  has_many :bookcomments, dependent: :destroy
end
