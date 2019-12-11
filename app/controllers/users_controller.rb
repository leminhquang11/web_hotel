class UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @users = User.ordered_by_name.page params[:page]
  end
  # def create
  #   @users = User.new user_params

  #   if @users.save
  #     flash[:success] = t ".user_created"
  #     # current_user.add_role :moderator, @hotel
  #   else
  #     flash[:notice] = t ".user_created_failed"
  #   end
  #   redirect_to new_user_url
  # end

  # load_and_authorize_resource

  def show
  end

  def destroy
    flash[:success] = t "delete_user" if @user.destroy
    redirect_to users_url
  end
end
