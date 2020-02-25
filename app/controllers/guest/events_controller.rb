# frozen_string_literal: true

class Guest::EventsController < ApplicationController
  before_action :authenticate_guest!
  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def new
    @new_event = current_guest.events.new
  end

  def index
    @events = current_guest.events
  end

  def create
    @new_event = current_guest.events.new(event_params)
    if @new_event.save
      redirect_to @new_event
    else
      render 'new'
    end
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to @event
    else
      render 'edit'
    end
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
    redirect_to @events
  end

  private

  def event_params
    params.require(:event).permit(:genre_id, :eventmember_id, :title, :comment, :start_time, :finish_time)
  end
end
