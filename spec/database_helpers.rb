require './lib/database_connection'
require 'pg'

def persisted_data(id:, table:)
  connection = PG.connect(dbname: 'infactuation_test')
  connection.query("SELECT * FROM #{table} WHERE id = '#{id}';")
end
