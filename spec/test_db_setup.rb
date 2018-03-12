
require 'pg'

p 'Setting up test database...'

connection = PG.connect(dbname: 'bookmark_manager_test')

# Clear the database
connection.exec('TRUNCATE links;')

# Adds test data
connection = PG.connect(dbname: 'bookmark_manager_test')
connection.exec("INSERT INTO links VALUES(1, 'http://www.makersacademy.com');")
connection.exec("INSERT INTO links VALUES(2, 'http://www.google.com');")
connection.exec("INSERT INTO links VALUES(3, 'http://www.facebook.com');")
