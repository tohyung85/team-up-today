require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  describe '#landing_page' do
    context 'user accesses page' do
      it 'should return success' do
        get :landing_page
        expect(response).to have_http_status(:success)
      end
    end
  end
end
