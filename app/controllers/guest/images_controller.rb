class Guest::ImagesController < ApplicationController
  before_action :current_guest
  before_action :current_admin
  def edit
    
  end
  def create
    
  end
  def destroy_all
    # @images = Image.where(id: params[:image])
    # binding.pry
    checked_data = params[:deletes].keys # ここでcheckされたデータを受け取っています。
    Image.destroy(checked_data)
      redirect_to request.referer
  end
end