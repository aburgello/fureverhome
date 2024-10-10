require 'faker'

puts "Seeding Pets!"

pet_service = DogApiService

statuses = ['available', 'adopted', 'pending']

12.times do |i|
  pets = pet_service.call

  pets.each do |pet|
    next if pet[:name] == 'Unknown' || pet[:description] == 'Unknown temperament'

    random_name = Faker::Creature::Dog.name
    random_status = statuses.sample

    existing_pet = Pet.find_or_create_by(
      title: random_name,
      breed: pet[:name],
      age: rand(1..10),
      user_id: 1
    ) do |p|
      p.description = pet[:description] || "A wonderful pet."
      p.status = random_status
      p.image_url = pet[:image_url]
    end

    puts "Random Name: #{random_name}"
    puts "Breed (from API): #{pet[:name]}"
    puts "Description: #{pet[:description]}"
    puts "Image URL: #{pet[:image_url]}"
    puts "-----------------------------"
  end

  sleep 5
end

puts "Seeding completed!"
