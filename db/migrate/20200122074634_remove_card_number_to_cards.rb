class RemoveCardNumberToCards < ActiveRecord::Migration[5.0]
  def change
    remove_column :cards, :card_number, :string
  end
end
