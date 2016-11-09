require 'rails_helper'

RSpec.describe Profile, type: :model do
  let(:profile) { FactoryGirl.create(:profile) }
  let(:profile_with_interests) { FactoryGirl.create(:profile_with_interests) }

  describe '#group_interests_array' do
    it 'should give an array of user interests' do
      expect(profile_with_interests.group_interests_array).to eq %w(ECommerce Blogging Mastermind)
    end

    it 'should return nil if no interests indicated' do
      expect(profile.group_interests_array).to eq []
    end
  end
end
