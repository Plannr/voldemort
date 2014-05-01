class EventsController < ApplicationController

  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def show
  end

  private

    def set_event
      @event = current_user.events.find(params[:id])
    end

    def receipt_params
      params.require(:events).permit(:user_id, :title)
    end
end
