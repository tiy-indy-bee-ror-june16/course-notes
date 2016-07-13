class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.string :name
      t.text :description
      t.integer :breed_id
      t.boolean :adopted
      t.string :temperment

      t.timestamps null: false
    end
  end
end
