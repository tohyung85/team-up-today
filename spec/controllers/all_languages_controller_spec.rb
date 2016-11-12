require 'rails_helper'

RSpec.describe AllLanguagesController, type: :controller do
  describe '#index' do
    context 'ajax request' do
      it 'should return a json request' do
        get :index, input_string: 'en', format: 'json'
        expect(response).to have_http_status(:success)
        body = JSON.parse(response.body)
        expect(body['languages']).to include('English')
        expect(body['languages']).to_not include('French')
      end
    end
  end
end
