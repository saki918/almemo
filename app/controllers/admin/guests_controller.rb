class Admin::GuestsController < ApplicationController
  before_action :current_admin

  def index
    @guest_search = Guest.ransack(params[:q])
    @guests = @guest_search.result
  end

  def show
    @guest = Guest.find(params[:id])
    @members = @guest.members
  end

  def edit
    @guest = Guest.find(params[:id])
  end

  def update
    @guest = Guest.find(params[:id])
    if @guest.update
      redirect_to @guest
    else
      render :edit
    end
  end

  def destroy
    @guest = Guest.find(params[:id])
    @guest.destroy
    redirect_to admin_guests_path
  end

  private
  def guest_params
    params.require(:guest).permit(:name)
  end
end
