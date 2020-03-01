# frozen_string_literal: true

class Guest::EventsController < ApplicationController
  before_action :authenticate_guest!
  # before_action :search

  def show
    @event = Event.find(params[:id])
    @images = @event.images
    # binding.pry
  end

  def edit
    @event = Event.find(params[:id])
    @event.event_members.build
    @event.images.build
  end

  def new
    @genres = Genre.all
    @new_event = current_guest.events.new
    @new_event.event_members.build
    @new_event.images.build
  end

  def index
    # binding.pry
    @events = current_guest.events
  end

  def create
    @new_event = current_guest.events.new(event_params)
    if @new_event.save
      # binding.pry
      # {"utf8"=>"✓", "authenticity_token"=>"cdy74XCP1iJiRkRU8gGUIRs1mbHJVuAG7bve63274Gbotwx3D30Rewh7MFVnR8LzwZUJRS6SaOUB8Vjy3UQjhA==", "event"=>{"genre_id"=>"date", "event_members_attributes"=>{"0"=>{"member_id"=>["3", "5"]}}, "title"=>"title", "start_time(1i)"=>"2020", "start_time(2i)"=>"2", "start_time(3i)"=>"27", "start_time(4i)"=>"10", "start_time(5i)"=>"39", "finish_time(1i)"=>"2020", "finish_time(2i)"=>"2", "finish_time(3i)"=>"27", "finish_time(4i)"=>"10", "finish_time(5i)"=>"39", "comment"=>"commet", "images_attributes"=>{"0"=>{"refile_id"=>[#<ActionDispatch::Http::UploadedFile:0x00007f9af4580818 @tempfile=#<Tempfile:/tmp/RackMultipart20200227-7346-83ibvy.png>, @original_filename="shopping.png", @content_type="image/png", @headers="Content-Disposition: form-data; name=\"event[images_attributes][0][refile_id][]\"; filename=\"shopping.png\"\r\nContent-Type: image/png\r\n">]}}}, "commit"=>"イベント作成"}
      unless params[:event][:event_members_attributes].nil?
        # if params[:event][:event_members_attributes].blank?

        params[:event][:event_members_attributes]['0']['member_id'].each do |member_id|
          @new_event.event_members.create(member_id: member_id.to_i)
        end
      end
      unless params[:event][:images_attributes].nil?
        params[:event][:images_attributes]['0']['refile_id'].each do |refile_id|
          @new_event.images.create(refile_id: refile_id)
        end
      end

      redirect_to @new_event, notice: 'イベントの作成に成功しました！'
    else

      @genres = Genre.all
      # @new_event = current_guest.events.new
      # @new_event.event_members.build
      # @new_event.images.build
      # @new_event.valid?
      render 'new'
    end
    # binding.pry
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
    params.require(:event).permit(:genre_id, :title, :comment, :start_time, :finish_time)
  end

  # def search
  #   @search = current_guest.events.ransack(params[:q])
  #   @events = @search.result
  # end
end
