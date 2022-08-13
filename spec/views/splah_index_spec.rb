require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Splash index page', type: :system do
  describe 'index page' do
    before :each do
      visit root_path
    end

    it 'Shows the App title' do
      expect(page).to have_content('Accountability')
    end

    it 'Shows the Login button' do
      expect(page).to have_content('LOG IN')
    end

    it 'Shows the Sign up button' do
      expect(page).to have_content('SIGN UP')
    end

    it 'Redirects to the Login page when clicking on the Log in button' do
      click_link 'LOG IN'
      expect(current_path).to eq(new_user_session_path)
    end

    it 'Redirects to the Sign up page when clicking on the Sign up button' do
      click_link 'SIGN UP'
      expect(current_path).to eq(new_user_registration_path)
    end
  end
end
