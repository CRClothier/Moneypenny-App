require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Expense new page', type: :system do
  describe 'new page' do
    before :each do
      @user = User.new(name: 'juan', email: 'juan@hotmail.com', password: '123456')
      @user.save!
      @category = Group.create(name: 'Food', icon: 'emojione:pot-of-food', author_id: @user.id)
      visit new_user_group_expense_path(@user, @category)
      fill_in 'Email', with: 'juan@hotmail.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
    end

    it 'Shows the nav bar' do
      expect(page).to have_content('CREATE TRANSACTION')
    end

    it 'Shows the Add Name input' do
      fill_in 'Add Name', with: 'Netflix'
      expect(page).to have_field('Add Name', with: 'Netflix')
    end

    it 'Shows the amount input' do
      fill_in 'expense[amount]', with: '16.0'
      expect(page).to have_field('expense[amount]', with: '16.0')
    end

    it 'Shows the selector' do
      expect(page).to have_selector('.custom-select')
    end

    it 'Shows the add button' do
      expect(page).to have_button('Add')
    end
  end
end
