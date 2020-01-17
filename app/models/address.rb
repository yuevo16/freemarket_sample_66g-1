class Address < ApplicationRecord
  belongs_to :user, optional: true
    # optinal: trueはUserモデルに対して設けている。外部キーがnullであることを許可するオプションで、
    # なぜ必要なのか、
  validates :first_name, :last_name, :first_name_kana, :last_name_kana, :phone_number, :post_number, :prefecture, :city, :address_number, :building ,presence: true
end
