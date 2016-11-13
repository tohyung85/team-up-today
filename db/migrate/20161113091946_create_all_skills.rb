class CreateAllSkills < ActiveRecord::Migration
  def change
    create_table :all_skills do |t|
      t.string :name
      t.timestamps
    end
    add_index :all_skills, :name
  end
end
