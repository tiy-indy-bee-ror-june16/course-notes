class CreateAuthors < ActiveRecord::Migration[5.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.text :bio
      t.string :password_digest
      t.string :auth_token

      t.timestamps
    end
  end
end
