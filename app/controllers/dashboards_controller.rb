class DashboardsController < ApplicationController

  before_action :signed_in_user
  before_action { set_body_class "dashboard" }

  def index
    @events = current_user.events
  end

end
