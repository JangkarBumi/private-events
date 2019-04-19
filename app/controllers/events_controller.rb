class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def index
    if logged_in?
      @events = Event.all
    else
      redirect_to login_path
    end
  end

  def create
    @event = Event.new(event_params)
    @event.creator_id = current_user.id
    if (@event.save)
      redirect_to user_path(@event.creator_id)
    else
      render 'new'
    end
  end

  def show
    if logged_in?
      @event = Event.find(params[:id])
      @attendees = @event.attendances
    else
      redirect_to login_path
    end
  end

  def event_params
    params.require(:event).permit(:title, :info, :location, :date)
  end
end
