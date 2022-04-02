require 'rails_helper'

RSpec.describe Expense, type: :model do
  subject do
    @user = User.new(name: 'Amy', email: 'amy@mail.com', password: 'password')
    @group = @user.groups.new(name: 'Travel', icon: 'https://pxhere.com/en/photo/1569711', user_id: @user.id)
    @expense = Expense.new(name: 'Paris', amount: 1000.0, user_id: @user.id, group: @group)
  end
  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'amount should be numeric value' do
    expect(subject.amount).to be_kind_of Numeric
  end
  it 'amount should be present' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end
  it 'amount should be is greater than 0' do
    subject.amount = -1
    expect(subject).to_not be_valid
  end

  it 'Should be associated to a group' do
    expect(subject).to respond_to(:group)
  end
end
