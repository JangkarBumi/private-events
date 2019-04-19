# frozen_string_literal: true

# Sessions controller
class SessionsController < ApplicationController
  def create
    @user = User.find_by(username: params[:session][:username])
    if @user
      log_in @user
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end
end
