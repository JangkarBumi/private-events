# frozen_string_literal: true

# Users controller
class UsersController < ApplicationController
  before_action :require_login

  def require_login
    redirect_to login_path unless logged_in?
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @events = @user.events
  end

  def create
    @user = User.new(username: params[:user][:username])
    if @user.save
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def past
    @events = Event.where('date < ?',  DateTime.now)
  end

  def future
    @events = Event.where('date > ?',  DateTime.now)
  end
end
