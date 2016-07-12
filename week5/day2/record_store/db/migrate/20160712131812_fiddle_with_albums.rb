class FiddleWithAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :quantity, :integer
  end
end
