require './lib/database.rb'

class Link
  def self.all
    # [
    #   'http://www.makersacademy.com',
    #   'http://www.google.com',
    #   'http://www.facebook.com'
    # ]
    db = Database.new
    db.connect
  end
end
