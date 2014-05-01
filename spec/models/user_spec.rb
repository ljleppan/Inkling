require 'spec_helper'

describe User do
  it 'should have a username' do
    user = User.new username:'user'
    user.username.should eq 'user'
  end

  it 'should save with valid information' do
    user = User.create username:'user', password:'password', password_confirmation:'password'
    user.should be_valid
    User.count.should be 1
  end

  it 'should not save with a non-unique username' do
    User.create username:'user', password:'password', password_confirmation:'password'
    user = User.create username:'user', password:'password', password_confirmation:'password'
    user.should_not be_valid
    User.count.should be 1
  end

  it 'should not save with too short username' do
    user = User.create username:'us', password:'password', password_confirmation:'password'
    user.should_not be_valid
    User.count.should be 0
  end

  it 'should not save with too long username' do
    user = User.create username:'user12345678901234567890', password:'password', password_confirmation:'password'
    user.should_not be_valid
    User.count.should be 0
  end

  it 'should not save with non-matching passwords' do
    user = User.create username:'user', password:'password1', password_confirmation:'password2'
    user.should_not be_valid
    User.count.should be 0
  end

  it 'should not save with a too short password' do
    user = User.create username:'user', password:'pas', password_confirmation:'pas'
    user.should_not be_valid
    User.count.should be 0
  end
end