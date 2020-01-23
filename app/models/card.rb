class Card < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :address, optional: true
    
end
