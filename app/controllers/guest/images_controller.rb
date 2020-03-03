class Guest::ImagesController < ApplicationController
  def destroy_all
    # event = Event.find(params[:id])
    # binding.pry
    checked_data = params[:image] # ここでcheckされたデータを受け取っています。
   Image.destroy(checked_data)
      redirect_to request.referer
  end
end