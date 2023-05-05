require 'rails_helper'

RSpec.describe 'categories/index.html.erb', type: :feature do
  before(:each) do
    @user = User.create!(name: 'Parchie', email: 'parchie@pmail.com', password: '123456')
    visit new_user_session_path
  end

  describe 'Login user' do
    it 'When I fill in correct logging credentials' do
      click_button 'Log in'
      expect(page).to have_content('LOGIN')
    end

    it 'Option to reset your password is present' do
      expect(page).to have_content('Forgot your password?')
    end
  end
end
