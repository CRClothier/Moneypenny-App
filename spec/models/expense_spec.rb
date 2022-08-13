require 'rails_helper'

RSpec.describe Expense, type: :model do
  before :each do
    @user = User.new(name: 'juan', email: 'juan@hotmail.com', password: '123456')
    @user.save
    @category = Group.new(name: 'Food', icon: 'emojione:pot-of-food', author_id: @user.id)
    @category.save
    @expense = Expense.create(name: 'Restaurant', amount: 200, author_id: @user.id, group_id: @category.id)
    @expense.save
  end

  it 'Expense is valid with valid attributes' do
    expect(@expense).to be_valid
  end

  it 'name must not be blank' do
    @expense.name = nil
    expect(@expense).to be_invalid
  end

  it 'amount must be greater than or equal to 0' do
    @expense.amount = -1
    expect(@expense).to be_invalid
  end

  it 'author_id must be present' do
    @expense.author_id = nil
    expect(@expense).to be_invalid
  end

  it 'group_id must be present' do
    @expense.group_id = nil
    expect(@expense).to be_invalid
  end
end
