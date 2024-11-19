# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Art.destroy_all
User.destroy_all

 user1 = User.create!(email:"test1@test.com", password:"123456")
 user2 = User.create!(email:"test2@test.com", password:"123456")
 user3 = User.create!(email:"test3@test.com", password:"123456")
 user4 = User.create!(email:"test4@test.com", password:"123456")


 Art.create!(title:"La Joconde", category: "Peinture", creation_date: Date.new(1503, 1, 1), price: 500_000, name: "Leonardo da Vinci", user: user1 )
 Art.create!(title: "La Nuit étoilée", category: "Peinture", creation_date: Date.new(1889, 6, 1), price: 300_000, name: "Vincent van Gogh", user: user1)
 Art.create!(title: "Le Penseur", category: "Sculpture", creation_date: Date.new(1902, 1, 1), price: 150_000, name: "Auguste Rodin", user: user3)
 Art.create!(title: "Les Nymphéas", category: "Peinture", creation_date: Date.new(1920, 1, 1), price: 400_000, name: "Claude Monet", user: user3)
 Art.create!(title: "La Persistance de la mémoire", category: "Peinture", creation_date: Date.new(1931, 1, 1), price: 350_000, name: "Salvador Dalí", user: user4)
 Art.create!(title: "David", category: "Sculpture", creation_date: Date.new(1504, 1, 1), price: 600_000, name: "Michel-Ange", user: user2)
 Art.create!(title: "La Création d'Adam", category: "Fresque", creation_date: Date.new(1512, 1, 1), price: 700_000, name: "Michel-Ange", user: user2)
 Art.create!(title: "Guernica", category: "Peinture", creation_date: Date.new(1937, 1, 1), price: 450_000, name: "Pablo Picasso", user: user4)
 Art.create!(title: "Le Cri", category: "Peinture", creation_date: Date.new(1893, 1, 1), price: 280_000, name: "Edvard Munch", user: user2)
 Art.create!(title: "Les Demoiselles d'Avignon", category: "Peinture", creation_date: Date.new(1907, 1, 1), price: 500_000, name: "Pablo Picasso", user: user1)

 puts "Finished! Created #{Art.count} arts."
