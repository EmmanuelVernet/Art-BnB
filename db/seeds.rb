# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "open-uri"
Art.destroy_all
User.destroy_all

 user1 = User.create!(email:"test1@test.com", password:"123456")
 user2 = User.create!(email:"test2@test.com", password:"123456")
 user3 = User.create!(email:"test3@test.com", password:"123456")
 user4 = User.create!(email:"test4@test.com", password:"123456")


 joconde = Art.create!(title:"La Joconde", category: "Peinture", creation_date: Date.new(1503, 1, 1), price: 500_000, name: "Leonardo da Vinci", user: user1 )
 nuit = Art.create!(title: "La Nuit étoilée", category: "Peinture", creation_date: Date.new(1889, 6, 1), price: 300_000, name: "Vincent van Gogh", user: user1)
 penseur = Art.create!(title: "Le Penseur", category: "Sculpture", creation_date: Date.new(1902, 1, 1), price: 150_000, name: "Auguste Rodin", user: user3)
 nymphéas = Art.create!(title: "Les Nymphéas", category: "Peinture", creation_date: Date.new(1920, 1, 1), price: 400_000, name: "Claude Monet", user: user3)
 persistance = Art.create!(title: "La Persistance de la mémoire", category: "Peinture", creation_date: Date.new(1931, 1, 1), price: 350_000, name: "Salvador Dalí", user: user4)
 david = Art.create!(title: "David", category: "Sculpture", creation_date: Date.new(1504, 1, 1), price: 600_000, name: "Michel-Ange", user: user2)
 creation = Art.create!(title: "La Création d'Adam", category: "Fresque", creation_date: Date.new(1512, 1, 1), price: 700_000, name: "Michel-Ange", user: user2)
 guernica = Art.create!(title: "Guernica", category: "Peinture", creation_date: Date.new(1937, 1, 1), price: 450_000, name: "Pablo Picasso", user: user4)
 cri = Art.create!(title: "Le Cri", category: "Peinture", creation_date: Date.new(1893, 1, 1), price: 280_000, name: "Edvard Munch", user: user2)
 demoiselles = Art.create!(title: "Les Demoiselles d'Avignon", category: "Peinture", creation_date: Date.new(1907, 1, 1), price: 500_000, name: "Pablo Picasso", user: user1)

 file1 = URI.parse("https://cdn.pariscityvision.com/library/image/5449.jpg").open
 joconde.photo.attach(io: file1, filename: "nes.png", content_type: "image/png")
 joconde.save!

 file2 = URI.parse("https://upload.wikimedia.org/wikipedia/commons/thumb/e/ea/Van_Gogh_-_Starry_Night_-_Google_Art_Project.jpg/390px-Van_Gogh_-_Starry_Night_-_Google_Art_Project.jpg").open
 nuit.photo.attach(io: file2, filename: "nes.png", content_type: "image/png")
 nuit.save!

 file3 = URI.parse("https://upload.wikimedia.org/wikipedia/commons/c/c5/Le_Penseur_in_the_Jardin_du_Mus%C3%A9e_Rodin%2C_Paris_March_2014.jpg").open
 penseur.photo.attach(io: file3, filename: "nes.png", content_type: "image/png")
 penseur.save!

 file4 = URI.parse("https://cdn.mediatheque.epmoo.fr/link/3c9igq/lvv1aputke5xbj4.jpg").open
 nymphéas.photo.attach(io: file4, filename: "nes.png", content_type: "image/png")
 nymphéas.save!

 file5 = URI.parse("https://www.museumtv.art/wp-content/uploads/2021/05/E5EA565D-7ADE-43FF-B762-844F60CFAE23-1024x778.jpeg").open
 persistance.photo.attach(io: file5, filename: "nes.png", content_type: "image/png")
 persistance.save!

 file6 = URI.parse("https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Michelangelo%27s_David_-_right_view_2.jpg/1200px-Michelangelo%27s_David_-_right_view_2.jpg").open
 david.photo.attach(io: file6, filename: "nes.png", content_type: "image/png")
 david.save!

 file7 = URI.parse("https://upload.wikimedia.org/wikipedia/commons/thumb/e/e0/Creaci%C3%B3n_de_Ad%C3%A1n.jpg/1200px-Creaci%C3%B3n_de_Ad%C3%A1n.jpg").open
 creation.photo.attach(io: file7, filename: "nes.png", content_type: "image/png")
 creation.save!

 file8 = URI.parse("https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Mural_del_Gernika.jpg/390px-Mural_del_Gernika.jpg").open
 guernica.photo.attach(io: file8, filename: "nes.png", content_type: "image/png")
 guernica.save!

 file9 = URI.parse("https://upload.wikimedia.org/wikipedia/commons/thumb/c/c5/Edvard_Munch%2C_1893%2C_The_Scream%2C_oil%2C_tempera_and_pastel_on_cardboard%2C_91_x_73_cm%2C_National_Gallery_of_Norway.jpg/1200px-Edvard_Munch%2C_1893%2C_The_Scream%2C_oil%2C_tempera_and_pastel_on_cardboard%2C_91_x_73_cm%2C_National_Gallery_of_Norway.jpg").open
 cri.photo.attach(io: file9, filename: "nes.png", content_type: "image/png")
 cri.save!

 file10 = URI.parse("https://img.over-blog.com/478x500/2/89/06/71/Art-moderne/Picasso-les-demoiselles-d-avignon.jpg").open
 demoiselles.photo.attach(io: file10, filename: "nes.png", content_type: "image/png")
 demoiselles.save!


 puts "Finished! Created #{Art.count} arts."
