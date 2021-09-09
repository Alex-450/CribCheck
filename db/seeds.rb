require 'faker'
require 'open-uri'

addresses = [
  "Bilderdijkkade 64, Amsterdam",
  "Piet Mondriaanstraat 106, Amsterdam",
  "Zirkoon 37, Heerhugowaard",
  "Patrimoniumstraat 4, Haarlem",
  "Woestduinstraat 40h, Amsterdam",
  "Compagniestraat 41, Amsterdam",
  "Louise Wentstraat 145, Amsterdam",
  "Imstenrade 68, Amsterdam",
  "Graaf Janlaan 7, Amstelveen",
  "Betsy Perklaan 15, Amstelveen",
  "Nedersticht 72, Amsterdam",
  "Asingaborg, Amsterdam",
  "Soetendaal 21, Amsterdam",
  "Noordhollandstraat 26, Amsterdam",
  "Soetendaal 45, Amsterdam"
]

positive_landlord_reviews = [
  "Really friendly and always available",
  "Did not ever fix any of the many issues that we had with the place",
  "Fixed everything really promptly, one of the best landlords I have ever met",
  "Tried to get us to pay for cleaning when we moved out, even though the place was spotless!",
  "Super helpful at any time of day, always made sure that everything was ok, sad to be leaving!",
  "Nice landlord, shame about the apartment though.",
  "Made us feel really welcome when we moved in, really nice",
  "Awesome landlord!!",
  "Not bad.",
  "Best landlord ever!!!",
  "Always responsive. Great communication and always available.",
  "Really helped us when we moved in and made us feel really welcome.",
  "Super nice landlord, would definitely rent from them again.",
  "I've heard of some people having bad experiences with this landlord, but mine were really positive",
  "Ticked all the boxes, really nice person to rent from.",
  "The place was immaculate when we moved in, the landlord really made an effort.",
  "Always really friendly and nice, definitely recommend.",
  "Great landlord! Definitely recommend.",
  "Approachable and nice.",
  "The perfect landlord!"
]

negative_landlord_reviews = [
  "Never available to help with anything, tried to hold onto our deposits!",
  "Took the landlord 2 years to sort out our garden",
  "Not helpful at all",
  "Did not get the apartment cleaned before we moved in, I was really disappointed",
  "Found out the landlord was massively overcharging on rent",
  "There are bad landlords, and then there is this landlord, some of the worst service I have ever expereienced",
  "Really unfriendly and unhelpful, would not recommend to anyone!",
  "Steer clear If you value your sanity!",
  "Kept turning up at the place without warning, was really rude",
  "Just terrible...",
  "We had a lot of trouble trying to get our deposit back, would avoid!",
  "Overcharged us for rent and then refused to pay the money back, terrible experience.",
  "Really just in it for profit, did not help with anything and was never available to fix anything.",
  "Would never rent from them again!",
  "There should be a zero stars option.",
  "Had a really bad experience with this landlord, and everyone I've spoken to says the same!",
  "Dreadful, just dreadful.",
  "Really disappointing experience. Would definitely not rent from them again.",
  "Never repaired anything. Was impossible to contact",
  "Do not rent from them!!"
]

positive_property_reviews = [
  "Nicest apartment I have ever lived in, cannot recommend enough.",
  "Super views and really spacious.",
  "Kitchen is amazing, all the appliances are super new and come with the house, rest of the house could use some work.",
  "Great price for the area, definitely recommend this place",
  "Didn't want to leave! My favourite ever apartment.",
  "Absolutely loved this place, you are in for a treat!",
  "The apartment is nice but the location is really an issue, nowhere near anything.",
  "Really modern and really well looked-after, can highly recommend!",
  "Great place, can't recommend enough!",
  "Amazing, really recommend!",
]

negative_property_reviews = [
  "Rodent infestation, avoid like the plague!",
  "Was messy when we moved in, loads of things wrong with the kitchen.",
  "Ok if you don't mind nearly freezing to death in the winter, the central heating is awful",
  "Watch out for the energy bills, the place is really badly insulated.",
  "Mould everywhere, landlord never fixed this and we had to move out.",
  "Worst place I have ever stayed. Horrible place.",
  "I'm not sure its even legal to rent out a place in this sort of state...",
  "Location is great but there is no elevator and you're on the sixth floor, really not great after a while.",
  "Nice place but requires loads of maintenance for the garden, neighbours are really unfriendly",
  "Day one: fridge didn't work, oven was dirty, place has not been refurbished in years.",
  "Needs some TLC, landlord hasn't renovated in about 20 years by the looks of it",
  "Paint peeling off the walls, issues with the drains and ridiculously cold in the winter.",
  "Actually could be a nice apartment, but the landlord is terrible and refuses to do any work on the place at all.",
  "Loads of really cool places nearby, but not worth living in this house!",
  "I wanted to move out as soon as I had moved in! Nothing in the house worked properly.",
  "The worst rental experience I have had.",
  "Everything in the place is SO old, actually pretty dangerous to be honest.",
  "I don't think this place has been refurbished in about 20 years, clearly the landlord doesn't care.",
  "This place was bad, really, really bad!",
  "Don't make the same mistake I did, do not move in here!",
  "It's a shame because the building is nice, and the area is great, but the apartment is really run down!"
]

