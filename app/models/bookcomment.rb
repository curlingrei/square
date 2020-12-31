class Bookcomment < ApplicationRecord
  belongs_to :user
  belongs_to :bookpost
  validates :message, presence: true, length: { maximum: 255 }
  has_many :commentlikes, dependent: :destroy
end
