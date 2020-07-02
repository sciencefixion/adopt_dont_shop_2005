require "rails_helper"

RSpec.describe 'Status requests' do
  describe 'get /status' do
    it 'returns a status message' do
      get('/status')
      json = JSON.parse(response.body)
      expect(json['status']).to eql('ok')
      expect(response.status).to eq(200)
    end
  end
end
