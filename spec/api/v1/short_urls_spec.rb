require 'rails_helper'

describe Api::V1::ShortUrls do
  let(:short_url) { create(:short_url) }

  describe '/api/v1/shorts' do
    it 'returns the original URL' do

      get "/api/v1/shorts/#{short_url.short_url}"
      expect(response.status).to eq(200)      
      expect(JSON.parse(response.body)['original_url']).to eq(short_url.original_url)
    end
  end
end
