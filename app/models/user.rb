class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :birthday, presence: true
  
  VALID_PASSWORD = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  validates :password, format: {with: VALID_PASSWORD }
  
  VALID_NAME = /\A[ぁ-ん一-龥]+\z/
  VALID_NAME_KANA = /\A[ァ-ヶー－]+\z/
  validates :last_name,       format: { with: VALID_NAME }
  validates :last_name_kana,  format: { with: VALID_NAME_KANA }
  validates :first_name,      format: { with: VALID_NAME }
  validates :first_name_kana, format: { with: VALID_NAME_KANA }
  
  has_many :item
  has_many :order

end
