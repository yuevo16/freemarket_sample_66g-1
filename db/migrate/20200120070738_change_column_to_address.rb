class ChangeColumnToAddress < ActiveRecord::Migration[5.0]
  def change
    remove_column :addresses, :prefecture, :string, null: false
    add_column :addresses, :prefecture_id, :integer, null: false
  end
end
