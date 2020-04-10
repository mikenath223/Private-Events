# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update attend_event]
  before_action :auth?
  def index
    @upcoming_events = Event.upcoming_events.order(date: :desc)
    @prev_events = Event.prev_events.order(date: :desc)
    @present_events = Event.present_events.order(date: :desc)
  end

  def new
    @event = Event.new
    @users = User.all.where('email != ?', current_user.email).sample(10)
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      params[:event][:attendees]&.each do |u|
        next if u == 'None' || u.blank?

        User.find(u).user_events.create(event_id: @event.id)
      end
      redirect_to event_path(@event)
      flash[:success] = 'Event created!'
    else
      flash.now[:alert] = 'Error creating event'
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @event.update(event_params)
      flash[:success] = 'Event successfully updated'
      redirect_to event_path
    else
      render :edit
    end
  end

  def attend_event
    @user_event = current_user.user_events.build(event_id: params[:id])
    if @user_event.save
      redirect_to @event
      flash[:success] = 'Cheers!!! You were successfully booked for this event!'
    else
      flash.now[:danger] = 'Seems you have already been booked for this event. Kindly check below.'
      render :show
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:date, :location, :description, :attendees)
  end
end
