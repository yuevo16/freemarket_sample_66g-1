class Item < ApplicationRecord
  # extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to_active_hash :category
  has_many :images,dependent: :destroy
  has_many :pays
  belongs_to :user
  accepts_nested_attributes_for :images, allow_destroy: true
  validates :user_id, :name, :info, :category, :status, :delivery_chage, :delivery_area, :delivery_date, :price, presence: true

  def show_soldout_item(item)
    if (soldout_item = item.buyer).present?
      'SOLD OUT!!'
    end
  end
end
