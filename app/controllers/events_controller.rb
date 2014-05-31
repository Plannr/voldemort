# Needs index, edit, create, update, and destroy methods
# Needs the views with respect to the public methods
# Update the event params

class EventsController < ApplicationController

  before_action { set_body_class "dashboard" }
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    redirect_to dashboard_url
  end

  def show
    redirect_to edit_event_url
  end

  def edit
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @event = current_user.events.new
  end

  def create
    # @event = Event.new(event_params)
    binding.pry
    @event = current_user.events.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

    # DELETE /events/1
    # DELETE /events/1.json
    def destroy
      @event.destroy
      respond_to do |format|
        format.html { redirect_to events_url }
        format.json { head :no_content }
      end
    end

  private

    def set_event
      @event = current_user.events.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:user_id, :title, :type_of_event, :guest_count, :date, :min_budget, :max_budget)
      .merge(location: "Chicago", status: "Pending")
    end
end
