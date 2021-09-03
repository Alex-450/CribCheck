require 'faker'

addresses = [
  "Ferdinand Bolstraat 44-54, Amsterdam",
  "Eerste van der Helststraat 6, Amsterdam",
  "Betelgeuzestraat 14, Amsterdam",
  "Sumatrakade 1191, Amsterdam",
  "Compagniestraat 41, Amsterdam",
  "Louise Wentstraat 145, Amsterdam",
  "Stichting Collusie, Hoogte Kadijk 400, Amsterdam",
  "Imstenrade 68, Amsterdam",
  "Graaf Janlaan 7, Amstelveen",
  "Betsy Perklaan 15, Amstelveen"
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
  "Best landlord ever!!!"
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
  "Just terrible..."
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
  "Amazing, really recommend!"
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
  "Needs some TLC, landlord hasn't renovated in about 20 years by the looks of it"
]

puts "clearing properties, reviews and landlords"

Property.destroy_all
Review.destroy_all
Landlord.destroy_all

puts "Creating landlords..."

5.times do
  Landlord.create(name: Faker::Name.unique.name)
end

landlord_ids = Landlord.all.ids
user_ids = User.all.ids

puts "Creating properties..."
i = 0
10.times do
  Property.create(user_id: user_ids.sample, landlord_id: landlord_ids.sample, address: addresses[i])
  i += 1
  puts "created: #{Property.last.address}"
end

puts "Creating reviews..."

property_ids = Property.all.ids
p property_ids
users = User.all.ids
positive_rating = (3..5).to_a
negative_rating = (1..3).to_a
rental_cost = (700..1000).to_a

x = 0
5.times do
  Review.create!(
    user_id: users.sample,
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

x = 4
5.times do
  Review.create!(
    user_id: users.sample,
    property_id: property_ids[x + 1],
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
  p x
  x += 1
end
puts "Done!"
