# frozen_string_literal: true

class Admin::SearchesController < ApplicationController
  before_action :current_admin
  def event_index
    @event_search = Event.ransack(params[:q])
    @search_events = @event_search.result
  end

  def member_index
    @member_search = Member.ransack(params[:q])
    @search_members = @member_search.result
  end

  def guest_index
    @guest_search = Guest.ransack(params[:q])
    @search_guests = @guest_search.result
  end
end
