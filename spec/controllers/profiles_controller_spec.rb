require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }
  let(:user1) { FactoryGirl.create(:user) }

  describe '#show' do
    context 'user signed in or not' do
      render_views
      it 'should show user profile' do
        get :show, id: user.id
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe '#edit' do
    context 'user signed in' do
      render_views
      before do
        sign_in user
      end
      it 'should allow user to edit profile if it is his profile' do
        get :edit, id: user.id
        expect(response).to have_http_status(:success)
      end
      it 'should return unauthorized if profile is not current user profile' do
        get :edit, id: user1.id
        expect(response).to have_http_status(:unauthorized)
      end
      it 'should return 404 not found if id is not found' do
        get :edit, id: 'yolo'
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'user not signed in' do
      it 'should redirect user to root path' do
        get :edit, id: user.id
        expect(response).to redirect_to root_path
      end
    end
  end
end
