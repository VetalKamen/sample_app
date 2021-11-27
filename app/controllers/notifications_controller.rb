class NotificationsController < ApplicationController
  before_action :logged_in_user, only: [:destroy, :toggle_viewed, :index]
  before_action :correct_user, only: [:destroy, :toggle_viewed]

  def destroy
    @notification.destroy
    flash[:success] = 'Notification deleted'
    redirect_to request.referrer || root_url
  end

  def toggle_viewed
    @user = @notification.user
    if @notification.update(viewed: '1')
      respond_to do |format|
        format.js
        format.html { redirect_to request.referrer }
      end
    else
      respond_to do |format|
        format.html { redirect_to request.referrer }
      end
    end
  end

  def index
    respond_to do |format|
      format.js do
        render 'index', locals: { title: 'Notifications' }
      end
      format.html
    end
  end

  def read_all
    @notifications = current_user.notifications
    if @notifications.update_all(viewed: '1')
      respond_to do |format|
        format.js do
          render 'read_all'
        end
        format.html
      end
    end
  end

  private

  def notification_params
    params.require(:notification).permit(:text, :target_id, :viewed)
  end

  def correct_user
    @notification = current_user.notifications.find_by(id: params[:id])
    redirect_to root_url if @notification.nil?
  end
end
