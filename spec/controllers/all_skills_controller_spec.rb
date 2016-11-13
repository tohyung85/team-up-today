require 'rails_helper'

RSpec.describe AllSkillsController, type: :controller do
  describe '#index' do
    context 'ajax request' do
      it 'should return a json request' do
        get :index, input_string: 'h', format: 'json'
        expect(response).to have_http_status(:success)
        # body = JSON.parse(response.body)
        # expect(body['skills']).to include('HTML')
        # expect(body['skills']).to_not include('CSS')
      end
    end
  end
end
