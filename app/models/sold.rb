class Sold < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_one :bought

end
