require './lib/database.rb'
require 'uri'

class Link
  def self.valid_url?(url)
    url_regexp = /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix
    url =~ url_regexp ? true : false
  end

  def self.all
    DatabaseConnection.query('SELECT * FROM links').map { |link| link['url'] }
  end

  def self.post(post)
    if valid_url?(post)
      DatabaseConnection.query("INSERT INTO links (url) VALUES ('#{post}')")
    end
  end
end
