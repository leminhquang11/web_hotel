class RoomsController < ApplicationController
  before_action :logged_in_user, :load_hotel
  before_action :correct_room_hotel, :load_room, except: %i(index new create)

  def index
    @rooms =
      Kaminari.paginate_array(@current_hotel.rooms).page(params[:page]).per Settings.max_room_per_page
  end

  def new
    @room = Room.new
    @room.images.build
  end

  def show
    @images =
      Kaminari.paginate_array(@room.images).page(params[:page]).per Settings.max_image_per_page
  end

  def create
    @room = Room.new room_params

    if @room.save
      flash[:info] = t ".room_created"
    else
      flash[:info] = t ".room_created_failed"
    end
    render :new
  end

  def edit; end

  def update
    if @room.update room_params
      flash[:success] = t ".room_updated"
      redirect_to rooms_url
    else
      flash[:notice] = t ".room_updated_failed"
      render :edit
    end
  end

  private

  def room_params
    params.require(:room).permit(:name,
      :hotel_id, :size, :max_persons,
      :facilities, :price, :description,
      images_attributes: [:id, :picture])
  end

  def load_room
    @room = Room.find_by id: params[:id]

    return if @room
    flash[:danger] = t ".room_not_found"
    redirect_to rooms_url
  end

  def load_hotel
    @current_hotel = Hotel.find_by id: params[:hotel_id]

    return if @current_hotel
    flash[:danger] = t ".hotel_not_found"
    redirect_to hotels_url
  end

  def correct_room_hotel
    return if @current_hotel.rooms.find_by id: params[:id]
    flash[:danger] = t ".incorrect_room"
    redirect_to rooms_url
  end
end
