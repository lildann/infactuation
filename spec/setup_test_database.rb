require 'pg'

p 'Setting up test database...'

def setup_test_database
  connection = PG.connect(dbname: 'infactuation_test')
  connection.exec('TRUNCATE users, facts;')
end
