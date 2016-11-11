class LanguagesAddProfileIdToLanguages < ActiveRecord::Migration
  def change
    add_column :languages, :profile_id, :integer
    add_index :languages, :profile_id
  end
end
