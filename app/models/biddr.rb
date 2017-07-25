class Biddr < ApplicationRecord
  belongs_to :item
  belongs_to :user, optional: true

  validates :bid, presence: true
  validates_with BiddrValidator
end
