class ServiceReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: :destroy
   
  def create
    @review = current_user.service_reviews.build review_params
    if @review.save
      if params[:review_images]
        params[:review_images]["image"].each do |a|
          @review_image = @review.review_images.create!(link: a)
        end
        flash[:success] = t "flash.success.review_created"
      end
    else
        flash[:danger] = t "flash.success.create_review_fail"
    end
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    @review_id = @review.id
    @review.destroy
    respond_to do |format|
      format.html
      format.js
    end
  end
    
  
  def review_params
    params.require(:service_review).permit :title, :content, :service_id
  end
  
  def correct_user
    @review = current_user.service_reviews.find_by id: params[:id]
    #redirect_to root_path 
    puts "error" if @service_review.nil?
  end
end
