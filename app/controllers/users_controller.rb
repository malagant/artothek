class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = User.order('email asc')
  end

  def show
    @user = User.find(params[:id])
  end
end
