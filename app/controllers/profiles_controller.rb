# frozen_string_literal: true

class ProfilesController < ApplicationController
  before_action :set_user

  def show; end

  def set_user
    @user = User.find(params[:id])
  end
end
