class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.text :bio
      t.boolean :group

      t.timestamps null: false
    end
  end
end
