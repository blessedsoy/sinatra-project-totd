class CreateUsers < ActiveRecord::Migration
  def change
    create_table :Users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.boolean :liked, :null => false, :default => false
      t.boolean :disliked, :null => false, :default => false
    end
  end
end