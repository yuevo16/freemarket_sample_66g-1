class AddCardIdToCards < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :card_id, :integer
  end
end
