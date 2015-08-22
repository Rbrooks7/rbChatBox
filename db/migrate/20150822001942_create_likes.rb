class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.boolean :like
      t.integer :coach_id, :topic_id
      t.timestamps
    end
  end
end
