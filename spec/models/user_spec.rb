require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    let(:user) { User.new(name: 'Cody Fajardo', email: 'test@test.COM', password: 'secret', password_confirmation: 'secret') }
    let(:user2) { User.new(name: 'Naamen Roosevelt', email: 'TEST@TEST.com', password: 'anotherone', password_confirmation: 'anotherone') }


    it 'is valid when all arguments provided' do
      puts user.inspect
      expect(user).to be_valid
    end

    it 'is invalid when password is not provided' do
      user.password = nil
      expect(user).to_not be_valid
    end

    it 'is invalid when name is not provided' do
      user.name = nil
      expect(user).to_not be_valid
    end

    it 'is invalid when password and its confirmation differ' do
      user.password_confirmation = 'different'
      expect(user).to_not be_valid
    end

    it 'is invalid when email is already in taken' do
      user.save
      expect(user2).to_not be_valid
    end

    it 'is invalid when password is under minimum length' do
      user.password = '12345'
      expect(user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    let(:user) { User.new(name: 'Cody Fajardo', email: 'test@test.COM', password: 'secret', password_confirmation: 'secret') }

    it 'is logged in when the user exists' do
      user.save
      fetchedUser = User.authenticate_with_credentials('test@test.COM', 'secret')
      expect(fetchedUser).to_not be_nil
    end

    it 'is valid when email input has extra whitespace' do
      user.save
      fetchedUser = User.authenticate_with_credentials(' test@test.com ', 'secret')
      expect(fetchedUser).to_not be_nil
    end

    it 'is valid when characters are incorrectly capitalized' do
      user.save
      fetchedUser = User.authenticate_with_credentials('tEsT@TeSt.cOm', 'secret')
      expect(fetchedUser).to_not be_nil
    end

    it 'is invalid when email is incorrect credential/does not exist' do
      fetchedUser = User.authenticate_with_credentials('wrong@email.com ', 'secret')
      expect(fetchedUser).to be_nil
    end
  end
end
