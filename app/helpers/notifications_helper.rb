module NotificationsHelper
  
	def notification_message(notification)
    case notification.notifiable_type
    when "Applause"
      "あなたのアワードが#{notification.notifiable.user.name}さんから拍手されました！"
    when "WaitingEvent"
      "あなたが設立した#{notification.notifiable.grand_prize.name}大賞に#{notification.notifiable.user.name}さんがノミネートしました！"
     else
     	"ノミネートしていた#{notification.notifiable.grand_prize.name}大賞を受賞しました！"
    end
	end

end