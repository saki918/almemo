# frozen_string_literal: true

class Guest::SearchesController < ApplicationController
  before_action :current_guest
  before_action :current_admin
  def event_index
    # binding.pry
    @event_search = current_guest.events.ransack(params[:q])
    @search_events = @event_search.result
  end

  def member_index
    # binding.pry
    @member_search = current_guest.members.ransack(params[:q])
    @search_members = @member_search.result
  end
end
