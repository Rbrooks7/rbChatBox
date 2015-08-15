class CreateCoaches < ActiveRecord::Migration
  def change
    create_table :coaches do |t|
      t.string :coachname
      t.string :email
      t.timestamps
    end
  end
end
