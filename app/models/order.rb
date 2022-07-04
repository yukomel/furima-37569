class Order < ApplicationRecord
  validates :price, presence: true

  belongs_to :user
  belongs_to :product
  has_one :address
end
