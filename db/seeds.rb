# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Cleaning the DB..."
Restaurant.destroy_all

CHEFS = %w[Adam Arisa Bart Brian Chafique Christian Claudia Denis Dylan Esteban Henry Jarod Loris Mark Mason PhyuPhyu Roman Steven Stuart Toby Tristan Will]
CATEGORIES = %W[chinese italian japanese french belgian]

def get_category(name)
  last_word = name.split.last.downcase
  CATEGORIES.include?(last_word) ? last_word : CATEGORIES.sample
end

puts "Creating Restaurants..."
  CHEFS.shuffle.each do |name|
    restaurant_name = Faker::Restaurant.unique.name
    Restaurant.create!(
    name: "#{CHEFS.sample}'s #{restaurant_name}",
    phone_number: "#{rand(10 ** 10)}",
    address: "#{rand(1..3)}-#{rand(1..11)} Meguro, Meguro ku, Tokyo, Japan",
    category: get_category(restaurant_name)
  )
  end
  # puts "Creating #{CHEFS.count} Restaurants..."
  # CHEFS.shuffle.each do |name|
  #   restaurant_name = Faker::Restaurant.unique.name
  #   Restaurant.create!(
  #     name: "#{name}'s #{restaurant_name}",
  #     address: "#{rand(1..3)}-#{rand(1..11)} Meguro, Meguro ku, Tokyo, Japan",
  #     category: get_category(restaurant_name)
  #   )
  # end
puts "... created #{Restaurant.count} restaurants"
