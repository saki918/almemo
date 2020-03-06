# frozen_string_literal: true

class Guest::GuestsController < ApplicationController
  before_action :current_guest
  before_action :current_admin
  def show
    @new_member = Member.new
    @members = current_guest.members
  end

  def edit
  end

  def update
    if current_guest.update(guest_params)
      redirect_to current_guest, notice: 'プロフィールを更新しました！'
    else
      render 'edit'
    end
  end

  private

  def guest_params
    params.require(:guest).permit(:name, :email)
  end
end
