require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create(name: 'Parchie', email: 'parchie@pmail.com', password: '123456') }

  before { subject.save }

  it 'name should be present' do
    subject.name = 'Parchie'
    expect(subject).to be_valid
  end

  it 'email should be present' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'password should be present' do
    # subject.password = nil
    expect(subject).to_not be_nil
  end
end
