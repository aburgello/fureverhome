require 'faker'

puts "Seeding Pets!"

pet_service = DogApiService

statuses = ['available', 'adopted', 'pending']

creature_classes = [
  Faker::Creature::Dog,
  Faker::Creature::Cat,
  Faker::Creature::Horse,
  Faker::Creature::Bird
]

12.times do |i|
  pets = pet_service.call

  pets.each do |pet|
    next if pet[:name] == 'Unknown' || pet[:description] == 'Unknown temperament'

    random_creature_class = creature_classes.sample
    random_name = random_creature_class.name
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
