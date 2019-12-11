class HomeController < ApplicationController
  def index
    @travel_places = Place.popular_places
  end
  
  def search
    if params[:name].blank? 
      # && params[:start_date].blank? && params[:end_date].blank?
      redirect_to root_path
    elsif params[:from].blank? || params[:to].blank?
      @places = Place.get_places(params[:name])
    else
      @services = []
      @place_ids = Place.get_places(params[:name]).ids
      @place_ids.each do |place_id|
        @services << Service.get_services(place_id, params[:from], params[:to])
      end
    end
  end
end
