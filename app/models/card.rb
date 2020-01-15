class Card < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :address, optional: true
    validates :card_number, :limit_month, :limit_year, :security_code ,presence: true
end
