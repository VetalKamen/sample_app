require 'rails_helper'

RSpec.describe Notification, type: :model do
  subject do
    user = create(:user)
    other_user = create(:user)
    described_class.new(text: 'Michael has followed TestUser2', user: user, target_id: other_user.id)
  end

  describe 'Validations' do
    it 'is not valid without a user' do
      subject.user = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a text' do
      subject.text = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a target' do
      subject.target_id = nil
      expect(subject).to_not be_valid
    end
  end

end