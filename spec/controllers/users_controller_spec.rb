require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'create' do
    it 'successfully creates a new user' do
      user = User.create(username: "test@example.com", password: "123123", password_confirmation: "123123")
      expect(user.last.email).to eq("test@example.com")
    end
  end
end
