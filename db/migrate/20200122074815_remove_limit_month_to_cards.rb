class RemoveLimitMonthToCards < ActiveRecord::Migration[5.0]
  def change
    remove_column :cards, :limit_month, :string
  end
end
