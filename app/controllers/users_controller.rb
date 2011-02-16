class UsersController < ApplicationController

  def index
    @users = User.order('email asc')
  end

  def show
    @user = User.find(params[:id])
  end
end
