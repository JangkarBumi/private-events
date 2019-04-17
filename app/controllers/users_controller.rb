class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(username: params[:user][:username])
    if (@user.save)
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

end
