require 'faker'
puts "🌱 Seeding spices..."

# Seed your database here

# Create random authors 
(0..9).map do 
    Author.create(name: Faker::Book.author)
end

# Create random Genre
# genre_arr = Array.new(5) {|i| Faker::Book.genre}
(1..5).map do
   Category.create(name: Faker::Book.genre)
end 


# Create books
(1..20).map do 
    Book.create(title: Faker::Book.title, author_id: Author.order('RANDOM()').first.id, category_id: Category.order('RANDOM()').first.id)
end

puts "✅ Done seeding!"
