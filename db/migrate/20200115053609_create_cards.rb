class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.integer :card_number, null: false
      t.integer :limit_month, null: false
      t.integer :limit_year, null: false
      t.integer :security_code, null: false
      t.integer :user_id, null: false
      t.integer :address_id, null: false
      t.timestamps
    end
  end
end
