# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'open-uri'

puts "Creating users"
# Usuarios
francisco_macias = User.create!(
  first_name: "Francisco",
  last_name: "Macias",
  telephone: "232-3456",
  email: "panchojmacias@gmail.com",
  address: "Arenales 3435, Buenos Aires, Argentina",
  password: "123456"
)
ana_cabral = User.create!(
  first_name: "Ana",
  last_name: "Cabral",
  telephone: "232-3456",
  email: "cabralana18@gmail.com",
  address: "Baez 626, Buenos Aires, Argentina",
  password: "123456"
)

sofia_alfaro = User.create!(
  first_name: "Sofia",
  last_name: "Alfaro",
  telephone: "232-3456",
  email: "sofiavapalfaro98@gmail.com",
  address: "Av. Cabildo 1234, Buenos Aires, Argentina",
  password: "123456"
)
puts "Users created successfully"

#Restaurants
puts "Creating restaurants"

restaurant1 = Restaurant.new(
  name: "Ristorante delizioso",
  address: "Av. Santa Fe 1234, Palermo, Buenos Aires, Argentina",
  opening_date: "",
  opening_time: "",
  user_id: sofia_alfaro.id
)

restaurant2 = Restaurant.new(
  name: "La Taquería auténtica",
  address: "Calle Defensa 567, San Telmo, Buenos Aires, Argentina",
  opening_date: "",
  opening_time: "",
  user_id: ana_cabral.id
)

restaurant3 = Restaurant.new(
  name: "Sabor del Este",
  address: "Av. Cabildo 890, Belgrano, Buenos Aires, Argentina",
  opening_date: "",
  opening_time: "",
  user_id: francisco_macias.id
)

restaurant4 = Restaurant.new(
  name: "Veggie Haven",
  address: "Calle Thames 456, Palermo, Buenos Aires, Argentina",
  opening_date: "",
  opening_time: "",
  user_id: sofia_alfaro.id
)

restaurant5 = Restaurant.new(
  name: "Carnes y Brasas",
  address: "Av. Corrientes 3456, Almagro, Buenos Aires, Argentina",
  opening_date: "",
  opening_time: "",
  user_id: ana_cabral.id
)

restaurant6 = Restaurant.new(
  name: "Pasta Paradiso",
  address: "Calle Scalabrini Ortiz 678, Villa Crespo, Buenos Aires, Argentina",
  opening_date: "",
  opening_time: "",
  user_id: francisco_macias.id
)

restaurant7 = Restaurant.new(
  name: "Tokyo Bites",
  address: "Av. Libertador 4321, Palermo, Buenos Aires, Argentina",
  opening_date: "",
  opening_time: "",
  user_id: ana_cabral.id
)

restaurant8 = Restaurant.new(
  name: "El Sazón Exótico",
  address: "Calle Bolívar 987, San Telmo, Buenos Aires, Argentina",
  opening_date: "",
  opening_time: "",
  user_id: sofia_alfaro.id
)

restaurant9 = Restaurant.new(
  name: "Green Leaf Eats",
  address: "Av. Las Heras 2101, Recoleta, Buenos Aires, Argentina",
  opening_date: "",
  opening_time: "",
  user_id: francisco_macias.id
)

restaurant10 = Restaurant.new(
  name: "BBQ Grill Master",
  address: "Calle Cerrito 1500, Retiro, Buenos Aires, Argentina",
  opening_date: "",
  opening_time: "",
  user_id: ana_cabral.id
)

plate1 = Plate.new(
  stock: "",
  categories: "",
  new_price: "",
  old_price: "",
  description: "",
  name: "",
  cooked_date: "",
  restaurant_id: 
)
