require './lib/database_connection'
# script

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('infactuation_test')
else
  DatabaseConnection.setup('infactuation')
end
