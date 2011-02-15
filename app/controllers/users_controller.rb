class UsersController < ApplicationController
  def index
    @users = User.order('email asc')
  end
end
