# frozen_string_literal: true

class Admin::EventsController < ApplicationController
  before_action :current_admin

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
