require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User model' do
    subject { User.new(name: 'Amy', email: 'amy@gmail.com') }
    before { subject.save }

    it 'Check the name is not blank' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'Check the email is not blank' do
      subject.email = ''
      expect(subject).to_not be_valid
    end
  end
end
