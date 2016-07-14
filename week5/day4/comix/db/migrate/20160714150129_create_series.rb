class CreateSeries < ActiveRecord::Migration
  def change
    create_table :series do |t|
      t.string :name
      t.text :description
      t.integer :year_start
      t.integer :year_end
      t.integer :publisher_id

      t.timestamps null: false
    end
  end
end
