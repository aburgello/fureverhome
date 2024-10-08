puts "Seeding Dogs!"
dog_service = DogApiService.new
dogs = dog_service.fetch_dogs(20)

dogs.each do |dog|
  Pet.create(
    title: dog['name'] || "Dog #{dog['id']}",
    description: dog['description'] || "A wonderful dog.",
    user_id: 1,
    breed: dog['name'],
    status: 'available'
  )
end

puts "Seeding Cats!"
cat_service = CatApiService.new
cats = cat_service.fetch_cats(20)

cats.each do |cat|
  Pet.create(
    title: cat['name'] || "Cat #{cat['id']}",
    description: cat['description'] || "A wonderful cat.",
    user_id: 2,
    breed: cat['name'],
    status: 'available'
  )
end

puts "Seeding completed!"
