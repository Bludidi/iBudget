require 'rails_helper'

RSpec.describe 'categories/index.html.erb', type: :feature do
  before(:each) do
    @user = User.create!(name: 'Parchie', email: 'parchie@pmail.com', password: '123456')
    @category = Category.create!(name: 'Clothes', icon: 'icon', user_id: @user.id)
  end

  it 'should authenticate the user' do
    visit new_user_session_path
    fill_in 'Email', with: 'parchie@pmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'

    visit categories_path
    expect(page).to have_content('CLOTHES')
    expect(page).to have_content('$00')
    expect(page).to have_content('ADD CATEGORY')
  end
end
