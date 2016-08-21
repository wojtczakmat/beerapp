class EventsController < ApplicationController
    before_action :authenticate_user!
    def index
        @events = Event.all
    end
    def show
        @event = Event.find(params[:id])
    end
    def new
    end

    def create
        @event = Event.new(event_params)
        @event.save
        redirect_to @event
    end

private
    def event_params
        params.require(:event).permit(:title, :date, :time, :description)
    end
end
