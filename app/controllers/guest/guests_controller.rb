# frozen_string_literal: true

class Guest::GuestsController < ApplicationController
  before_action :current_guest
  before_action :current_admin
  def show
    @guest = Guest.find(params[:id])
    @new_member = Member.new
    @members = @guest.members
  end

  def edit
    @guest = Guest.find(params[:id])
  end

  def update
    @guest = Guest.find(params[:id])
    if @guest.update(guest_params)
      redirect_to @guest, notice: 'プロフィールを更新しました！'
    else
      render 'edit'
    end
  end

  private

  def guest_params
    params.require(:guest).permit(:name, :email)
  end
end
