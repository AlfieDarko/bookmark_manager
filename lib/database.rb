require 'pg'

class DatabaseConnection
  attr_reader :con, :database_name
  def self.setup(database_name)
    @@database_name = database_name
    @@con = if ENV['ENVIRONMENT'] == 'test'
              PG.connect(dbname: 'bookmark_manager_test')
            else
              PG.connect(dbname: @@database_name)
          end
  end

  def self.con
    @@con
  end

  def self.query(sql_string)
    @@con.exec sql_string
  end
end
