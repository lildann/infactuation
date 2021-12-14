require_relative 'database_connection'
require 'bcrypt'

class User
  def self.create(email:, password:)
    # encrypt the plantext password
    encrypted_password = BCrypt::Password.create(password)
    # insert the encrypted password into the database, instead of the plaintext one
    result = DatabaseConnection.query("INSERT INTO users (email, password) VALUES($1, $2) RETURNING id, email;", [email, encrypted_password])
    User.new(id: result[0]['id'], email: result[0]['email'])
  end

  def self.find(id:)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = $1;", [id])
    User.new(id: result[0]['id'], email: result[0]['email'])
  end

  def self.authenticate(email:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = $1;", [email])
    return nil unless result.any?
    return nil unless BCrypt::Password.new(result[0]['password']) == password
    User.new(id: result[0]['id'], email: result[0]['email'])
  end 

  attr_reader :id, :email

  def initialize(id:, email:)
    @id = id
    @email = email
  end
end
