# frozen_string_literal: true

module ShortUrlService
  CHARACTERS = [*('0'..'9'), *('a'..'z'), *('A'..'Z')].freeze
  LIMIT = 8

  def self.shorten_url
    short_url = ''
    counter = 0
    while counter < LIMIT
      short_url += CHARACTERS.sample
      counter += 1
    end
    short_url
  end  
end
