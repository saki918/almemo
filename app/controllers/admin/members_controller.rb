# frozen_string_literal: true

class Admin::MembersController < ApplicationController
  before_action :current_admin

  def destroy
  end

  private

  def member_params
    params.require(:member).permit(:name)
  end
end
