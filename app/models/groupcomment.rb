class Groupcomment < ApplicationRecord
  belongs_to :user
  belongs_to :group
  validates :comment, presence: true, length: { maximum: 255 }

  has_many :groupcommentlikes, dependent: :destroy
end
