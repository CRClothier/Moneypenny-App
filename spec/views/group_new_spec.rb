require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Group new page', type: :system do
  describe 'new page' do
    before :each do
      @user = User.new(name: 'juan', email: 'juan@hotmail.com', password: '123456')
      @user.save!
      visit new_user_group_path(@user)
      fill_in 'Email', with: 'juan@hotmail.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
    end

    it 'Shows the nav bar' do
      expect(page).to have_content('CREATE GROUP')
    end

    it 'Shows the Add Name input' do
      fill_in 'Add Name', with: 'Food'
      expect(page).to have_field('Add Name', with: 'Food')
    end

    it 'Shows the selector' do
      expect(page).to have_selector('.custom-select')
    end

    it 'Shows the add button' do
      expect(page).to have_button('Add')
    end
  end
end
