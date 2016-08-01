class CreateTopics < ActiveRecord::Migration
  def change
    create_table :Topics do |t|
      t.string :name
      t.string :url
    end
  end
end