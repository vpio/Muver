# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

password = "password"


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

  2.times do
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
      max_people: maxpeople
    )
  end

end

puts "#{User.count} users!"
puts "#{Listing.count} listings!"
