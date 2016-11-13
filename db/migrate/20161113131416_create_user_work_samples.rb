class CreateUserWorkSamples < ActiveRecord::Migration
  def change
    create_table :user_work_samples do |t|
      t.string :title
      t.string :sample_image
      t.integer :profile_id
      t.timestamps
    end
    add_index :user_work_samples, :profile_id
  end
end
