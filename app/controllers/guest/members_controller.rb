# frozen_string_literal: true

class Guest::MembersController < ApplicationController
  before_action :current_guest
  before_action :current_admin

  def show
    @member = Member.find(params[:id])
    @member_name = @member.name
    @events = @member.events
  end

  def create
    @new_member = Member.new(member_params)
    @new_member.guest_id = current_guest.id
    if @new_member.save
      redirect_to request.referer,
      notice: 'メンバーを作成しました！'
    else
      @guest = Guest.find(params[:member][:guest_id])
      @members = @guest.members
      render 'guest/guests/show'
      # redirect_to guest_path(current_guest.id), flash: { error: @new_member.errors.full_messages }
    end
  end

  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      redirect_to request.referer,
      notice: 'メンバーの名前を編集しました！'
    else
      @member_name = Member.find(params[:id]).name
      @events = @member.events
      render 'show'
    end
  end

  # def destroy
  #   member = Member.find(params[:id])
  #   member.destroy
  #   redirect_to guest_path(current_guest),
  #   notice: 'メンバーを削除しました！'
  # end

  private

  def member_params
    params.require(:member).permit(:name)
  end
end
