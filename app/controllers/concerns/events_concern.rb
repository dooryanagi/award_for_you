module EventsConcern
  extend ActiveSupport::Concern

  def redirect_notice(grand_prize, message)
	  flash[:notice] = message
		redirect_back fallback_location: grand_prize_path(grand_prize)
  end

end