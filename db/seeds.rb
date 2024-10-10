require 'faker'

Pet.destroy_all
puts "Seeding Pets!"

pet_service = DogApiService

statuses = ['available', 'adopted', 'pending']

12.times do |i|
  pets = pet_service.call

  pets.each do |pet|
    next if pet[:name] == 'Unknown' || pet[:description] == 'Unknown temperament'

    random_name = Faker::Creature::Dog.name
    random_status = statuses.sample

    Pet.create(
      title: random_name,
      description: pet[:description] || "A wonderful pet.",
      breed: pet[:name],
      age: rand(1..10),
      status: random_status,
      image_url: pet[:image_url],
      user_id: 1
    )

    puts "Random Name: #{random_name}"
    puts "Breed (from API): #{pet[:name]}"
    puts "Description: #{pet[:description]}"
    puts "Image URL: #{pet[:image_url]}"
    puts "-----------------------------"
  end

  sleep 5
end

puts "Seeding completed!"
