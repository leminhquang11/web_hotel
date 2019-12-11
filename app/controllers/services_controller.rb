class ServicesController < ApplicationController
  before_action :load_services_by_category, only: %i(index)

  def index
    @categories = Category.all
  end

  def show
    @service = Service.find_by id: params[:id]
    @service_reviews = @service.service_reviews.order('created_at DESC').page(params[:page]).per(Settings.page.num_of_reviews)
    redirect_to root_url if @service.nil?
  end

  def book_room
    render "book_room"
  end

  def confirm
    @service = Service.find_by id: params[:id]
  end

  def services_in_place
      @services = Service.get_services_in_place(params[:place_id]).page(params[:page]).order('price DESC').per(Settings.page.num_of_services)
  end

  private
  def load_services_by_category
    if params[:category_id]
      @services = Service.get_by_category(params[:category_id]).page(params[:page]).order('price DESC').per(Settings.page.num_of_services)
    else
      @services = Service.all.page(params[:page]).order('price DESC').per(Settings.page.num_of_services)
    end
  end
end
