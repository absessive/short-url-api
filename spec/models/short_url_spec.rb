require 'rails_helper'

RSpec.describe ShortUrl, type: :model do
  let(:short_url) { create(:short_url) }
  it 'creates a short URL' do
    expect(short_url.short_url).not_to be_nil
    expect(short_url.short_url).to be_a(String)
  end
end
