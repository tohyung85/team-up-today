class AlterProfilesAddGroupTypeInterestsColumn < ActiveRecord::Migration
  def change
    add_column :profiles, :group_type_interests, :string
  end
end
