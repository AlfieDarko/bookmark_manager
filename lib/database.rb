require 'pg'

module Database
  def self.read
    con = PG.connect dbname: 'bookmark_manager', user: 'alfiedarko'
    links = con.exec 'SELECT * FROM links'
    links.map { |link| link['url']  }
  rescue PG::Error => e
    puts e.message
  end

  def self.create; end

  def self.update; end

  def self.delete; end
end
