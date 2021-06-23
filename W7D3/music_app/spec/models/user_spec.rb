require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.create!(email: 'kevin@kevin.com', password: 'password') }

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }

  describe 'User #is_password?' do
    after(:each) { result = user.is_password?('password') }

    it 'accepts a string as an argument' do
      expect(user).to receive(:is_password?).with('password')
    end

    it 'returns true if the password matches the database' do
      expect(user.is_password?('password')).to be(true)
    end
    
    it 'returns false if the password does NOT match the database' do
      expect(user.is_password?('wrong-password')).to be(false)
    end
  end

  describe 'User #reset_session_token!' do
    it 'replaces the user\'s old session_token with a new one' do
      expect(user.session_token).not_to eq(user.reset_session_token!)
    end
    
    it 'returns the new session token' do
      expect(user.reset_session_token!).to eq(user.session_token)
    end
  end

  describe 'User::find_by_credentials' do
    before { user.save! }
    
    it 'returns the correct user with valid credentials' do
      expect(User.find_by_credentials('kevin@kevin.com', 'password')).to eq(user)
    end

    it 'returns nil with invalid credentials' do
      expect(User.find_by_credentials('kevin@kevin.com', 'wrong_password')).not_to eq(user)
    end
  end
end
