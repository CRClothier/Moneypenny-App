require 'rails_helper'

RSpec.describe GroupExpense, type: :model do
  before :each do
    @user = User.new(name: 'juan', email: 'juan@hotmail.com', password: '123456')
    @user.save
    @category = Group.new(name: 'Food', icon: 'emojione:pot-of-food', author_id: @user.id)
    @category.save
    @expense = Expense.new(name: 'Restaurant', amount: 200, author_id: @user.id, group_id: @category.id)
    @expense.save
    @group_expense = GroupExpense.new(group_id: @category.id, expense_id: @expense.id)
    @group_expense.save
  end

  it 'GroupExpense is valid with valid attributes' do
    expect(@group_expense).to be_valid
  end

  it 'group_id must be present' do
    @group_expense.group_id = nil
    expect(@group_expense).to be_invalid
  end

  it 'expense_id must be present' do
    @group_expense.expense_id = nil
    expect(@group_expense).to be_invalid
  end
end
