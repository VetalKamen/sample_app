require 'rails_helper'

RSpec.describe 'NotificationInterfaceTests', type: :request do
  setup do
    @user_1 = create(:user)
    @user_2 = create(:user)
    log_in_as @user_1
  end

  before(:each) do
    @user_1.follow(@user_2)
  end

  describe 'create notification' do
    it 'should create notification on follow' do
      expect(@user_2.notifications.count).to eq(1)
    end
  end

  describe 'delete notification' do
    it 'user could delete his notification' do
      log_in_as @user_2
      expect(@user_2.notifications.count).to eq(1)
      @user_2.notifications.first.destroy
      expect(@user_2.notifications.count).to eq(0)
    end

    it 'should delete notification on unfollow' do
      expect(@user_2.notifications.count).to eq(1)
      @user_1.unfollow(@user_2)
      expect(@user_2.notifications.count).to eq(0)
    end
  end
end
