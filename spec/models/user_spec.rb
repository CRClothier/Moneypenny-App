require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.new(name: 'juan', email: 'juan@hotmail.com', password: '123456')
    @user.save
  end

  it 'User is valid with valid attributes' do
    expect(@user).to be_valid
  end

  it 'name must not be blank' do
    @user.name = nil
    expect(@user).to be_invalid
  end

  it 'email must not be blank' do
    @user.email = nil
    expect(@user).to be_invalid
  end

  it 'password must not be blank' do
    @user.password = nil
    expect(@user).to be_invalid
  end

  it 'email must be unique' do
    @user2 = User.new(name: 'juan', email: 'juan@hotmail.com', password: '123456')
    @user2.save
    expect(@user2).to be_invalid
  end
end
