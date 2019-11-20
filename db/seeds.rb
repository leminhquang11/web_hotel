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

20.times do |n|
  Hotel.create!(
    name: Faker::Name.name,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.phone_number_with_country_code,
    country: Faker::Address.country,
    city: Faker::Address.city,
    website: 'hotel#{n+1}.com}',
    price_start: '500000',
    price_end: '1500000',
    luxury: Faker::Number.between(from: 1, to: 5),
    rate_point: Faker::Number.between(from: 1, to: 5),
    description: Faker::Restaurant.description
  )
end

hotels = Hotel.all

hotels.each do |hotel|
  # hotel.add_hotel_image(File.open(Dir['app/assets/images/hotel/*.jpg']))
  hotel.hotel_images.each do |image|
    File.open.shuffle(Dir['app/assets/images/hotel/*.jpg'])
  end
  Room.create!([
    {
      name: "Single Room",
      hotel_id: hotel.id,
      size: "Single",
      max_persons: "1",
      description: "Amazing room"
    },
    {
      name: "Sweet Love",
      hotel_id: hotel.id,
      size: "Double",
      max_persons: "2",
      description: "Amazing room"
    },
  ])
end
