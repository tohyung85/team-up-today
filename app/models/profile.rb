class Profile < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  belongs_to :user
  has_many :languages
  accepts_nested_attributes_for :languages, allow_destroy: true

  CATEGORIES = %w(ECommerce Blogging Mastermind).freeze

  def group_interests_array
    group_type_interests.split(', ')
  end

  def languages_string
    languages.join(', ')[0...-2]
  end
end
