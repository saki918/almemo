class Admin::MembersController < ApplicationController
  before_action :current_admin
  
  def show
    @member = Member.find(params[:id])
    @events = @member.events
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
