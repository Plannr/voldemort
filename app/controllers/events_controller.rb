# Needs index, edit, create, update, and destroy methods
# Needs the views with respect to the public methods
# Update the event params

class EventsController < ApplicationController

  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    redirect_to dashboard_url
  end

  def show
  end

  def edit
  end

  private

    def set_event
      @event = current_user.events.find(params[:id])
    end

    def event_params
      params.require(:events).permit(:user_id, :title)
    end
end
