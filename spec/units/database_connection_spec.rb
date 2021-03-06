require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'sets up a connection to a database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'infactuation_test')
      DatabaseConnection.setup('infactuation_test')
    end
  end

  describe '.query' do
    it 'executes a query via PG' do
      connection = DatabaseConnection.setup('infactuation_test')
      expect(connection).to receive(:exec_params).with("SELECT * FROM users;", [])
      DatabaseConnection.query("SELECT * FROM users;")
    end
  end
end