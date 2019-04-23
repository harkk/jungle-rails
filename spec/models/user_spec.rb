require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    subject {
      User.new(first_name: "Tester", last_name: 'Test', email: "tester@tested.com", password: "12345678", password_confirmation: "12345678")
    }

    it 'is not valid when password confirmation does not match password' do
      subject.password_confirmation = "22222"
      expect(subject).to_not be_valid
    end

    it 'is not valid when email already used' do
      test1 = User.new(first_name: "Timmy", last_name: 'Tester', email: "tester@tested.com", password: "12345678", password_confirmation: "12345678")
      test1.save
      subject.email = "tester@tested.com"
      expect(subject).to_not be_valid
      puts subject.errors.full_messages
    end

  end
end