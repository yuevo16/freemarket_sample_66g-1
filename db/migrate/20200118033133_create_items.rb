class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :info, null: false
      t.string :category, null: false
      t.string :status, null: false
      t.string :delivery_chage, null: false
      t.string :delivery_area, null: false
      t.string :delivery_method
      t.string :delivery_date, null: false
      t.integer :price, null: false
      t.string :brand
      t.string :deal
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end