class Profile < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  belongs_to :user
  has_many :languages
  accepts_nested_attributes_for :languages, allow_destroy: true
  has_many :skills
  accepts_nested_attributes_for :skills, allow_destroy: true
  has_many :user_work_samples
  accepts_nested_attributes_for :user_work_samples, allow_destroy: true

  CATEGORIES = %w(ECommerce Blogging Mastermind).freeze

  def group_interests_array
    group_type_interests.split(', ')
  end

  def languages_string
    languages.join(', ')[0...-2]
  end

  def skills_string
    skills.join(', ')[0...-2]
  end
end
