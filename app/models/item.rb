class Item < ApplicationRecord
  has_many :images
  has_many :pays
  belongs_to :user
end
