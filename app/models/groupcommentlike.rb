class Groupcommentlike < ApplicationRecord
  belongs_to :user
  belongs_to :groupcomment
end
