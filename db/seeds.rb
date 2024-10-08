require 'faker'

Pet.destroy_all
puts "Seeding Pets!"

pet_service = DogApiService

10.times do
  pets = pet_service.call

  pets.each do |pet|
    random_name = Faker::Creature::Dog.name

    Pet.create(
      title: random_name,
      description: pet[:description] || "A wonderful pet.",
      user_id: 1,
      breed: pet[:name],
      age: rand(1..10),
      status: 'available',
      image_url: pet[:image_url]
    )

    puts "Random Name: #{random_name}"
    puts "Breed (from API): #{pet[:name]}"
    puts "Description: #{pet[:description]}"
    puts "Image URL: #{pet[:image_url]}"
    puts "-----------------------------"

    sleep 1
  end
end

puts "Seeding completed!"
