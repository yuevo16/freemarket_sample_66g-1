class RemoveLimitYearToCards < ActiveRecord::Migration[5.0]
  def change
    remove_column :cards, :limit_year, :string
  end
end
