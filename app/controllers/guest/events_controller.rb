# frozen_string_literal: true

class Guest::EventsController < ApplicationController
  before_action :authenticate_guest!
  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
    @new_event.event_members.build
    @new_event.images.build
  end

  def new
    @new_event = current_guest.events.new
    @new_event.event_members.build
    @new_event.images.build
  end

  def index
    @events = current_guest.events
  end

  def create
    # binding.pry
    @new_event = current_guest.events.new(event_params)
    # binding.pry
    if @new_event.save
      # event[eventmember_id].each do |member_id|
      #    event_member = Event_member.new(new_event.id, member_id)
      #    event_member.save
      # end
      redirect_to @new_event, notice: 'イベントの作成に成功しました！'
    else
      render 'new'
    end
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to @event, notice: 'イベントを編集しました！'
    else
      render 'edit'
    end
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
    redirect_to events_path, notice: 'イベントを削除しました！'
  end

  private

  def event_params
    params.require(:event).permit(:genre_id, :title, :comment, :start_time, :finish_time, event_members_attributes: [:id [], :member_id[]], images_attributes: [:id [], :refile_id[]])
  end
end
