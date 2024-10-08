require 'faker'

Pet.destroy_all
puts "Seeding Dogs!"

dog_service = DogApiService
dogs = dog_service.call

dogs.each do |dog|
  random_name = Faker::Creature::Dog.name

  Pet.create(
    title: random_name,
    description: dog[:description] || "A wonderful dog.",
    user_id: 1,
    breed: dog[:name],
    age: rand(1..10),
    status: 'available'
  )

  puts "Random Name: #{random_name}"
  puts "Breed (from API): #{dog[:name]}"
  puts "Description: #{dog[:description]}"
  puts "-----------------------------"
end

puts "Seeding completed!"
