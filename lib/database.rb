require 'pg'

module Database
  def self.read
    con = if ENV['ENVIRONMENT'] == 'test'
            PG.connect(dbname: 'bookmark_manager_test')
          else
            PG.connect(dbname: 'bookmark_manager')
          end

    links = con.exec 'SELECT * FROM links'
    links.map { |link| link['url']  }
  rescue PG::Error => e
    puts e.message
  end

  def self.create; end

  def self.update; end

  def self.delete; end
end
