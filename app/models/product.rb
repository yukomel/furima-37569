class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shopping_cost
  belongs_to :shopping_day
  belongs_to :prefecture
  belongs_to :user
  has_one_attached :image
  has_one :order
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user

  with_options presence: true do
    validates :name
    validates :description
    validates :category_id
    validates :status_id 
    validates :shopping_cost_id
    validates :prefecture_id
    validates :shopping_day_id
    validates :price
    validates :image
  end

  validates :category_id, :status_id, :shopping_cost_id, :prefecture_id, :shopping_day_id,
            numericality: { other_than: 1, message: "can't be blank" }
  validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  
end