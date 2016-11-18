class CreateAllLanguages < ActiveRecord::Migration
  def change
    create_table :all_languages do |t|
      t.string :name
      t.timestamps
    end
    add_index :all_languages, :name
  end
end
