# frozen_string_literal: true

class ShortUrlSerializer < ActiveModel::Serializer
  attributes :id, :short_url, :original_url
end
