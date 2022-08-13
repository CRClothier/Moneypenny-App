require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Group edit page', type: :system do
  describe 'edit page' do
    before :each do
      @user = User.new(name: 'juan', email: 'juan@hotmail.com', password: '123456')
      @user.save!
      @category = Group.new(name: 'Food', icon: 'emojione:pot-of-food', author_id: @user.id)
      @category.save
      visit edit_user_group_path(@user, @category)
      fill_in 'Email', with: 'juan@hotmail.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
    end

    it 'Shows the nav bar' do
      expect(page).to have_content('EDIT GROUP')
    end

    it 'Shows the Add Name input' do
      expect(page).to have_field('group[name]', with: 'Food')
    end

    it 'Shows the add button' do
      expect(page).to have_button('Update')
    end

    it 'Shows the Delete button' do
      expect(page).to have_button('Delete')
    end
  end
end
