require 'rails_helper'

RSpec.describe User, type: :model do
  
  subject { User.new(
                      first_name: "Timmy",
                      last_name: "Tester",
                      email: "Timmy@tester.com",
                      password: "password",
                      password_confirmation: "password"
                      )
  }
  
  describe 'User Validations' do

    it 'is not valid without password confirmation' do
      subject.password_confirmation = "boguspassword"
      expect(subject).to_not be_valid
    end

    it 'is not valid without a first name' do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a last name' do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end
    
    it 'is not valid without an email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid when password is under 6 characters' do
      subject.password = "pass"
      expect(subject).to_not be_valid
    end

    it 'is not valid when emails has been taken (not case sensitive)' do
      new_user = User.create(
                          first_name: "Timmy", 
                          last_name: "Tester",
                          email: "timmY@tester.com", 
                          password: "password", 
                          password_confirmation: "password"
                          )
      expect(subject).to_not be_valid
    end

    it 'is not valid when passed non-existant email' do
      expect(User.authenticate_with_credentials("fake@email.com", "badpassword")).to be_nil
    end

    it 'is valid when passed existing email and password' do
      subject.save
      expect(User.authenticate_with_credentials("Timmy@tester.com", "password")).to_not be_nil
    end

    it 'is valid when entering uppercase letters in existing email' do
      subject.save
      expect(User.authenticate_with_credentials("TIMMY@tester.com", "password")).to be_truthy
    end

    it 'is valid when whitespace is present in existing email' do
      subject.save
      expect(User.authenticate_with_credentials(" Timmy@tester.com  ", "password")).to be_truthy
    end
  end
end