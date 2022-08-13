require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Expense edit page', type: :system do
  describe 'edit page' do
    before :each do
      @user = User.new(name: 'juan', email: 'juan@hotmail.com', password: '123456')
      @user.save!
      @category = Group.create(name: 'Food', icon: 'emojione:pot-of-food', author_id: @user.id)
      @expense = Expense.create(name: 'Restaurant', amount: 200, author_id: @user.id, group_id: @category.id)
      visit edit_user_group_expense_path(@user, @category, @expense)
      fill_in 'Email', with: 'juan@hotmail.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
    end

    it 'Shows the nav bar' do
      expect(page).to have_content('EDIT TRANSACTION')
    end

    it 'Shows the Add Name input' do
      expect(page).to have_field('expense[name]', with: 'Restaurant')
    end

    it 'Shows the amount input' do
      expect(page).to have_field('expense[amount]', with: '200.0')
    end

    it 'Shows the add button' do
      expect(page).to have_button('Update')
    end
  end
end
