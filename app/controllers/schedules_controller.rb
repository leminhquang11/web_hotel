class SchedulesController < ApplicationController
    before_action :load_user, only: %i(index)
    
    def index
        @schedules = @user.schedules.order(created_at: :desc)
    end
    
    def create
        @schedule = current_user.schedules.build schedule_params
        @schedule.save
        respond_to do |format|
            format.html
            format.js
        end
    end
    
    def show
    end
    
    def load_user
        @user = User.find_by id: params[:user_id]
        return if @user
        flash[:danger] = t "flash.danger.user_not_found"
        redirect_to root_path
    end
    
    def schedule_params
        params.require(:schedule).permit(:name, :description)
    end
end
