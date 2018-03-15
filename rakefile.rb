require 'rake'
require 'pg'
# task default %w[test_environment]

task :test_environment do
  p 'Setting up test database...'
  connection = PG.connect(dbname: 'bookmark_manager_test')

  # Clear the database
  connection.exec('TRUNCATE links;')
  p 'database cleared'

  # resets serial numbers
  connection.exec('ALTER SEQUENCE links_id_seq RESTART WITH 1')

  # Adds test data
  p 'test data being added'
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec("INSERT INTO links VALUES(1, 'http://www.makersacademy.com', 'Makers Academy');")
  connection.exec("INSERT INTO links VALUES(2, 'http://www.google.com', 'Google');")
  connection.exec("INSERT INTO links VALUES(3, 'http://www.facebook.com', 'Facebook');")

  connection.exec('ALTER SEQUENCE links_id_seq RESTART WITH 4')

  p 'test data added!'

  p 'complete'
end

%w[bookmark_manager bookmark_manager_test].each do |database|
  begin
    connection = PG.connect
    connection.exec("CREATE DATABASE #{database};")
  rescue StandardError
    p "#{database} Database already exists"
  end

  begin
    connection = PG.connect(dbname: database)
    connection.exec('CREATE TABLE links(url VARCHAR(60), title VARCHAR(60));')
  rescue StandardError
    p "Links table already exists in #{database}"
  end
end
