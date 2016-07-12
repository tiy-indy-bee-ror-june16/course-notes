class AddPlayLengthToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :play_length, :integer
  end
end
