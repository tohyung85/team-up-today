class ProfileAddDefaultValueToGroupTypeInterestsColumn < ActiveRecord::Migration
  def change
    change_column :profiles, :group_type_interests, :string, default: ''
  end
end
