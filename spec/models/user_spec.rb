require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'creation' do
    it 'can be created' do
      user = User.create(email: "test@example.com", password: "123123", password_confirmation: "123123")
      expect(user).to be_valid
    end
  end
end
