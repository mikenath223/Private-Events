class EventsController < ApplicationController


    def index
    end

    def new
        @current_user = current_user
        @event = Event.new
    end

    def create
        @event = current_user.events.build(event_params)
        if @event.save
            redirect_to root_path
            flash[:success] = "Event created!"
        else
            render 'new'
        end
    end

    def show
        @event_creator = User.find(Event.find(params[:id]).creator_id).name
    end

    def index
        @events = Event.all
    end

    private

    def event_params
        params.require(:event).permit(:date, :location, :description)
    end
end
