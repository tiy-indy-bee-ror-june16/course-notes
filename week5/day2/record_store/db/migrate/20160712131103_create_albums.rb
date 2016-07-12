class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title
      t.text :description
      t.integer :year
      t.integer :artist_id
      t.string :genre
      t.string :label

      t.timestamps null: false
    end
  end
end
