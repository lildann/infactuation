require 'pg'
require_relative 'database_connection'

class Fact
  attr_reader :id, :text, :timestamp

  def initialize(id:, text:, timestamp:)
    @id = id
    @text = text
    @timestamp = timestamp
  end

  def self.create(text:)
    result = DatabaseConnection.query("INSERT INTO facts (text) VALUES ($1) 
    RETURNING id, text, timestamp;", [text])
    Fact.new(id: result[0]['id'],text: result[0]['text'], timestamp: result[0]['timestamp'])
  end

  def self.all
    facts = DatabaseConnection.query("SELECT * FROM facts;")
    facts.map do |fact|
      Fact.new(id: fact['id'], text: fact['text'], timestamp: fact['timestamp'])
    end
  end
 
  def format_timestamp
    date = @timestamp.split("-")
    time = @timestamp.split(" ")
    "Added at #{time[1][0..4]} on #{date[2][0]}#{date[2][1]}/#{date[1]}/#{date[0]}"
  end
end