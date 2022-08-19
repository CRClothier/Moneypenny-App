require 'rails_helper'

RSpec.describe Group, type: :model do
  before :each do
    @user = User.new(name: 'juan', email: 'juan@hotmail.com', password: '123456')
    @user.save
    @category = Group.new(name: 'Food', icon: 'emojione:pot-of-food', author_id: @user.id)
    @category.save
  end

  it 'Category is valid with valid attributes' do
    expect(@category).to be_valid
  end

  it 'name must not be blank' do
    @category.name = nil
    expect(@category).to be_invalid
  end

  it 'author_id must be present' do
    @category.author_id = nil
    expect(@category).to be_invalid
  end

  it 'icon must be present' do
    @category.icon = nil
    expect(@category).to be_invalid
  end
end
