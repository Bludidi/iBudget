require 'rails_helper'

RSpec.describe Category, type: :model do
  subject do
    @user = User.create(name: 'Parchie', email: 'parchie@pmail.com', password: '123456')
    @category = Category.create(name: 'Food', icon: nil, user_id: @user.id)
  end

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'icon should be present' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end

  it 'user_id should be present' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end
end
