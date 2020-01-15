## usersテーブル
|Column|Type|Options|
|------|----|-------|
|icon_image|string|null: false|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|pay_id|integer|null: false, foreign_key: true|
### Association
- has_many :items, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :values, dependent: :destroy
- has_many :addresses, dependent: :destroy
- belongs_to :pay, dependent: :destroy
## addressテーブル
|Column|Type|Options|
|------|----|-------|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|post_number|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address_number|string|null: false|
|building|string|null: false|
|phone_number|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|info|text|null: false|
|category|string|null: false|
|status|string|null: false|
|delivery_charge|integer|null: false|
|delivery_area|string|null: false|
|delivery_date|string|null: false|
|price|integer|null: false|
|brand|string|null: false|
|deal|string|null: false|
|user_id|integer|null: false, foreign_key: true|
|pay_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :pay
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :images, dependent: :destroy
## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item
## valuesテーブル
|Column|Type|Options|
|------|----|-------|
|good|integer|null: false|
|normal|integer|null: false|
|bad|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|card_number|integer|null: false|
|limit_month|integer|null: false|
|limit_year|integer|null: false|
|security_code|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
|address_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :address
## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
|text|text|null: false|
### Association
- belongs_to :item
- belongs_to :user
## paysテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
|money|String|null: false|
### Association
- belongs_to :user
- belongs_to :item
## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|
|image|String|null: false|
### Association
- belongs_to :item