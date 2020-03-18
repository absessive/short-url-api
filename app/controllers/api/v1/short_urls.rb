# frozen_string_literal: true

module Api
  module V1
    class ShortUrls < Grape::API
      include Api::V1::Defaults

      resource :shorts do
        desc 'Return short URL for given long URL'
        params do
          requires :id, type: String,
                        desc: 'Short URL for which long URL is required'
        end
        get ':id' do
          ShortUrl.find_by_short_url(permitted_params[:id])
        end
      end

      resource :originals do
        desc 'Create a short URL from original URL'
        params do
          requires :original_url, type: String,
                                  desc: 'URL to be shortened'
        end
        post '/' do
          ShortUrl.create(original_url: permitted_params[:original_url])
        end
      end
    end
  end
end
