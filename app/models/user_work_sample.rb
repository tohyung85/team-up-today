class UserWorkSample < ActiveRecord::Base
  mount_uploader :sample_image, WorkSampleImageUploader
  belongs_to :profile
end
