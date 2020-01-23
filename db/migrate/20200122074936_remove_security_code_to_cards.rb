class RemoveSecurityCodeToCards < ActiveRecord::Migration[5.0]
  def change
    remove_column :cards, :security_code, :string
  end
end
