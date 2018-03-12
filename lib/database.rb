require 'pg'

class Database
  def read
    con = PG.connect dbname: 'bookmark_manager', user: 'alfiedarko'
    links = con.exec 'SELECT * FROM links'

    # links.each do |row|
    #   # format('%s %s', row['id'], row['url'])
    #   puts (row['id']).to_s
    # end
    links.map { |link| link['url']  }
  rescue PG::Error => e
    puts e.message
    # ensure
    #   rs.clear if rs
    #   con.close if con
  end

  def create; end

  def update; end

  def delete; end
end
