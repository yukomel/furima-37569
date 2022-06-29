class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,               presence: true
  # validates :encrypted_password,     presence: true, length: { minimum: 6 }, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
  validates :family_name,            presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :family_name_kana,       presence: true, format: {with: /\A[ァ-ヶー－]+\z/ } 
  validates :first_name,             presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ } 
  validates :first_name_kana,        presence: true, format: {with: /\A[ァ-ヶー－]+\z/ } 
  validates :birth_day,              presence: true
            
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'Password Include both letters and numbers' 
end
