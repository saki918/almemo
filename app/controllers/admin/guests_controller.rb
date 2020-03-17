# frozen_string_literal: true

class Admin::GuestsController < ApplicationController
  before_action :current_admin

  def index
    @guest_search = Guest.ransack(params[:q])
    @guests = @guest_search.result
  end

  def destroy
  end

  private

  def guest_params
    params.require(:guest).permit(:name)
  end
end
