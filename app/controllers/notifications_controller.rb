class NotificationsController < ApplicationController

  def contact
    unless params["notifications"]["email"].blank?
      Notifications.contact_by(params["notifications"]).deliver
      redirect_to root_url, notice: "Thank you. We will get back to you shortly."
    else
      redirect_to root_url, notice: "Please provide a valid email address."
    end
  end

end
