class Bookcomment < ApplicationRecord
  belongs_to :user
  belongs_to :bookpost
end
