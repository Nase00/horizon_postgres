class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, :email, null: false, index: true
      t.string :twitter, :facebook
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
