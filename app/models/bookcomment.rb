class Bookcomment < ApplicationRecord
  belongs_to :user
  belongs_to :bookpost

  validates :message, presence: true
  has_many :commentlikes, dependent: :destroy
end
