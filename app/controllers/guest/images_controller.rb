class Guest::ImagesController < ApplicationController
  before_action :current_guest
  before_action :current_admin
  def event_images_edit
    @event = Event.find(params[:event_id])
    @event_images = @event.images
    @new_event_images = @event.images.new
  end
  def create
    # binding.pry
    @event = Event.find(params[:event_id])
    params[:image][:refile_id].each do |refile_id|
      @new_event_images = @event.images.new
      @new_event_images.refile_id = refile_id
      @new_event_images.save
    end
    redirect_to event_path(@event)
  end
  def destroy_all
    # @images = Image.where(id: params[:image])
    # binding.pry
    checked_data = params[:deletes].keys # ここでcheckされたデータを受け取っています。
    Image.destroy(checked_data)
      redirect_to request.referer
  end
end