Role.create(name: 'moderator')
Role.create(name: 'admin')

user1 = User.create(email: 'admin@test.com',
          password: '123456',
          password_confirmation: '123456',
          name: 'Admin')
user1.add_role(:admin)
user2 = User.create(email: 'user@test.com',
          password: '123456',
          password_confirmation: '123456',
          name: 'Hotel Manage')
user2.add_role(:moderator)

20.times do |n|
  User.create!(
    email: Faker::Name.first_name+n.to_s+"@gmail.com",
    name: Faker::Name.name,
    password: "1234567", password_confirmation: "1234567",
  )
end

# 20.times do |n|
#   Hotel.create!(
#     name: Faker::Name.name,
#     address: Faker::Address.street_address,
#     phone_number: Faker::PhoneNumber.phone_number_with_country_code,
#     country: Faker::Address.country,
#     city: Faker::Address.city,
#     website: 'hotel#{n+1}.com}',
#     price_start: '5000',
#     price_end: '15000',
#     luxury: Faker::Number.between(from: 1, to: 5),
#     rate_point: Faker::Number.between(from: 1, to: 5),
#     description: Faker::Restaurant.description
#   )
# end

# hotels = Hotel.all

# hotels.each do |hotel|
#   # hotel.add_hotel_image(File.open(Dir['app/assets/images/hotel/*.jpg']))
#   hotel.hotel_images.each do |image|
#     File.open.shuffle(Dir['app/assets/images/hotel/*.jpg'])
#   end
#   Room.create!([
#     {
#       name: "Single Room",
#       hotel_id: hotel.id,
#       size: "Single",
#       max_persons: "1",
#       description: "Amazing room"
#     },
#     {
#       name: "Sweet Love",
#       hotel_id: hotel.id,
#       size: "Double",
#       max_persons: "2",
#       description: "Amazing room"
#     },
#   ])
# end

16.times do |n|
    Provider.create!([
	    {
    		email: "provider#{n+1}@provider.com",
    		name: Faker::Company.name,
    		description: "",
    		address:  Faker::Address.street_address,
    		phone_number: Faker::PhoneNumber.cell_phone,
    	}
    ])
end

Category.create!([
	{id:1,
		name: "Hotel",
		description: "Hotel",
	},

	# {id:2,
	# 	name: "Restaurant",
	# 	description: "Restaurant",
	# },

	# {id:3,
	# 	name: "Supermarket",
	# 	description: "Supermarket",
	# },

	# {id:4,
	# 	name: "Movie Theater",
	# 	description: "Movie Theater",
	# },
])

54.times do
  random_number =  rand(1..10)
  Place.create(
    name: Faker::Address.city,
	description:  Faker::Lorem.sentence(word_count: 3, supplemental: true, random_words_to_add: 4),
	image_url: "https://res.cloudinary.com/hedspi/image/upload/v1564448966/travel-discovery/play_places/#{random_number}.jpg"
	)
end

def time_rand from = 0.0, to = Time.now
  Time.at(from + rand * (to.to_f - from.to_f))
end

def price_rand (min = 0.0, max)
    a = rand * (max-min) + min
    a.round(2)
end

providers = Provider.order(:id).take(5)
categories = Category.order(:id)
places = Place.order(:id).take(5)
providers.each do |provider|
	categories.each do |category|
		case category.id
			when 1
				places.each do |place|
					st = time_rand(Time.local(2019, 1, 1), Time.local(2019, 2, 1)).to_date
					et = time_rand(Time.local(2019, 3, 1), Time.local(2019, 4, 1)).to_date
					service = Service.create!(name: Faker::Educator.course_name, description: Faker::Restaurant.description, option:"",provider_id: provider.id,category_id: category.id,place_id: place.id,start_time: st,end_time: et, price: price_rand(100,1000)  );
					(1..8).to_a.shuffle.take(3).each do |i|
	        			ServiceImage.create! link: "https://res.cloudinary.com/hedspi/image/upload/v1564448966/travel-discovery/hotels/#{i}.jpg",
	                       service_id: service.id
	                end
                end
			when 2
				places.each do |place|
					service = Service.create!(name: Faker::Educator.course_name, description: Faker::Restaurant.description, option:"",provider_id:provider.id,category_id:category.id, place_id: place.id,price: price_rand(100,1000));
					(1..11).to_a.shuffle.take(2).each do |i|
			        	ServiceImage.create! link: "https://res.cloudinary.com/hedspi/image/upload/v1564448966/travel-discovery/food/#{i}.jpg",
			                       service_id: service.id
	                end
	            end
			when 3
			when 4
		end
	end
end

PaymentMethod.create!([
	{name: "Cash"},
	{name: "Credit"}

])

BookingStatus.create!([
	{name: "booking"},
	{name: "finished"}
])

users = User.order(:id).take(5)
services = Service.order(:id).take(5)
users.each do |user|
	schedule = Schedule.create!(name: Faker::Restaurant.name, description:  Faker::Lorem.sentence(word_count: 3, supplemental: true, random_words_to_add: 4), user_id: user.id)
	services.each do |service|
		ServiceBooking.create!(user_id: user.id,
							   booking_user: Faker::Name.unique.name,
							   booking_address: Faker::Address.street_address,
							   service_id: service.id,
							   quantity: 2,
							   unit_price: service.price,
							   total_price: service.price*2,
							   booking_status_id: 2,
							   payment_method_id: 2,
							   )
		ServiceReview.create!(title:Faker::Lorem.sentence(word_count: 4, supplemental: true, random_words_to_add: 4) ,
		content: Faker::Lorem.sentence(word_count: 10, supplemental: true, random_words_to_add: 10), user_id: user.id, service_id: service.id)
	end
end

schedules = Schedule.order(:id)
categories = Category.order(:id)
schedules.each do |schedule|
	categories.each do |category|
		case category.id
			when 1
				st = time_rand(Time.local(2019, 1, 1), Time.local(2019, 2, 1)).to_date
				et = time_rand(Time.local(2019, 3, 1), Time.local(2019, 4, 1)).to_date
				schedule_item = ScheduleItem.create!(description:  Faker::Lorem.sentence(word_count: 3, supplemental: true, random_words_to_add: 4), option:"",start_time: st,end_time: et, schedule_id: schedule.id, category_id: category.id)
				(1..11).to_a.shuffle.take(2).each do |i|
			    	ScheduleItemImage.create! link: "https://res.cloudinary.com/hedspi/image/upload/v1564448966/travel-discovery/hotels/#{i}.jpg", schedule_item_id: schedule_item.id
			    end
			when 2
				st = time_rand(Time.local(2019, 1, 1), Time.local(2019, 2, 1)).to_date
				et = time_rand(Time.local(2019, 3, 1), Time.local(2019, 4, 1)).to_date
				schedule_item = ScheduleItem.create!(description:  Faker::Lorem.sentence(word_count: 3, supplemental: true, random_words_to_add: 4), option:"",start_time: st,end_time: et, schedule_id: schedule.id, category_id: category.id)
				(1..11).to_a.shuffle.take(2).each do |i|
			    	ScheduleItemImage.create! link: "https://res.cloudinary.com/hedspi/image/upload/v1564448966/travel-discovery/food/#{i}.jpg", schedule_item_id: schedule_item.id
			    end
			when 3
			when 4
		end
    end
end
users = User.order(:id).take(5)
users.each do |user|
	5.times do
		Schedule.create!(name: Faker::Restaurant.name, description:  Faker::Lorem.sentence(word_count: 3, supplemental: true, random_words_to_add: 4), user_id: user.id)
	end
end
