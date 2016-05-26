class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :username, null:false
      t.string :password_hash, null:false

      t.timestamps null:false
    end
  end
end
