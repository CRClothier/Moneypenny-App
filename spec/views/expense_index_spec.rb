require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Expense index page', type: :system do
  describe 'index page' do
    before :each do
      @user = User.new(name: 'juan', email: 'juan@hotmail.com', password: '123456')
      @user.save!
      @category = Group.create(name: 'Food', icon: 'emojione:pot-of-food', author_id: @user.id)
      @expense = Expense.create(name: 'Restaurant', amount: 200, author_id: @user.id, group_id: @category.id)
      @expense = Expense.create(name: 'KFC', amount: 200, author_id: @user.id, group_id: @category.id)
      visit user_group_expenses_path(@user, @category)
      fill_in 'Email', with: 'juan@hotmail.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
    end

    it 'Shows the nav bar' do
      expect(page).to have_content('TRANSACTIONS')
    end

    it 'Shows the Amount of transactions' do
      expect(page).to have_content('$400.0')
    end

    it 'Shows the Transaction name' do
      expect(page).to have_content('Restaurant')
    end

    it 'Shows the new transaction button' do
      expect(page).to have_content('New Transaction')
    end

    it 'Redirects to the new transaction page when clicking on the new transaction button' do
      click_button 'New Transaction'
      expect(current_path).to eq(new_user_group_expense_path(@user, @category))
    end
  end
end
