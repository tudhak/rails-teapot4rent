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

Booking.destroy_all
Teapot.destroy_all
User.destroy_all

puts "Destroying bookings..."
puts "Destroying teapots..."
puts "Destroying users..."

# User seed

puts "Creating users"

user1 = User.create(first_name: "Jonathan", last_name: "Lagache", email: "jlagache@wanadoo.fr", password: "abc123")
user1.photo.attach(io: URI.open("https://images.pexels.com/photos/769772/pexels-photo-769772.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                      filename: "user1.jpg", content_type: "image/jpg")


user2 = User.create(first_name: "Ophélie", last_name: "Debranque", email: "odebranque@yahoo.fr", password: "def456")
user2.photo.attach(io: URI.open("https://images.pexels.com/photos/5876695/pexels-photo-5876695.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                      filename: "user1.jpg", content_type: "image/jpg")

puts "Users successfully created."

# Teapot seed

puts "Creating teapots"

teapot1 = Teapot.create(style: "Théière en céramique",
                        description: "Un véritable bijou de famille",
                        price_per_day: 3,
                        user: user1)

teapot1.photos.attach(io: URI.open("https://templedujapon.com/cdn/shop/files/theiere_japonaise_en_ceramique_jour_de_pluie-5_1024x1024.jpg?v=1700132395"),
                      filename: "ceramique.jpg", content_type: "image/jpg")

teapot2 = Teapot.create(style: "Théière en fonte",
                        description: "Solide, fiable et peu utilisée",
                        price_per_day: 2,
                        user: user1)

teapot2.photos.attach(io: URI.open("https://www.natureetdecouvertes.com/fstrz/r/s/cache.natureetdecouvertes.com/Medias/Images/Articles/61182200/th-i-re-japonaise-en-fonte-brune-61182200_2.jpg?width=610&height=610&frz-v=651"),
                      filename: "fonte.jpg", content_type: "image/jpg")

teapot3 = Teapot.create(style: "Théière en porcelaine émaillée",
                        description: "Une oeuvre d'art fonctionnelle et fabriquée à Limoges.",
                        price_per_day: 4,
                        user: user2)

teapot3.photos.attach(io: URI.open("https://www.bunzlaucastle.fr/media/catalog/product/cache/a1a3acfc3f54534c4a12a7cb7abe57fb/1/4/1444_2068_2d01.png"),
                      filename: "porcelaine.png", content_type: "image/png")

teapot4 = Teapot.create(style: "Théière en terre cuite",
                        description: "Parfaite pour redonner du goût à vos préparations",
                        price_per_day: 1.5,
                        user: user1)

teapot4.photos.attach(io: URI.open("https://www.yoshien.com/media/catalog/product/cache/7717006f8b243e1d1a78a01c4d692f07/4/8/4887_theiere-yixing-chine-xi-shi-zi-ni-200ml_fr_product-main-thumbnail-1.jpg"),
                      filename: "terre.jpg", content_type: "image/jpg")

teapot5 = Teapot.create(style: "Théière en bambou",
                        description: "Plus solide qu'on ne le croit, et tendance !",
                        price_per_day: 3,
                        user: user2)

teapot5.photos.attach(io: URI.open("https://www.natureetdecouvertes.com/fstrz/r/s/cache.natureetdecouvertes.com/Medias/Images/Articles/61187970/61187970-th-i-re-tiao-beige_P1.jpg?width=610&height=610&frz-v=651"),
                      filename: "bambou.jpg", content_type: "image/jpg")

teapot6 = Teapot.create(style: "Théière en inox",
                        description: "Standard, mais tellement pratique.",
                        price_per_day: 1.5,
                        user: user2)

teapot6.photos.attach(io: URI.open("https://veohome.com/wp-content/uploads/2021/11/500_ml.jpg"),
                      filename: "inox.jpg", content_type: "image/jpg")

teapot7 = Teapot.create(style: "Théière en verre soufflé",
                        description: "Un artisanat d'exception, made in France.",
                        price_per_day: 5,
                        user: user2)

teapot7.photos.attach(io: URI.open("https://templedujapon.com/cdn/shop/files/theiere_en_verre_japonaise_moderne-4_1024x1024.jpg?v=1700128576"),
                      filename: "verre.jpg", content_type: "image/jpg")

puts "Teapots successfully created."

# Booking seed
