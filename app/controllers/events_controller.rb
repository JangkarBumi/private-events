# frozen_string_literal: true

# Events controller
class EventsController < ApplicationController
  before_action :require_login, only: %i[index show]

  def new
    @event = Event.new
  end

  def index
    @events = Event.all
  end

  def create
    @event = Event.new(event_params)
    @event.creator_id = current_user.id
    if @event.save
      redirect_to user_path(@event.creator_id)
    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
    @attendees = @event.attendances
  end

  def event_params
    params.require(:event).permit(:title, :info, :location, :date)
  end
end
