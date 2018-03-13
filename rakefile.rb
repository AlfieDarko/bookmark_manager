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
  connection.exec("INSERT INTO links VALUES(1, 'http://www.makersacademy.com', 'Makers Academy');")
  connection.exec("INSERT INTO links VALUES(2, 'http://www.google.com', 'Google');")
  connection.exec("INSERT INTO links VALUES(3, 'http://www.facebook.com', 'Facebook');")
  p 'complete'
end

desc 'Sets up test and development environment'
task :setup do
  begin
    p 'Creating databases...'

    connection = PG.connect
    connection.exec('CREATE DATABASE bookmark_manager;')
  rescue StandardError
    p 'Development Database already exists'
  end

  begin
    connection.exec('CREATE DATABASE bookmark_manager_test;')
  rescue StandardError
    p 'Test Database already exists'
  end

  begin
    connection = PG.connect(dbname: 'bookmark_manager')
    begin
      connection.exec('CREATE TABLE links(id SERIAL PRIMARY KEY, url VARCHAR(60), title VARCHAR(60));')
    rescue StandardError
      StandardError
    end
    p 'Links table already exists in Development Database'
  end

  begin
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec('CREATE TABLE links(id SERIAL PRIMARY KEY, url VARCHAR(60));')
  rescue StandardError
    p 'Links table already exists in Test Database'
  end
end
