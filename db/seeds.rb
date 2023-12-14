# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Booking.destroy_all
Teapot.destroy_all
User.destroy_all

# User seed

user1 = User.create(first_name: "Jonathan", last_name: "Lagache", email: "jlagache@wanadoo.fr", password: "abc123")
user2 = User.create(first_name: "Ophélie", last_name: "Debranque", email: "odebranque@yahoo.fr", password: "def456")

# Teapot seed

teapot1 = Teapot.create(style: "Théière en céramique",
                        description: "Un véritable bijou de famille",
                        price_per_day: 3,
                        user: user1)

teapot2 = Teapot.create(style: "Théière en fonte",
                        description: "Solide, fiable et peu utilisée",
                        price_per_day: 2,
                        user: user1)

teapot3 = Teapot.create(style: "Théière en porcelaine émaillée",
                        description: "Une oeuvre d'art fonctionnelle et fabriquée à Limoges.",
                        price_per_day: 4,
                        user: user2)

teapot4 = Teapot.create(style: "Théière en terre cuite",
                        description: "Parfaite pour redonner du goût à vos préparations",
                        price_per_day: 1.5,
                        user: user1)

teapot5 = Teapot.create(style: "Théière en bambou",
                        description: "Plus solide qu'on ne le croit, et tendance !",
                        price_per_day: 3,
                        user: user2)

teapot6 = Teapot.create(style: "Théière en inox",
                        description: "Standard, mais tellement pratique.",
                        price_per_day: 1.5,
                        user: user2)

teapot7 = Teapot.create(style: "Théière en verre soufflé",
                        description: "Un artisanat d'exception, made in France.",
                        price_per_day: 5,
                        user: user2)

# Booking seed
