class Guest::MembersController < ApplicationController
  before_action :current_guest
  
  def show
    @member = Member.find(params[:id])
    # @events = @member.events
  end

  def create
    @new_member = current_guest.members.new(member_params)
    # @new_member.guest_id == current_guest.id
    if @new_member.save
      redirect_to @new_member, notice: 'メンバーを作成しました！'
    else
      render guest_path(current_guest)
    end
  end

  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      redirect_to request.referer, notice: 'メンバーを編集しました！'
    else
      render guest_path(current_guest)
    end
  end

  def destroy
    member = Member.find(params[:id])
    member.destroy
    redirect_to guest_path(current_guest), notice: 'メンバーを削除しました！'
  end

private
  def member_params
    params.require(:member).permit(:name)
  end
end
