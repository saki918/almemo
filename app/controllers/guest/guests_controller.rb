class Guest::GuestsController < ApplicationController
  before_action :current_guest

  def show
  end

  def edit
  end
  def update
    if current_guest.save(guest_params)
      redirect_to current_guest
    else
      render current_guest
    end
  end
  private
  def guest_params
    params.require(:guest).permit(:name,:email)
  end
end
