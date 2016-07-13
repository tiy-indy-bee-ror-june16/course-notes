class CreateBreeds < ActiveRecord::Migration
  def change
    create_table :breeds do |t|
      t.string :name
      t.integer :desirability, default: 5
      t.text :description
      t.integer :life_expectancy

      t.timestamps null: false
    end
  end
end