puts "Clearing properties, reviews and landlords"

Property.destroy_all
Review.destroy_all
Landlord.destroy_all
seeded_users = User.where(location: "Tokyo")

# Destroy previously seeded users

# seeded_users.each do |user|
#   User.find(user.id).destroy
# end

# puts "Creating users..."

y = 1

# 10.times do
#   first_name = Faker::Name.unique.first_name
#   last_name = Faker::Name.unique.last_name
#   password = Faker::Alphanumeric.alphanumeric(number: 10, min_alpha: 3, min_numeric: 3)
#   user = User.create(
#     first_name: first_name,
#     last_name: last_name,
#     location: "Tokyo",
#     email: "#{first_name}.#{last_name}@gmail.com",
#     password: password,
#     password_confirmation: password
#   )
#   user.avatar.attach(io: File.open(Rails.root.join("app/assets/images/user_avatars/#{y}.png")), filename: "avatar1.jpg")
#   p "created #{User.last}"
#   y += 1
# end

puts "Creating landlords..."

# Create five landlords

5.times do
  Landlord.create(name: "#{Faker::Name.unique.first_name} #{Faker::Name.unique.last_name}")
end

landlord_ids = Landlord.all.ids
user_ids = User.where(location: "Tokyo").all.ids

puts "Creating properties..."

# Create 10 properties with random landlords and iterate through addresses

i = 0
10.times do
  Property.create(user_id: user_ids[i], landlord_id: landlord_ids.sample, address: addresses[i])
  i += 1
  puts "created: #{Property.last.address}"
end

puts "Creating reviews..."

property_ids = Property.all.ids
positive_rating = (3..5).to_a
negative_rating = (1..2).to_a
rental_cost = (700..1000).to_a

# Create five negative and five positive reviews

x = 0
5.times do
  Review.create!(
    user_id: user_ids[x],
    property_id: property_ids[x],
    landlord_rating: positive_rating.sample,
    property_rating: positive_rating.sample,
    rental_cost: rental_cost.sample,
    communication: positive_rating.sample,
    maintenance: positive_rating.sample,
    cleanliness: positive_rating.sample,
    landlord_comment: positive_landlord_reviews[x],
    property_comment: positive_property_reviews[x]
  )
  puts "Created: #{Review.last.landlord_comment}"
  x += 1
end

x = 5
4.times do
  Review.create!(
    user_id: user_ids[x],
    property_id: property_ids[x],
    landlord_rating: negative_rating.sample,
    property_rating: negative_rating.sample,
    rental_cost: rental_cost.sample,
    communication: negative_rating.sample,
    maintenance: negative_rating.sample,
    cleanliness: negative_rating.sample,
    landlord_comment: negative_landlord_reviews[x],
    property_comment: negative_property_reviews[x]
  )
  puts "Created: #{Review.last.landlord_comment}"
  x += 1
end

# Add extra reviews to Betsy Perklaan for demo

p "betsy landlord = #{Property.last.landlord.id}"

x = 0
y = 9
5.times do
  Review.create!(
    user_id: user_ids[x],
    property_id: property_ids.last,
    landlord_rating: negative_rating.sample,
    property_rating: negative_rating.sample,
    rental_cost: 800,
    communication: negative_rating.sample,
    maintenance: negative_rating.sample,
    cleanliness: negative_rating.sample,
    landlord_comment: negative_landlord_reviews[y],
    property_comment: negative_property_reviews[y]
  )
  x += 1
  y += 1
end

# Add extra properties to Betsy Perklaan landlord

betsy_landlord = Property.last.landlord.id

i = 10

5.times do
  Property.create!(
    user_id: user_ids.sample,
    landlord_id: betsy_landlord,
    address: addresses[i]
  )
  p "Created: #{Property.last.address}"
  i += 1
end

# Add reviews to extra properties

x = 10
property_ids = Property.all.ids

5.times do
  Review.create!(
    user_id: user_ids.sample,
    property_id: property_ids[x],
    landlord_rating: negative_rating.sample,
    property_rating: negative_rating.sample,
    rental_cost: rental_cost.sample,
    communication: negative_rating.sample,
    maintenance: negative_rating.sample,
    cleanliness: negative_rating.sample,
    landlord_comment: negative_landlord_reviews[y],
    property_comment: negative_property_reviews[y]
  )
  p "Created review: #{Review.last.property_comment} for #{Review.last.property.address}"
  x += 1
end

puts "Done!"
