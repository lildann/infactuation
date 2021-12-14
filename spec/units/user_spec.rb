require 'database_helpers'
require 'user'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(email: 'facts@example.com', password: 'password123')
      persisted_data = persisted_data(table: 'users', id: user.id)
      expect(user).to be_a(User)
      expect(user.id).to eq(persisted_data.first['id'])
      expect(user.email).to eq('facts@example.com')
    end

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')
      User.create(email: 'facts@example.com', password: 'password123')
    end
  end

  describe '.find' do
    it 'finds a user by ID' do
      user = User.create(email: 'facts@example.com', password: 'password123')
      result = User.find(id: user.id)
      expect(result.id).to eq(user.id)
      expect(result.email).to eq(user.email)
    end

    it 'returns nil if no there is no ID' do
      expect(User.find(id: nil)).to eq(nil)
    end
  end

  describe '.authenticate' do
    it 'finds a user when correct email and password is entered on sign in' do
      user = User.create(email: 'facts@example.com', password: 'password123')
      authenticated_user = User.authenticate(email: 'facts@example.com', password: 'password123')
      expect(authenticated_user.id).to eq(user.id)
    end

    it 'returns nil if given an incorrect email' do
      user = User.create(email: 'facts@example.com', password: 'password123')
      expect(User.authenticate(email: 'nottherightemail@test.com', password: 'password123')).to be_nil
    end

    it 'returns nil if given an incorrect password' do
      user = User.create(email: 'facts@example.com', password: 'password123')
      expect(User.authenticate(email: 'facts@example.com', password: 'password12')).to be_nil
    end
  end
end