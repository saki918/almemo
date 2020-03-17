# frozen_string_literal: true

class Guest::ImagesController < ApplicationController
  before_action :current_guest
  before_action :current_admin

  def event_images_edit
    @event = Event.find(params[:event_id])
    @event_images = @event.images
    @new_event_images = Image.new(event_id: @event.id)
  end

  def create
    @event = Event.find(params[:event_id])
    if params[:image] != nil
        params[:image][:refile_id].each do |refile_id|
        @new_event_images = @event.images.new
        @new_event_images.refile_id = refile_id
        @new_event_images.save
      end
      redirect_to request.referer,
      notice: "イベントに画像を追加しました！"
    else
      @event = Event.find(params[:event_id])
      @event_images = @event.images
      @new_event_images = Image.new(event_id: @event.id)
      flash[:notice] = 'イベントに追加する画像を選択してください！'
      render 'event_images_edit'
    end
  end

  def destroy_all
    unless params[:deletes].nil?
      checked_data = params[:deletes].keys # ここでcheckされたデータを受け取っています。
      Image.destroy(checked_data)
      redirect_to request.referer,
      notice: 'イベントの画像を削除しました！'
    else
      @event = Event.find(params[:event_id])
      @event_images = @event.images
      @new_event_images = Image.new(event_id: @event.id)
      flash[:notice] = 'イベントから削除する画像を選択してください！'
      render 'event_images_edit'
    end
  end
end
