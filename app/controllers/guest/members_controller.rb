class Guest::MembersController < ApplicationController
  before_action :current_guest
  
  def show
    @member = Member.find(params[:id])
    @events = @member.events
  end

  def create
    @new_member = current_guest.member.new(member_params)
    # @new_member.guest_id == current_guest.id
    if @new_member.save
      redirect_to members_show_path
    else
      render guests_show_path
    end
  end

  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      redirect_to request.referer
    else
      render guests_show_path
    end
  end

  def destroy
    member = Member.find(params[:id])
    member.destroy
    redirect_to guests_show_path
  end

private
  def member_params
    params.require(:member).permit(:name)
  end
end
