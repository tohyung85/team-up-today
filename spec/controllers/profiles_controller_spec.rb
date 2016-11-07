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
end
