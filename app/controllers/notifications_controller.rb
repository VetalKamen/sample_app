class NotificationsController < ApplicationController
  before_action :logged_in_user, only: [:destroy, :toggle_action, :toggle_menu_action]
  before_action :correct_user, only: [:destroy, :toggle_action]

  def destroy
    @notification.destroy
    flash[:success] = 'Notification deleted'
    redirect_to request.referrer || root_url
  end

  def toggle_action
    @user = @notification.user
    if @notification.update_attribute('viewed', '1')
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

  def toggle_menu_action
    @notifications = current_user.notifications.order(viewed: :desc, updated_at: :desc)
    @notifications_paginated = @notifications.paginate(:page => params[:page], :per_page => @notifications.count)
    respond_to do |format|
      format.js {
       render 'toggle_menu_action', locals:
         { notifications: @notifications, notifications_paginated: @notifications_paginated, title: 'Notifications' }
      }
      format.html
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
