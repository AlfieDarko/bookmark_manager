task :setup do
  p 'Creating databases...'

  %w[bookmark_manager bookmark_manager_test].each do |database|
    begin
      connection = PG.connect
      connection.exec("CREATE DATABASE #{database};")
    rescue StandardError
      p "#{database} Database already exists"
    end

    begin
      connection = PG.connect(dbname: database)
      connection.exec('CREATE TABLE links(id SERIAL PRIMARY KEY, url VARCHAR(60), title VARCHAR(60));')
    rescue ExceptionName
      p "Links table already exists in #{database}"
    end
  end
end
