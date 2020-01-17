class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :birth_year, :birth_month, :birth_day, :first_name, :last_name, :first_name_kana, :last_name_kana,presence: true
  has_many :items
  has_many :likes
  has_many :values
  has_one :address
  accepts_nested_attributes_for :address
  # belongs_to :pay_id
  has_one :card
  accepts_nested_attributes_for :card
end
