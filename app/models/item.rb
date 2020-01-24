class Item < ApplicationRecord
  has_many :images
  has_many :pays
  belongs_to :user
  accepts_nested_attributes_for :images, allow_destroy: true
  validates :user_id, :name, :info, :category, :status, :delivery_chage, :delivery_area, :delivery_date, :price, presence: true
  # とりあえず商品出品機能を実装させるため
end
