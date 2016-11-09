class Profile < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  belongs_to :user

  CATEGORIES = %w(ECommerce Blogging Mastermind).freeze

  def group_interests_array
    group_type_interests.split(', ')
  end
end
