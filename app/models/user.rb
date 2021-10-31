class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many  :items, dependent: :destroy
  has_many  :orders, dependent: :destroy

  validates :nickname,              presence: true
  validates :last_name,             presence: true
  validates :last_name,             format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }, allow_blank: true
  validates :first_name,            presence: true
  validates :first_name,            format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }, allow_blank: true
  validates :last_name_kana,        presence: true
  validates :last_name_kana,        format: { with: /\A[ァ-ヶー－]+\z/ }, allow_blank: true
  validates :first_name_kana,       presence: true
  validates :first_name_kana,       format: { with: /\A[ァ-ヶー－]+\z/ }, allow_blank: true
  validates :birth_date,            presence: true
  validates :password,              format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/ }
  validates :password_confirmation, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/ }
end
