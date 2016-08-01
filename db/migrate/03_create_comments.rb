class CreateComments < ActiveRecord::Migration
  def change
    create_table :Comments do |t|
      t.string :content
      t.integer :user_id
      t.integer :topic_id
      t.integer :likes
      t.integer :dislikes
    end
  end
end