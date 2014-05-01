class DashboardsController < ApplicationController

  before_action :signed_in_user

  def index
    @events = current_user.events
  end

end
