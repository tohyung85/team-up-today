require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }
  let(:user1) { FactoryGirl.create(:user) }
  let(:profile) { FactoryGirl.create(:profile) }
  let(:profile1) { FactoryGirl.create(:profile) }

  describe '#show' do
    context 'user signed in or not' do
      render_views
      it 'should show user profile' do
        get :show, id: profile
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe '#edit' do
    context 'user signed in' do
      before do
        sign_in profile.user
      end
      it 'should allow user to edit profile if it is his profile' do
        get :edit, id: profile
        expect(response).to have_http_status(:success)
      end
      it 'should return unauthorized if profile is not current user profile' do
        get :edit, id: profile1
        expect(response).to have_http_status(:unauthorized)
      end
      it 'should return 404 not found if id is not found' do
        get :edit, id: 'yolo'
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'user not signed in' do
      it 'should redirect user to root path' do
        get :edit, id: profile
        expect(response).to redirect_to root_path
      end
    end
  end

  describe '#update' do
    context 'user signed in' do
      before do
        sign_in profile.user
      end
      it 'should allow user to update profile' do
        patch :update, id: profile.id, profile: {
          first_name: 'Johnny',
          last_name: 'Doe',
          group_type_interests: ['Ecommerce', 'Mastermind', ''],
          website: 'http://www.hello.com',
          languages_attributes: {
            first: {
              name: 'English'
            }
          },
          skills_attributes: {
            first: {
              name: 'Ruby'
            }
          }
        }
        profile.reload
        expect(profile.first_name).to eq 'Johnny'
        expect(profile.last_name).to eq 'Doe'
        expect(profile.group_type_interests).to eq 'Ecommerce, Mastermind'
        expect(profile.website).to eq 'http://www.hello.com'
        expect(response).to redirect_to profile_path(profile)
      end
    end
  end
end
