require 'rake'
require 'pg'
# task default %w[test_environment]

desc 'Sets up test database environment'
task :test_environment do
  p 'Setting up test database...'
  connection = PG.connect(dbname: 'bookmark_manager_test')

  p 'database cleared'
  # Clear the database
  connection.exec('TRUNCATE links;')

  p 'test data added!'
  # Adds test data
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec("INSERT INTO links VALUES(1, 'http://www.makersacademy.com');")
  connection.exec("INSERT INTO links VALUES(2, 'http://www.google.com');")
  connection.exec("INSERT INTO links VALUES(3, 'http://www.facebook.com');")

  p 'complete'
end
