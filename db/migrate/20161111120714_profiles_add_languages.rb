class ProfilesAddLanguages < ActiveRecord::Migration
  def change
    add_column :profiles, :languages, :string
  end
end
