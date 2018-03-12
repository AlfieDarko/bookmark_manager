require './lib/database.rb'

class Link
  def self.all
    Database.read
  end

  def self.post(args)
    Database.create(args)
  end
end
