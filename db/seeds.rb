require 'faker'

#Create Users
4.times do
  user = User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save
end

#Create an member user
member = User.create(
  name: 'Member Name',
  email: 'member@example.com',
  password: 'helloworld'
)
member.skip_confirmation!
member.save

users = User.all

#Create Clients
50.times do
  address = Address.new(
    street: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    zip: Faker::Base.numerify('#####'),
    addressable_type: 'Client' 
  )

  Client.create(
    name: Faker::Name.name,
    phone: Faker::Base.numerify('##########'),
    user: users.sample,
    address: address
  )
end
clients = Client.all

#Create Reports
clients.each do |client|
  address = Address.new(
    street: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    zip: Faker::Base.numerify('#####'),
    addressable_type: 'Report' 
  )

  Report.create(
    status: false,
    content: Faker::Lorem.paragraph(rand(5..10)),
    client: client,
    user: client.user,
    address: address
  )
end
reports = Report.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Client.count} clients created"
puts "#{Report.count} reports created"
