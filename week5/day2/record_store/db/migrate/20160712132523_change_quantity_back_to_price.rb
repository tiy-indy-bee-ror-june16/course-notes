class ChangeQuantityBackToPrice < ActiveRecord::Migration
  def change
    rename_column :albums, :quantity, :price
  end
end
