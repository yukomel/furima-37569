class Article < ApplicationRecord
  # extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to :category, :status, :shopping_cost, :shopping_day, :prefecture 
  # belongs_to :status
  # belongs_to :shopping_cost
  # belongs_to :shopping_day
  # belongs_to :prefecture

   #空の投稿を保存できないようにする
  #  validates :title, :text, presence: true

   #ジャンルの選択が「---」の時は保存できないようにする
  #  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}validates :category_id, numericality: { other_than: 1 },
  #  validates :status_id, numericality: { other_than: 1 , message: "can't be blank"}validates :status_id, numericality: { other_than: 1 },
  #  validates :shopping_cost_id, numericality: { other_than: 1 , message: "can't be blank"}validates :shopping_cost_id, numericality: { other_than: 1 },
  #  validates :shopping_day_id, numericality: { other_than: 1 , message: "can't be blank"}validates :shopping_day_id, numericality: { other_than: 1 },
  #  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}validates :prefecture_id, numericality: { other_than: 1 } 

end
