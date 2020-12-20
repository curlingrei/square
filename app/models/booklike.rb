class Booklike < ApplicationRecord
  belongs_to :user
  belongs_to :bookpost
end
