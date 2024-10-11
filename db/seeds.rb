puts "Seeding Pets!"

pet_service = DogApiService

statuses = ['available', 'available', 'available', 'adopted', 'pending']

creature_classes = [
  Faker::Creature::Dog,
  Faker::Creature::Cat,
  Faker::Creature::Horse
]

uk_cities = [
  'London', 'Manchester', 'Birmingham', 'Leeds', 'Glasgow',
  'Liverpool', 'Edinburgh', 'Bristol', 'Sheffield', 'Cardiff',
  'Leicester', 'Coventry', 'Bradford', 'Belfast', 'Nottingham',
  'Newcastle', 'Hull', 'Plymouth', 'Stoke-on-Trent', 'Wolverhampton'
]

30.times do |i|
  pets = pet_service.call

  pets.each do |pet|
    next if pet[:name] == 'Unknown' || pet[:description] == 'Unknown temperament'

    random_creature_class = creature_classes.sample
    random_name = random_creature_class.name
    random_status = statuses.sample
    random_city = uk_cities.sample

    existing_pet = Pet.find_or_create_by(
      title: random_name,
      breed: pet[:name],
      age: rand(1..10),
      user_id: 1
    ) do |p|
      p.description = pet[:description] || "A wonderful pet."
      p.status = random_status
      p.image_url = pet[:image_url]
      p.location = random_city
    end

    puts "Random Name: #{random_name}"
    puts "Breed (from API): #{pet[:name]}"
    puts "Description: #{pet[:description]}"
    puts "Image URL: #{pet[:image_url]}"
    puts "Location: #{random_city}"
    puts "-----------------------------"
  end

  sleep 2
end
