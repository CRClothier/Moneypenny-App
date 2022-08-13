require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Group index page', type: :system do
  describe 'index page' do
    before :each do
      @user = User.new(name: 'juan', email: 'juan@hotmail.com', password: '123456')
      @user.save!
      @category = Group.create(name: 'Food', icon: 'emojione:pot-of-food', author_id: @user.id)
      visit user_groups_path(@user)
      fill_in 'Email', with: 'juan@hotmail.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
    end

    it 'Shows the nav bar' do
      expect(page).to have_content('GROUPS')
    end

    it 'Shows the group name' do
      expect(page).to have_content('Food')
    end

    it 'Shows the new group button' do
      expect(page).to have_content('New group')
    end

    it 'Redirects to the new group page when clicking on the new group button' do
      click_button 'New group'
      expect(current_path).to eq(new_user_group_path(@user))
    end
  end
end
