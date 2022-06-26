class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname,               presence: true
         validates :encrypted_password,     presence: true
         validates :family_name,            presence: true
         validates :family_name_kana,       presence: true
         validates :first_name,             presence: true
         validates :first_name_kana,        presence: true
         validates :birth_day,              presence: true
            
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'Password is invalid. Include both letters and numbers' }

  validates :first_name_kana, format:{ with:/[^\x01-\x7Eｦ-ﾟ]+/,message:"First name kana is invalid. Input full-width katakana characters"}
  validates :family_name_kana, format:{ with:/[^\x01-\x7Eｦ-ﾟ]+/,message:"Last name kana is invalid. Input full-width katakana characters"}
end
