require 'rails_helper'

RSpec.describe Notification, type: :model do
  subject {
    user = create(:user)
    described_class.new(text: 'Michael has followed TestUser2', user: user)
  }

  describe 'Validations' do
    it 'is not valid without a user' do
      subject.user = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a text' do
      subject.text = nil
      expect(subject).to_not be_valid
    end
  end

end