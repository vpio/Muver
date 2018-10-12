# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

password = "password"

wynwood_coordinates = [
[25.72196528, -80.30601336],
[25.79347939, -80.30104386],
[25.80126448, -80.13290843],
[25.77779978, -80.18783481],
[25.68441953, -80.31778371],
[25.87846807, -80.20992526],
[25.81151602, -80.19634111],
[25.69804987, -80.28630465],
[25.68178218, -80.15676618],
[25.71551117, -80.25745307],
[25.71592586, -80.28388534],
[25.92468994, -80.25621804],
[25.92468994, -80.27541778],
[25.7738864, -80.2964971],
[25.80649133, -80.26448751],
[25.72269178, -80.37213404],
[25.8828442, -80.19961707],
[25.67084287, -80.1593109],
[25.89645404, -80.27585783],
[25.8596977, -80.28422581],
[25.75092433, -80.23548213],
[25.82421585, -80.30114456],
[25.76514552, -80.22275743],
[25.83422373, -80.25132991],
[25.70836542, -80.27679206],
[25.71449908, -80.29799274],
[25.82118131, -80.12879834],
[25.83471731, -80.34523803],
[25.7819128, -80.13262791],
[25.81572237, -80.19939562]
]


user  = User.create!(
          email:    "someguy@fake.edu",
          password: password
        )


30.times do
  firstname = Faker::Name.first_name
  lastname = Faker::Name.last_name
  email = Faker::Internet.safe_email(firstname)
  avatar = Faker::Avatar.image
  file = open(avatar)
  userfake = User.create!(
               email: email,
               password: password,
               first_name: firstname,
               last_name: lastname
             )
  userfake.avatar.attach(io: file, filename: "temp.#{file.content_type_parse.first.split("/").last}", content_type: file.content_type_parse.first)

  1.times do
    lat_long = wynwood_coordinates.shift
    latitude = lat_long[0]
    longitude = lat_long[1]
    description = Faker::SiliconValley.motto
    startaddress = Faker::Address.full_address
    city = Faker::Address.city
    state = Faker::Address.state_abbr
    street = Faker::Address.street_address
    endaddress = Faker::Address.full_address
    price = rand(30..60)
    difficulty = ["Easy", "Medium", "Hard"].sample
    date = Faker::Date.forward(23)
    stairs = [true, false].sample
    maxpeople = rand(1..5)
    time = "12:00"
    userfake.listings.create!(
      description: description,
      city: city,
      state: state,
      street: street,
      ending_address: endaddress,
      price: price,
      difficulty: difficulty,
      date: date,
      stairs: stairs,
      contact: email,
      time: time,
      max_people: maxpeople,
      latitude: latitude,
      longitude: longitude
    )
  end

end

puts "#{User.count} users!"
puts "#{Listing.count} listings!"
