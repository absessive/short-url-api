class CreateShortUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :short_urls do |t|
      t.string :original_url
      t.string :short_url, limit: 8

      t.timestamps
    end
  end
end
