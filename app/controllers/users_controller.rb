class UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @users = User.ordered_by_name.page params[:page]
  end

  def show
  end
  def manage
    if current_user.has_role? :admin
      @users = User.ordered_by_name.page params[:page]
    end
  end

  def destroy
    flash[:success] = t "delete_user" if @user.destroy
    redirect_to users_url
  end
end
