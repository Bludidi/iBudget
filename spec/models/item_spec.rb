require 'rails_helper'

RSpec.describe Item, type: :model do
  subject do
    @user = User.create(name: 'Parchie', email: 'parchie@pmail.com', password: '123456')
    @item = Item.create(name: 'Onions', amount: 2.00, user_id: @user.id)
  end

  it 'name should be present' do
    subject.name = 'Onions'
    expect(subject).to be_valid
  end

  it 'amount should be present' do
    subject.amount = 2.00
    expect(subject).to be_valid
  end

  it 'amount should be a float number' do
    subject.amount = 2
    expect(subject).to be_valid
  end

  it 'user_id should be present' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end
end