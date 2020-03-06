class Guest::EventmembersController < ApplicationController
  def edit
    @event = Event.find(params[:event_id])
    @event_members = @event.event_members
    @new_event_members = @event.event_members.new
    @members_ids = current_guest.members.pluck(:id)
    @event_members_ids = @event.members.pluck(:member_id)
    @not_event_members = @members_ids - @event_members_ids
  end
  def create
    @new_event_members = @event.event_members.new(event_member_params)
    if @new_event_members.save
      redirect_to event_image_event_images_edit_path (@event),
      notice: 'イベントメンバーを編集しました！'
    else
      render 'edit'
    end
  end
  def destroy_all
    # binding.pry
    checked_data = params[:deletes].keys # ここでcheckされたデータを受け取っています。
    EventMember.destroy(checked_data)
    redirect_to request.referer
  end
end
  private 
  def event_member_params
    params.require(:event_member).permit(member_ids: [])
  end