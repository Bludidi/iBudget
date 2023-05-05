require 'rails_helper'
module WardenTestHelpers
  include Warden::Test::Helpers
end

RSpec.describe 'items/index.html.erb', type: :feature do
  include WardenTestHelpers
  before(:each) do
    @user = User.create(name: 'Parchie', email: 'parchie@pmail.com', password: '123456')
    @category = Category.create(name: 'Food', icon: 'something', user_id: @user.id)
    @item = Item.create(name: 'Onions', amount: 2.00, user_id: @user.id)
    @item = Item.create(name: 'Bananas', amount: 3.00, user_id: @user.id)
  end

  it 'should display page name' do
    login_as(@user, scope: :user)
    visit category_items_path(@category.id)
    expect(page).to have_content('TRANSACTIONS')
  end

  it 'should display button to add transacations' do
    login_as(@user, scope: :user)
    visit category_items_path(@category.id)
    expect(page).to have_content('ADD TRANSACTION')
  end

  it 'should display a list of items' do
    login_as(@user, scope: :user)
    visit category_items_path(@category)

    @items = @category.items.order(created_at: :desc)
    @items.each do |item|
      expect(page).to have_content(item.name.to_s)
    end
  end

  it 'should display a amount of each item' do
    login_as(@user, scope: :user)
    visit category_items_path(@category)

    @items = @category.items.order(created_at: :desc)
    @items.each do |item|
      expect(page).to have_content(item.amount.to_s)
    end
  end

  it 'should display total amount of items in the same category' do
    login_as(@user, scope: :user)
    visit category_items_path(@category)
    expect(page).to have_content('TOTAL AMOUNT')
  end
end
