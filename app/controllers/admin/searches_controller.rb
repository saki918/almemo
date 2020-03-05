class Admin::SearchesController < ApplicationController
  before_action :current_admin
  def event_index
    # binding.pry
    @event_search = Event.ransack(params[:q])
    @search_events = @event_search.result
  end

  def member_index
    # binding.pry
    @member_search = Member.ransack(params[:q])
    @search_members = @member_search.result
  end
end
