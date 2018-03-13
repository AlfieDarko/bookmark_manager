require './lib/database.rb'

class Link
  def self.all
    DatabaseConnection.query('SELECT * FROM links').map { |link| link['url'] }
  end

  def self.post(post)
    DatabaseConnection.query("INSERT INTO links (url) VALUES ('#{post}')")
  end
end
