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

# puts "Creating reviews..."
puts "Done!"
