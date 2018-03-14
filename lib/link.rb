require './lib/database.rb'
require 'uri'

class Link
  attr_reader :url, :id, :title

  def initialize(id, url, title)
    @url = url
    @id = id
    @title = title
  end

  def self.valid_url?(url)
    url_regexp = /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix
    url =~ url_regexp ? true : false
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM links')
    result.map { |link| Link.new(link['id'], link['url'], link['title']) }
  end

  def self.post(post)
    if valid_url?(post[:url])
      DatabaseConnection.query("INSERT INTO links (url, title) VALUES('#{post[:url]}', '#{post[:title]}')")
    end
  end

  def self.delete(post)
    DatabaseConnection.query("DELETE FROM links WHERE id = #{post[:id]}")
  end

  def self.update; end

  def self.find; end
end
