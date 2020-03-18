class ShortUrl < ApplicationRecord
  validates :original_url, uniqueness: { case_sensitive: false, strict: true }
  after_validation :sanitize_original_url_and_shorten

  private
  
  def sanitize_original_url_and_shorten
    self.original_url = original_url.downcase
    self.short_url = ShortUrlService.shorten_url
  end
end
