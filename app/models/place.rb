class Place < ApplicationRecord
  # resourcify
    has_many :services
    scope :order_by_name, ->(_name){order :name}
    scope :get_places, ->(name){where("name like ?", "%#{name}%")}
    scope :popular_places, ->{order(:id).take Settings.popular_places}

    def popular_places
        Place.joins(:services).select("places.*, count(services.id) as scount").group("places.id").order("scount DESC").take(Settings.popular_places)
    end
end
