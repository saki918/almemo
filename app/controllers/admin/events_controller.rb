class Admin::EventsController < ApplicationController
  before_action :current_admin
  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
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
    redirect_to request.referer
  end

  private

  def event_params
    params.require(:event).permit(:genre_id, :title, :comment, :start_time, :finish_time)
  end
end
