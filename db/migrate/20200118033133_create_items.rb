class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :info, null: false
      t.integer :category, null: false
      t.integer :category1
      t.integer :category2
      t.string :brand
      t.integer :status, null: false
      t.integer :delivery_chage, null: false
      t.integer :delivery_area, null: false
      t.integer :delivery_method
      t.integer :delivery_date, null: false
      t.integer :price, null: false
      t.integer :deal
      t.integer :saler
      t.integer :buyer
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end