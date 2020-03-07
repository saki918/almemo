class Guest::EventmembersController < ApplicationController
  def edit
    @event = Event.find(params[:event_id])
    @event_members = @event.event_members
    @new_event_members = EventMember.new(event_id: params[:event_id])
    @members_ids = current_guest.members.pluck(:id)
    @event_members_ids = @event.members.pluck(:member_id)
    @not_event_members = @members_ids - @event_members_ids
  end
  def create
    @event = Event.find(params[:event_id])
    params[:event_member][:member_id].each do |member_id|
      @new_event_members = EventMember.new(event_id: params[:event_id])
      @new_event_members.member_id = member_id
      @new_event_members.save
    end
      redirect_to event_images_edit_path (@event),
      notice: 'イベントメンバーを編集しました！'
  end
  def destroy_all
    # binding.pry
    checked_data = params[:deletes].keys # ここでcheckされたデータを受け取っています。
    EventMember.destroy(checked_data)
    redirect_to request.referer
  end
end