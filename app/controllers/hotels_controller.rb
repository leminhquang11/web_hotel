class HotelsController < ApplicationController
  before_action :authenticate_user!, except: %i(index show)
  load_and_authorize_resource

  def index
    @hotels = kmnr_paginate_record Hotel.all,
      params[:page],
      Settings.max_hotel_per_page

  end
  # def index1
  #   @hotels = kmnr_paginate_record Hotel.where(luxury: '1'),
  #     params[:page],
  #     Settings.max_hotel_per_page

  # end
  # def index2
  #   @hotels = kmnr_paginate_record Hotel.where(luxury: '2'),
  #     params[:page],
  #     Settings.max_hotel_per_page

  # end
  # def index3
  #   @hotels = kmnr_paginate_record Hotel.where(luxury: '3'),
  #     params[:page],
  #     Settings.max_hotel_per_page

  # end
  # def index4
  #   @hotels = kmnr_paginate_record Hotel.where(luxury: '4'),
  #     params[:page],
  #     Settings.max_hotel_per_page

  # end
  # def index5
  #   @hotels = kmnr_paginate_record Hotel.where(luxury: '5'),
  #     params[:page],
  #     Settings.max_hotel_per_page

  # end

  end

  def admin_index
    if current_user.has_role? :moderator
      @hotels = kmnr_paginate_record Hotel.with_role(:moderator, current_user),
        params[:page], Settings.max_hotel_per_page
    end

    if current_user.has_role? :admin
      @hotels = kmnr_paginate_record Hotel.all,
        params[:page], Settings.max_hotel_per_page
    end
  end

  def new; end

  def create
    @hotel = Hotel.new hotel_params

    if @hotel.save
      flash[:success] = t ".hotel_created"
      current_user.add_role :moderator, @hotel
    else
      flash[:notice] = t ".hotel_created_failed"
    end
    redirect_to new_hotel_url
  end

  def show; end

  def admin_show; end

  def edit; end

  def update
    if @hotel.update hotel_params
      flash[:success] = t ".hotel_updated"
      redirect_to hotels_url
    else
      flash[:notice] = t ".hotel_updated_failed"
      redirect_to edit_hotels_url
    end
  end

  def destroy
    @hotel.destroy
    flash[:success] = t ".hotel_deleted"
    redirect_to hotels_url
  end

  private

  def kmnr_paginate_record record, page, max_page
    Kaminari.paginate_array(record).page(page).per max_page
  end

  def hotel_params
    params.require(:hotel).permit(:name,
      :address, :phone_number,
      :country, :city, :state,
      :website, :price_start, :price_end,
      :luxury, :description, :rate_point,
      images_attributes: [:id, :image, :_destroy])
  end

	def book_room
		render "book_room"
	end
	def pay
		render "pay"
	end


  # if params[:term]
  # @users = User.search_by_full_name(params[:term])
  # else
  #   @users = User.all
  # end
