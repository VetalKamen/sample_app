class NotificationsController < ApplicationController
  before_action :logged_in_user, only: :destroy
  before_action :correct_user, only: :destroy

  def create
    @notification = current_user.notifications.build(notification_params)
    @notification.save
  end

  def destroy
    @notification.destroy
    flash[:success] = 'Notification deleted'
    redirect_to request.referrer || root_url
  end

  private

  def notification_params
    params.require(:notification).permit(:text)
  end

  def correct_user
    @notification = current_user.notifications.find_by(id: params[:id])
    redirect_to root_url if @notification.nil?
  end
end
