require 'peeper'
require_relative 'database_helpers'

describe Peeper do
  
  describe '.create' do
    it 'A peeper can be created' do
      first_peeper = Peeper.create("Bruce", "Bruce@Bruceiscool.com", "Bruce123", "password")
      persisted_data = persisted_data(table: 'peepers', id: first_peeper.id)

      expect(first_peeper).to be_a Peeper
      expect(first_peeper.id).to eq persisted_data.first['id']
      expect(first_peeper.name).to eq persisted_data.first['name']
      expect(first_peeper.email).to eq persisted_data.first['email']
      expect(first_peeper.peeper).to eq persisted_data.first['peeper']
      expect(first_peeper.password).to eq persisted_data.first['password']
    end

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')
  
      Peeper.create("Barb", "test@example.com", "Barb88", "password123")
    end

  end

  describe '.get' do
    it 'A peeper can be accessed' do
      first_peeper = Peeper.create("Bruce", "Bruce@Bruceiscool.com", "Bruce123", "password")

      user = Peeper.get(first_peeper.peeper)

      expect(user.first.name).to eq "Bruce"
      expect(user.first.email).to eq "Bruce@Bruceiscool.com"
      expect(user.first.password).to eq "password"
    end
  end

end