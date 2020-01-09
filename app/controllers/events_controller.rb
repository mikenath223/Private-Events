class EventsController < ApplicationController
    before_action :set_event, :auth?, only: %i[show edit update attend_event]

    def index
        @upcoming_events = Event.upcoming_events
        @prev_events = Event.prev_events
        # @events = Event.all
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
        @current_user = current_user
        # @event_creator = User.find(Event.find(params[:id]).creator_id)
    end

    def edit
        
    end

    def update
        
    end

    def attend_event
        @user_event = current_user.user_events.build(event_id: params[:id])
        if @user_event.save
            redirect_to @event
            flash[:success] = 'Cheers!!! You were successfully booked for this event!'
        else
            flash.now[:alert] = 'There was a problem booking you for the event.'
            render :new
        end
    end

    private

    def set_event
        @event = Event.find(params[:id])
    end

    def event_params
        params.require(:event).permit(:date, :location, :description)
    end
end
