class CreatePublishers < ActiveRecord::Migration
  def change
    create_table :publishers do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
