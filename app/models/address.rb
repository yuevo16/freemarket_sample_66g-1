class Address < ApplicationRecord
  belongs_to :user, optional: true
    # optinal: trueはUserモデルに対して設けている。外部キーがnullであることを許可するオプションで、
    # なぜ必要なのか、
  validates :first_name, :last_name, :first_name_kana, :last_name_kana, :post_number, :prefecture, :city, :address_number, :building, :phone_number, :user_id, :birth_year ,presence: true
end
