class ProfileAddWebsite < ActiveRecord::Migration
  def change
    add_column :profiles, :website, :string
  end
end
