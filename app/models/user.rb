class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,               presence: true
  validates :family_name,            presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :family_name_kana,       presence: true, format: {with: /\A[ァ-ヶー－]+\z/ } 
  validates :first_name,             presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } 
  validates :first_name_kana,        presence: true, format: {with: /\A[ァ-ヶー－]+\z/ } 
  validates :birth_day,              presence: true
            
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'Password Include both letters and numbers' 

  def already_favorited?(product)
    self.favorites.exists?(product_id: product.id)
  end

  has_many :products
  has_many :orders
  has_many :favorites, dependent: :destroy
  has_many :favorited_products, through: :favorites, source: :product

end
