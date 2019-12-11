class ScheduleItemsController < ApplicationController
    before_action :authenticate_user!
    before_action :load_category, only: %i(index)
    
    def index
        @schedule = Schedule.find_by id: params[:schedule_id]
        @schedule_items = @schedule.schedule_items.order(created_at: :desc)
    end
    

    def destroy
        @schedule_item_id = params[:id]
        @item = ScheduleItem.find_by id: params[:id]
        @item.destroy
        respond_to do |format|
          format.html
          format.js
        end
    end
    
    def create
        @schedule = Schedule.find_by(id: params[:schedule_id])
        @schedule_item = @schedule.schedule_items.build schedule_item_params
        @schedule_item.save
        respond_to do |format|
            format.html
            format.js
        end
    end
    
    def schedule_item_params
        params.require(:schedule_item).permit(:category_id, :description, :start_time, :end_time)
    end
    
    def load_category
        @categories = Category.all
    end
end