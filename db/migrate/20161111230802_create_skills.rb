class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :name
      t.integer :profile_id
      t.timestamps
    end
    add_index :skills, :profile_id
  end
end
