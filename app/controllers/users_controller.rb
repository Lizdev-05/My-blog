class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    return unless @user = User.find_by(id: params[:id])
    @user = User.find(params[:id])
  end
end
