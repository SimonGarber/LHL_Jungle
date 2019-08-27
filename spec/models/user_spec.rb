require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it "is valid when all fields validate" do
      @user = User.new
      @user.password = 'abc123'
      @user.password_confirmation = 'abc123'
      @user.name = 'bob'
      @user.email = 'test@test.com'
      expect(@user).to be_valid
    end
    it "is valid when name is present" do
      @user = User.new
      @user.password = 'abc123'
      @user.password_confirmation = 'abc123'
      @user.name = nil
      @user.email = 'test@test.com'
      expect(@user).to_not be_valid
    end
    it "is valid when email is present" do
      @user = User.new
      @user.password = 'abc123'
      @user.password_confirmation = 'abc123'
      @user.name = 'bob'
      @user.email = nil
      expect(@user).to_not be_valid
    end
    it "is valid when password is equal to password confirmation" do
      @user = User.new
      @user.password = 'abc123'
      @user.password_confirmation = '123abc'
      @user.name = 'bob'
      @user.email = 'test@test.com'
      expect(@user).to_not be_valid
    end
    it "is valid when password is a minimum of 5 characters" do
      @user = User.new
      @user.password = 'abc1'
      @user.password_confirmation = 'abc1'
      @user.name = 'bob'
      @user.email = 'test@test.com'
      expect(@user).to_not be_valid
  end
end
    describe '.authenticate_with_credentials' do
    it "is valid when both fields authenticate with credentials" do
      @user = User.new
      @user.password = 'abc12'
      @user.password_confirmation = 'abc12'
      @user.name = 'bob'
      @user.email = 'test@test.com'
      @user.save!
      temp_user = User.authenticate_with_credentials('test@test.com','abc12')
      expect(temp_user).to_not be_nil
      
    end
  end
  describe '.authenticate_with_credentials' do
    it "is valid when email is in mixed case" do
      @user = User.new
      @user.password = 'abc12'
      @user.password_confirmation = 'abc12'
      @user.name = 'bob'
      @user.email = 'test@test.com'
      @user.save!
      temp_user = User.authenticate_with_credentials('TEST@test.com','abc12')
      expect(temp_user).to_not be_nil
      
    end
  end
  describe '.authenticate_with_credentials' do
    it "is valid when there are trailing and/or leading whitespaces in email field" do
      @user = User.new
      @user.password = 'abc12'
      @user.password_confirmation = 'abc12'
      @user.name = 'bob'
      @user.email = 'test@test.com'
      @user.save!
      temp_user = User.authenticate_with_credentials('  test@test.com','abc12')
      expect(temp_user).to_not be_nil
      
    end
  end
end
    
