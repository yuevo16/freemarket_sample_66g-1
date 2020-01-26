class Item < ApplicationRecord
  # extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to_active_hash :category
  has_many :images,dependent: :destroy
  has_many :pays
  belongs_to :user
  accepts_nested_attributes_for :images, allow_destroy: true
  validates :user_id, :name, :info, :category, :status, :delivery_chage, :delivery_area, :delivery_date, :delivery_method, :price, presence: true
  # とりあえず商品出品機能を実装させるため
end
