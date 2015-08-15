class AddCoachIdToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :coach_id, :integer
  end
end
