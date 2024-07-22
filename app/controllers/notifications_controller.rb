class NotificationsController < ApplicationController

  def update
    notification = current_user.notifications.find(params[:id])
    notification.update(read: true)
    case notification.notifiable_type
    when "Applause"
      redirect_to award_path(notification.notifiable.award.id)
    when "WaitingEvent"
      redirect_to grand_prize_path(notification.notifiable.grand_prize.id)
    else
      redirect_to grand_prize_path(notification.notifiable.grand_prize.id)

    end
  end

end
