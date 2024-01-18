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
puts "Cleaning the database"
Review.destroy_all
Checkout.destroy_all
Cart.destroy_all
Selectedplate.destroy_all
CategoryPlate.destroy_all
Category.destroy_all
Plate.destroy_all
Restaurant.destroy_all
User.destroy_all
puts "Database cleaned"

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
avatar1 = URI.open("https://avatars.githubusercontent.com/u/106785762?v=4")
francisco_macias.photo.attach(io: avatar1, filename: 'avatar1.png', content_type: 'image/png')
francisco_macias.save!

ana_cabral = User.create!(
  first_name: "Ana",
  last_name: "Cabral",
  telephone: "232-3456",
  email: "cabralana18@gmail.com",
  address: "Baez 626, Buenos Aires, Argentina",
  password: "123456"
)
avatar2 = URI.open("https://avatars.githubusercontent.com/u/146119016?v=4")
ana_cabral.photo.attach(io: avatar2, filename: 'avatar2.png', content_type: 'image/png')
ana_cabral.save!

sofia_alfaro = User.create!(
  first_name: "Sofia",
  last_name: "Alfaro",
  telephone: "232-3456",
  email: "sofiavapalfaro98@gmail.com",
  address: "Av. Cabildo 1234, Buenos Aires, Argentina",
  password: "123456"
)
avatar3 = URI.open("https://avatars.githubusercontent.com/u/148254339?v=4")
sofia_alfaro.photo.attach(io: avatar3, filename: 'avatar3.png', content_type: 'image/png')
sofia_alfaro.save!
puts "Users created successfully"

sofia_garcia = User.create!(
  first_name: "Sofia",
  last_name: "Garcia",
  telephone: "232-3458",
  email: "sofiagarcia@gmail.com",
  address: "Arce 560, Buenos Aires, Argentina",
  password: "123456"
)
avatar4 = URI.open("https://avatars.githubusercontent.com/u/148254339?v=4")
sofia_garcia.photo.attach(io: avatar4, filename: 'avatar3.png', content_type: 'image/png')
sofia_garcia.save!
puts "Users created successfully"

#Restaurants
puts "Creating restaurants"

restaurant1 = Restaurant.create!(
  name: "Ristorante delizioso",
  address: "Av. Santa Fe 1234, Palermo, Buenos Aires, Argentina",
  opening_date: "Monday-Sunday",
  opening_time: "11am-11pm",
  user_id: sofia_alfaro.id
)
photorestaurant1 = URI.open("https://images.unsplash.com/photo-1587085416963-22efba033dd5?q=80&w=2748&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
restaurant1.photo.attach(io: photorestaurant1, filename: 'photorestaurant1.png', content_type: 'image/png')
restaurant1.save!

restaurant2 = Restaurant.create!(
  name: "La Taquería auténtica",
  address: "Calle Defensa 567, San Telmo, Buenos Aires, Argentina",
  opening_date: "Tuesday-Sunday",
  opening_time: "12pm-10pm",
  user_id: ana_cabral.id
)
photorestaurant2 = URI.open("https://images.unsplash.com/photo-1582234383980-59933689fb44?q=80&w=2680&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
restaurant2.photo.attach(io: photorestaurant2, filename: 'photorestaurant2.png', content_type: 'image/png')
restaurant2.save!


restaurant3 = Restaurant.create!(
  name: "Sabor del Este",
  address: "Av. Cabildo 890, Belgrano, Buenos Aires, Argentina",
  opening_date: "Monday-Saturday",
  opening_time: "8am-5pm",
  user_id: francisco_macias.id
)
photorestaurant3 = URI.open("https://images.unsplash.com/photo-1587241321921-91a834d6d191?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
restaurant3.photo.attach(io: photorestaurant3, filename: 'photorestaurant3.png', content_type: 'image/png')
restaurant3.save!

restaurant4 = Restaurant.create!(
  name: "Veggie Haven",
  address: "Calle Thames 456, Palermo, Buenos Aires, Argentina",
  opening_date: "Monday-Sunday",
  opening_time: "9am-6pm",
  user_id: sofia_alfaro.id
)
photorestaurant4 = URI.open("https://images.unsplash.com/photo-1562215179-c938ed0995cf?q=80&w=2748&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
restaurant4.photo.attach(io: photorestaurant4, filename: 'photorestaurant4.png', content_type: 'image/png')
restaurant4.save!

restaurant5 = Restaurant.create!(
  name: "Carnes y Brasas",
  address: "Av. Corrientes 3456, Almagro, Buenos Aires, Argentina",
  opening_date: "Wednesday-Sunday",
  opening_time: "1pm-12am",
  user_id: ana_cabral.id
)
photorestaurant5 = URI.open("https://images.unsplash.com/photo-1576787498994-63269e082a29?q=80&w=2671&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
restaurant5.photo.attach(io: photorestaurant5, filename: 'photorestaurant5.png', content_type: 'image/png')
restaurant5.save!

restaurant6 = Restaurant.create!(
  name: "Pasta Paradiso",
  address: "Calle Scalabrini Ortiz 678, Villa Crespo, Buenos Aires, Argentina",
  opening_date: "Monday-Friday",
  opening_time: "11am-11pm",
  user_id: francisco_macias.id
)
photorestaurant6 = URI.open("https://images.unsplash.com/photo-1585002400872-ec6f400e56b8?q=80&w=2760&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
restaurant6.photo.attach(io: photorestaurant6, filename: 'photorestaurant6.png', content_type: 'image/png')
restaurant6.save!


restaurant7 = Restaurant.create!(
  name: "Tokyo Bites",
  address: "Av. Libertador 4321, Palermo, Buenos Aires, Argentina",
  opening_date: "Tuesday-Saturday",
  opening_time: "6pm-11pm",
  user_id: ana_cabral.id
)
photorestaurant7 = URI.open("https://plus.unsplash.com/premium_photo-1668146932065-d08643791942?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fHN1c2hpJTIwcmVzdGF1cmFudHxlbnwwfDB8MHx8fDA%3D")
restaurant7.photo.attach(io: photorestaurant7, filename: 'photorestaurant7.png', content_type: 'image/png')
restaurant7.save!


restaurant8 = Restaurant.create!(
  name: "El Sazón Exótico",
  address: "Calle Bolívar 987, San Telmo, Buenos Aires, Argentina",
  opening_date: "Monday-Thursday",
  opening_time: "10am-10pm",
  user_id: sofia_alfaro.id
)
photorestaurant8 = URI.open("https://plus.unsplash.com/premium_photo-1669150852127-2435412047f2?q=80&w=2834&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
restaurant8.photo.attach(io: photorestaurant8, filename: 'photorestaurant8.png', content_type: 'image/png')
restaurant8.save!

restaurant9 = Restaurant.create!(
  name: "Kaime",
  address: "Av. Las Heras 2101, Recoleta, Buenos Aires, Argentina",
  opening_date: "Friday-Monday",
  opening_time: "10am-4pm",
  user_id: francisco_macias.id
)
photorestaurant9 = URI.open("https://images.unsplash.com/photo-1464979681340-bdd28a61699e?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
restaurant9.photo.attach(io: photorestaurant9, filename: 'photorestaurant9.png', content_type: 'image/png')
restaurant9.save!

restaurant10 = Restaurant.create!(
  name: "BBQ Grill Master",
  address: "Calle Cerrito 1500, Retiro, Buenos Aires, Argentina",
  opening_date: "Monday-Sunday",
  opening_time: "4pm-12am",
  user_id: ana_cabral.id
)
photorestaurant10 = URI.open("https://images.unsplash.com/photo-1552604617-eea98aa27234?q=80&w=2826&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
restaurant10.photo.attach(io: photorestaurant10, filename: 'photorestaurant10.png', content_type: 'image/png')
restaurant10.save!

# Additional Restaurants in Argentina

restaurant11 = Restaurant.create!(
  name: "Parrilla del Norte",
  address: "Av. Belgrano 789, Buenos Aires, Argentina",
  opening_date: "Monday-Sunday",
  opening_time: "12pm-10pm",
  user_id: sofia_alfaro.id
)
photorestaurant11 = URI.open("https://images.unsplash.com/photo-1508615263227-c5d58c1e5821?q=80&w=3024&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
restaurant11.photo.attach(io: photorestaurant11, filename: 'photorestaurant11.png', content_type: 'image/png')
restaurant11.save!

restaurant12 = Restaurant.create!(
  name: "El Fogón Patagónico",
  address: "Calle San Martín 456, Buenos Aires, Argentina",
  opening_date: "Tuesday-Saturday",
  opening_time: "11am-9pm",
  user_id: ana_cabral.id
)
photorestaurant12 = URI.open("https://images.unsplash.com/photo-1622715395504-2a802893a0f9?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
restaurant12.photo.attach(io: photorestaurant12, filename: 'photorestaurant12.png', content_type: 'image/png')
restaurant12.save!

restaurant13 = Restaurant.create!(
  name: "Sabores Cuyanos",
  address: "Av. San Juan 890, Buenos Aires, Argentina",
  opening_date: "Wednesday-Sunday",
  opening_time: "1pm-10pm",
  user_id: francisco_macias.id
)
photorestaurant13 = URI.open("https://images.unsplash.com/photo-1467003909585-2f8a72700288?q=80&w=2912&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
restaurant13.photo.attach(io: photorestaurant13, filename: 'photorestaurant13.png', content_type: 'image/png')
restaurant13.save!

restaurant14 = Restaurant.create!(
  name: "Empanadas del Norte",
  address: "Calle Mitre 789, Buenos Aires, Argentina",
  opening_date: "Monday-Sunday",
  opening_time: "12pm-11pm",
  user_id: sofia_alfaro.id
)
photorestaurant14 = URI.open("https://images.unsplash.com/photo-1619926096619-5956ab4dfb1b?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
restaurant14.photo.attach(io: photorestaurant14, filename: 'photorestaurant14.png', content_type: 'image/png')
restaurant14.save!

restaurant15 = Restaurant.create!(
  name: "Sushi Roll Bar",
  address: "Av. Pellegrini 1200, Buenos Aires, Argentina",
  opening_date: "Wednesday-Friday",
  opening_time: "1pm-10pm",
  user_id: ana_cabral.id
)
photorestaurant15 = URI.open("https://images.unsplash.com/photo-1617196034183-421b4917c92d?q=80&w=2976&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
restaurant15.photo.attach(io: photorestaurant15, filename: 'photorestaurant15.png', content_type: 'image/png')
restaurant15.save!

restaurant16 = Restaurant.create!(
  name: "Dulces Tucumanos",
  address: "Calle 9 de Julio 678, San Miguel de Tucumán, Argentina",
  opening_date: "Monday-Sunday",
  opening_time: "10am-8pm",
  user_id: francisco_macias.id
)
photorestaurant16 = URI.open("https://images.unsplash.com/photo-1470124182917-cc6e71b22ecc?q=80&w=2970&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
restaurant16.photo.attach(io: photorestaurant16, filename: 'photorestaurant16.png', content_type: 'image/png')
restaurant16.save!

restaurant17 = Restaurant.create!(
  name: "El Buen Asado",
  address: "Av. López y Planes 432, Buenos Aires, Argentina",
  opening_date: "Tuesday-Saturday",
  opening_time: "6pm-11pm",
  user_id: ana_cabral.id
)
photorestaurant17 = URI.open("https://images.unsplash.com/photo-1594041680534-e8c8cdebd659?q=80&w=2367&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
restaurant17.photo.attach(io: photorestaurant17, filename: 'photorestaurant17.png', content_type: 'image/png')
restaurant17.save!

restaurant18 = Restaurant.create!(
  name: "La Cabaña Mendocina",
  address: "Calle San Martín 123, Buenos Aires, Argentina",
  opening_date: "Monday-Friday",
  opening_time: "11am-9pm",
  user_id: sofia_alfaro.id
)
photorestaurant18 = URI.open("https://images.unsplash.com/photo-1511690656952-34342bb7c2f2?q=80&w=2864&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
restaurant18.photo.attach(io: photorestaurant18, filename: 'photorestaurant18.png', content_type: 'image/png')
restaurant18.save!

restaurant19 = Restaurant.create!(
  name: "Delicias Jujuyanas",
  address: "Av. Belgrano 567, Buenos Aires, Argentina",
  opening_date: "Monday-Sunday",
  opening_time: "12pm-10pm",
  user_id: ana_cabral.id
)
photorestaurant19 = URI.open("https://images.unsplash.com/photo-1604953781841-004f1848ed3d?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
restaurant19.photo.attach(io: photorestaurant19, filename: 'photorestaurant19.png', content_type: 'image/png')
restaurant19.save!

restaurant20 = Restaurant.create!(
  name: "Mariscos del Paraná",
  address: "Calle Corrientes 1500, Buenos Aires, Argentina",
  opening_date: "Tuesday-Sunday",
  opening_time: "1pm-11pm",
  user_id: francisco_macias.id
)
photorestaurant20 = URI.open("https://images.unsplash.com/photo-1559742811-822873691df8?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
restaurant20.photo.attach(io: photorestaurant20, filename: 'photorestaurant20.png', content_type: 'image/png')
restaurant20.save!


restaurant21 = Restaurant.create!(
  name: "Thai Delight",
  address: "Calle Thailandia 123, Buenos Aires, Argentina",
  opening_date: "Wednesday-Sunday",
  opening_time: "5pm-11pm",
  user_id: ana_cabral.id
)
photorestaurant21 = URI.open("https://images.unsplash.com/photo-1583475020839-105dddecc00a?q=80&w=2671&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
restaurant21.photo.attach(io: photorestaurant21, filename: 'photorestaurant21.png', content_type: 'image/png')
restaurant21.save!


restaurant22 = Restaurant.create!(
  name: "MexiCuisine",
  address: "Av. Mexico 567, Buenos Aires, Argentina",
  opening_date: "Monday-Saturday",
  opening_time: "12pm-9pm",
  user_id: ana_cabral.id
)
photorestaurant22 = URI.open("https://plus.unsplash.com/premium_photo-1676466896858-f1b496f2a779?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
restaurant22.photo.attach(io: photorestaurant22, filename: 'photorestaurant22.png', content_type: 'image/png')
restaurant22.save!


restaurant23 = Restaurant.create!(
  name: "Green Eats",
  address: "Calle Veggie 789, Buenos Aires, Argentina",
  opening_date: "Sunday-Thursday",
  opening_time: "10am-8pm",
  user_id: ana_cabral.id
)
photorestaurant23 = URI.open("https://images.unsplash.com/photo-1498837167922-ddd27525d352?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
restaurant23.photo.attach(io: photorestaurant23, filename: 'photorestaurant23.png', content_type: 'image/png')
restaurant23.save!


restaurant24 = Restaurant.create!(
  name: "Mamma's Pizzeria",
  address: "Av. Scalabrini Ortiz 456, Buenos Aires, Argentina",
  opening_date: "Monday-Sunday",
  opening_time: "11am-10pm",
  user_id: ana_cabral.id
)
photorestaurant24 = URI.open("https://images.unsplash.com/photo-1558138838-76294be30005?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
restaurant24.photo.attach(io: photorestaurant24, filename: 'photorestaurant24.png', content_type: 'image/png')
restaurant24.save!

restaurant25 = Restaurant.create!(
  name: "Sushi Haven",
  address: "Calle Sushiman 789, Buenos Aires, Argentina",
  opening_date: "Tuesday-Sunday",
  opening_time: "6pm-11pm",
  user_id: ana_cabral.id
)
photorestaurant25 = URI.open("https://plus.unsplash.com/premium_photo-1675278298876-9f988904907c?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
restaurant25.photo.attach(io: photorestaurant25, filename: 'photorestaurant25.png', content_type: 'image/png')
restaurant25.save!



#Plates
puts "Creating plates"

plate1 = Plate.new(
  name: "Lasagna al Forno",
  restaurant_id: restaurant1.id,
  cooked_date: Date.today - rand(0..5),
  stock: 3,
  new_price: 11.50,
  old_price: 15.00,
  description: "Hearty baked lasagna, a comforting classic with layers of pasta, rich meat sauce, and melted cheese."
)
file1 = URI.open("https://images.unsplash.com/photo-1588047750516-f846a13ff314?q=80&w=2592&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
plate1.photo.attach(io: file1, filename: 'plate1.png', content_type: 'image/png')
plate1.save!

plate2 = Plate.new(
  name: "Pizza Margherita",
  restaurant_id: restaurant1.id,
  cooked_date: Date.today - rand(0..5),
  stock: 6,
  new_price: 8.00,
  old_price: 13.50,
  description: "Classic Margherita: Tomato, mozzarella, basil - a timeless pizza perfection."
)
file2 = URI.open("https://images.unsplash.com/photo-1574071318508-1cdbab80d002?q=80&w=2669&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
plate2.photo.attach(io: file2, filename: 'plate2.png', content_type: 'image/png')
plate2.save!

plate3 = Plate.new(
  name: "Pizza Quattro Formaggi",
  restaurant_id: restaurant1.id,
  cooked_date: Date.today - rand(0..5),
  stock: 4,
  new_price: 9.50,
  old_price: 15.50,
  description: "Four-cheese delight, a harmony of rich flavors on every slice."
)
file3 = URI.open("https://images.unsplash.com/photo-1620374645498-af6bd681a0bd?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
plate3.photo.attach(io: file3, filename: 'plate3.png', content_type: 'image/png')
plate3.save!

plate4 = Plate.new(
  name: "Surprise Taco",
  restaurant_id: restaurant2.id,
  cooked_date: Date.today - rand(0..5),
  stock: 8,
  new_price: 5.50,
  old_price: 10.00,
  description: "Daily-inspired flavors in every bite, a delightful surprise for your taste buds."
)
file4 = URI.open("https://images.unsplash.com/photo-1579888944880-d98341245702?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
plate4.photo.attach(io: file4, filename: 'plate4.png', content_type: 'image/png')
plate4.save!

plate5 = Plate.new(
  name: "Pollo & Queso Taco",
  restaurant_id: restaurant2.id,
  cooked_date: Date.today - rand(0..5),
  stock: 2,
  new_price: 7.00,
  old_price: 10.00,
  description: "Succulent chicken and melted cheese, with crunchy chips; prepare for a fiesta in every bite."
)
file5 = URI.open("https://plus.unsplash.com/premium_photo-1685314943840-80c0ad6ba886?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
plate5.photo.attach(io: file5, filename: 'plate5.png', content_type: 'image/png')
plate5.save!


plate6 = Plate.new(
  name: "Mexican Pizza w/ Salsa Verde",
  restaurant_id: restaurant2.id,
  cooked_date: Date.today - rand(0..5),
  stock: 3,
  new_price: 8.00,
  old_price: 12.00,
  description: "Pizza Mexicana con Salsa Verde: Vibrant flavors with spicy kick, a taste of Mexico on your plate."
)
file6 = URI.open("https://images.unsplash.com/photo-1641244942334-ce44db547cec?q=80&w=2748&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
plate6.photo.attach(io: file6, filename: 'plate6.png', content_type: 'image/png')
plate6.save!

plate7 = Plate.new(
  name: "Spaghetti Carbonara",
  restaurant_id: restaurant6.id,
  cooked_date: Date.today - rand(0..5),
  stock: 6,
  new_price: 6.00,
  old_price: 8.50,
  description: "Classic Roman delight, al dente pasta with creamy egg, pancetta, and Parmesan."
)
file7 = URI.open("https://images.unsplash.com/photo-1612874742237-6526221588e3?q=80&w=2671&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
plate7.photo.attach(io: file7, filename: 'plate7.png', content_type: 'image/png')
plate7.save!


plate8 = Plate.new(
  name: "Penne w/ Pesto Genovese",
  restaurant_id: restaurant6.id,
  cooked_date: Date.today - rand(0..5),
  stock: 7,
  new_price: 7.00,
  old_price: 10.50,
  description: "Fresh basil, garlic, and pine nuts blended into a flavorful Genovese pesto."
)
file8 = URI.open("https://images.unsplash.com/photo-1673081849734-98f0969d436b?q=80&w=2650&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
plate8.photo.attach(io: file8, filename: 'plate8.png', content_type: 'image/png')
plate8.save!

plate9 = Plate.new(
  name: "Vegetarian Pizza w/ mushrooms",
  restaurant_id: restaurant6.id,
  cooked_date: Date.today - rand(0..5),
  stock: 4,
  new_price: 5.00,
  old_price: 8.50,
  description: "Mouthwatering veggie delight with roasted mushrooms on a thin, crispy crust."
)
file9 = URI.open("https://unsplash.com/photos/a-slice-of-pizza-with-mushrooms-and-other-toppings-mEOLd8sxBtk")
plate9.photo.attach(io: file9, filename: 'plate9.png', content_type: 'image/png')
plate9.save!


plate10 = Plate.new(
  name: "Pastry selection",
  restaurant_id: restaurant3.id,
  cooked_date: Date.today - rand(0..5),
  stock: 12,
  new_price: 3.00,
  old_price: 6.50,
  description: "Indulge in our delightful pastry selection featuring a mouthwatering Tres Leches Cake a delightful assortment of sweet treats and surprises to satisfy your cravings."
)
file10 = URI.open("https://images.unsplash.com/photo-1483695028939-5bb13f8648b0?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
plate10.photo.attach(io: file10, filename: 'plate10.png', content_type: 'image/png')
plate10.save!

plate11 = Plate.new(
  name: "Falafel Wrap w/ Hummus",
  restaurant_id: restaurant4.id,
  cooked_date: Date.today - rand(0..5),
  stock: 5,
  new_price: 4.00,
  old_price: 7.50,
  description: "Savor the goodness of falafel and creamy hummus in a delightful wrap."
)
file11 = URI.open("https://images.pexels.com/photos/6546022/pexels-photo-6546022.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")
plate11.photo.attach(io: file11, filename: 'plate11.png', content_type: 'image/png')
plate11.save!

plate12 = Plate.new(
  name: "Strip Roast with Chimichurri",
  restaurant_id: restaurant5.id,
  cooked_date: Date.today - rand(0..5),
  stock: 4,
  new_price: 16.00,
  old_price: 25.50,
  description: "Indulge in the rich flavors of Tira steak, grilled to perfection, with chimichurri."
)
file12 = URI.open("https://images.pexels.com/photos/1251208/pexels-photo-1251208.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")
plate12.photo.attach(io: file12, filename: 'plate12.png', content_type: 'image/png')
plate12.save!

plate13 = Plate.new(
  name: "Surprise Sushi Rolls",
  restaurant_id: restaurant7.id,
  cooked_date: Date.today - rand(0..5),
  stock: 14,
  new_price: 6.50,
  old_price: 12.00,
  description: "Diverse sushi rolls, a symphony of fresh flavors and textures in every bite."
)
file13 = URI.open("https://images.unsplash.com/photo-1553621042-f6e147245754?q=80&w=2650&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
plate13.photo.attach(io: file13, filename: 'plate13.png', content_type: 'image/png')
plate13.save!

plate14 = Plate.new(
  name: "Couscous with Vegetables and Curry Chickpeas",
  restaurant_id: restaurant8.id,
  cooked_date: Date.today - rand(0..5),
  stock: 3,
  new_price: 7.50,
  old_price: 13.00,
  description: "Diverse sushi rolls, a symphony of fresh flavors and textures in every bite."
)
file14 = URI.open("https://unsplash.com/photos/rice-with-green-leaf-vegetable-on-white-ceramic-plate-RELOvb0rrCE")
plate14.photo.attach(io: file14, filename: 'plate14.png', content_type: 'image/png')
plate14.save!

plate15 = Plate.new(
  name: "Assorted Cookies",
  restaurant_id: restaurant9.id,
  cooked_date: Date.today - rand(0..5),
  stock: 10,
  new_price: 2.00,
  old_price: 5.50,
  description: "Indulge your senses with a kaleidoscope of cookies, each meticulously crafted to perfection."
)
file15 = URI.open("https://unsplash.com/photos/flatbread-display-store-RwjciZ9JEfg")
plate15.photo.attach(io: file15, filename: 'plate15.png', content_type: 'image/png')
plate15.save!

plate16 = Plate.new(
  name: "Barbecue Ribs with Mashed Sweet Potatoes",
  restaurant_id: restaurant10.id,
  cooked_date: Date.today - rand(0..5),
  stock: 4,
  new_price: 12.00,
  old_price: 22.50,
  description: "Succulent BBQ ribs paired with sweet potato puree, a smoky-sweet delight."
)
file16 = URI.open("https://unsplash.com/photos/a-close-up-of-a-fish-on-a-cutting-board-m2qIYZXyGbs")
plate16.photo.attach(io: file16, filename: 'plate16.png', content_type: 'image/png')
plate16.save!

plate17 = Plate.new(
  name: "Norteño Grilled Steak",
  restaurant_id: restaurant11.id,
  cooked_date: Date.today - rand(0..5),
  stock: 6,
  new_price: 15.00,
  old_price: 28.00,
  description: "A hearty grilled steak with traditional Northern flavors, a Parrilla del Norte specialty."
)
file17 = URI.open("https://images.unsplash.com/photo-1687877723436-061cc6e37fe8?q=80&w=2334&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
plate17.photo.attach(io: file17, filename: 'plate17.png', content_type: 'image/png')
plate17.save!

plate18 = Plate.new(
  name: "Patagonian Lamb Skewers",
  restaurant_id: restaurant12.id,
  cooked_date: Date.today - rand(0..5),
  stock: 5,
  new_price: 14.50,
  old_price: 26.00,
  description: "Tender lamb skewers seasoned Patagonian style, a must-try at El Fogón Patagónico."
)
file18 = URI.open("https://images.unsplash.com/photo-1687795798426-b62055363dc0?q=80&w=2970&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
plate18.photo.attach(io: file18, filename: 'plate18.png', content_type: 'image/png')
plate18.save!

plate19 = Plate.new(
  name: "Cuyano Beef Stew",
  restaurant_id: restaurant13.id,
  cooked_date: Date.today - rand(0..5),
  stock: 8,
  new_price: 12.50,
  old_price: 24.00,
  description: "A hearty beef stew inspired by the flavors of Cuyo, served at Sabores Cuyanos."
)
file19 = URI.open("https://images.unsplash.com/photo-1608500219063-e5164085cd6f?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
plate19.photo.attach(io: file19, filename: 'plate19.png', content_type: 'image/png')
plate19.save!

plate20 = Plate.new(
  name: "Noroeste Empanada Platter",
  restaurant_id: restaurant14.id,
  cooked_date: Date.today - rand(0..5),
  stock: 7,
  new_price: 11.00,
  old_price: 21.50,
  description: "A delightful platter of empanadas showcasing the flavors of the Northwest, served at Empanadas del Noroeste."
)
file20 = URI.open("https://images.unsplash.com/photo-1609525313344-a56b96f20718?q=80&w=2980&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
plate20.photo.attach(io: file20, filename: 'plate20.png', content_type: 'image/png')
plate20.save!

plate21 = Plate.new(
  name: "Sushi Rolls Sampler",
  restaurant_id: restaurant15.id,
  cooked_date: Date.today - rand(0..5),
  stock: 9,
  new_price: 16.50,
  old_price: 30.00,
  description: "An exquisite sampler of sushi rolls from Sushi Roll Bar, featuring a variety of flavors and textures."
)
file21 = URI.open("https://images.unsplash.com/photo-1553621042-f6e147245754?q=80&w=2825&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
plate21.photo.attach(io: file21, filename: 'plate21.png', content_type: 'image/png')
plate21.save!

plate22 = Plate.new(
  name: "Tucuman Sweet Delights Platter",
  restaurant_id: restaurant16.id,
  cooked_date: Date.today - rand(0..5),
  stock: 6,
  new_price: 13.00,
  old_price: 25.50,
  description: "A platter featuring the sweet delights of Tucumán, a specialty at Dulces Tucumanos."
)
file22 = URI.open("https://images.unsplash.com/photo-1485745655111-3272a37e76a5?q=80&w=2916&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
plate22.photo.attach(io: file22, filename: 'plate22.png', content_type: 'image/png')
plate22.save!

plate23 = Plate.new(
  name: "Asado Feast",
  restaurant_id: restaurant17.id,
  cooked_date: Date.today - rand(0..5),
  stock: 10,
  new_price: 20.00,
  old_price: 35.50,
  description: "A grand feast of Argentinian asado, a signature dish at El Buen Asado."
)
file23 = URI.open("https://plus.unsplash.com/premium_photo-1663036447682-8f0d918adbed?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
plate23.photo.attach(io: file23, filename: 'plate23.png', content_type: 'image/png')
plate23.save!

plate24 = Plate.new(
  name: "Mendocina Grilled Chicken",
  restaurant_id: restaurant18.id,
  cooked_date: Date.today - rand(0..5),
  stock: 8,
  new_price: 14.00,
  old_price: 27.00,
  description: "Tender grilled chicken with Mendocina spices, a specialty at La Cabaña Mendocina."
)
file24 = URI.open("https://plus.unsplash.com/premium_photo-1661419883163-bb4df1c10109?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
plate24.photo.attach(io: file24, filename: 'plate24.png', content_type: 'image/png')
plate24.save!

plate25 = Plate.new(
  name: "Jujuyan Dessert Platter",
  restaurant_id: restaurant19.id,
  cooked_date: Date.today - rand(0..5),
  stock: 7,
  new_price: 11.50,
  old_price: 20.00,
  description: "A delightful platter of Jujuyan desserts, a sweet treat from Delicias Jujuyanas."
)
file25 = URI.open("https://images.unsplash.com/photo-1551024506-0bccd828d307?q=80&w=2864&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
plate25.photo.attach(io: file25, filename: 'plate25.png', content_type: 'image/png')
plate25.save!

plate26 = Plate.new(
  name: "Paraná Seafood Feast",
  restaurant_id: restaurant20.id,
  cooked_date: Date.today - rand(0..5),
  stock: 9,
  new_price: 24.00,
  old_price: 38.50,
  description: "A grand feast of fresh seafood from the Paraná River, a highlight at Mariscos del Paraná."
)
file26 = URI.open("https://plus.unsplash.com/premium_photo-1674498271265-75a1122411b5?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
plate26.photo.attach(io: file26, filename: 'plate26.png', content_type: 'image/png')
plate26.save!

plate27 = Plate.new(
  name: "Parrilla Mixta",
  restaurant_id: restaurant11.id,
  cooked_date: Date.today - rand(0..5),
  stock: 5,
  new_price: 17.50,
  old_price: 32.00,
  description: "A mixed grill platter featuring a variety of meats, a highlight at Parrilla del Norte."
)
file27 = URI.open("https://images.unsplash.com/photo-1603360946369-dc9bb6258143?q=80&w=2999&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
plate27.photo.attach(io: file27, filename: "plate27.png", content_type: "image/png")
plate27.save!


# Creating more plates for different restaurants (starting from 28)

# Plate for restaurant21 (Thai Delight)
plate28 = Plate.new(
  name: "Pad Thai Noodles",
  restaurant_id: restaurant21.id,
  cooked_date: Date.today - rand(0..5),
  stock: 5,
  new_price: 13.50,
  old_price: 17.00,
  description: "Classic Thai stir-fried noodles with shrimp, tofu, peanuts, and lime."
)
file28 = URI.open("https://images.unsplash.com/photo-1559314809-0d155014e29e?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
plate28.photo.attach(io: file28, filename: 'plate28.png', content_type: 'image/png')
plate28.save!

# Plate for restaurant22 (MexiCuisine)
plate29 = Plate.new(
  name: "Tacos al Pastor",
  restaurant_id: restaurant22.id,
  cooked_date: Date.today - rand(0..5),
  stock: 4,
  new_price: 9.50,
  old_price: 12.00,
  description: "Savor the essence of Mexico with our authentic street-style tacos – marinated pork, juicy pineapple, and vibrant seasonings, all nestled in soft corn tortillas. Gluten-free and nut-free, these tacos promise a flavorful journey, free from common allergens."
)
file29 = URI.open("https://plus.unsplash.com/premium_photo-1681406995032-c3ceeb24d7f9?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
plate29.photo.attach(io: file29, filename: 'plate29.png', content_type: 'image/png')
plate29.save!

# Plate for restaurant23 (Green Eats)
plate30 = Plate.new(
  name: "Quinoa Salad Bowl",
  restaurant_id: restaurant23.id,
  cooked_date: Date.today - rand(0..5),
  stock: 6,
  new_price: 10.50,
  old_price: 14.00,
  description: "Elevate your palate with our quinoa salad, a vibrant medley of fluffy quinoa, crisp veggies, and zesty dressing. Packed with nutrients, it's gluten-free and nut-free, ensuring a wholesome experience for everyone. Embrace freshness and flavor without allergen concerns."
)
file30 = URI.open("https://images.unsplash.com/photo-1623428187425-873f16e10554?q=80&w=2728&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
plate30.photo.attach(io: file30, filename: 'plate30.png', content_type: 'image/png')
plate30.save!

# Plate for restaurant24 (Mamma's Pizzeria)
plate31 = Plate.new(
  name: "Pepperoni Cheese Pizza",
  restaurant_id: restaurant24.id,
  cooked_date: Date.today - rand(0..5),
  stock: 8,
  new_price: 12.50,
  old_price: 16.00,
  description: "Indulge in the classic allure of our pepperoni pizza. A perfect harmony of gooey cheese, zesty tomato sauce, and savory pepperoni on a golden crust. Please note it contains gluten and dairy; enjoy this flavorful delight unless you have sensitivity to these allergens."
)
file31 = URI.open("https://images.unsplash.com/photo-1534308983496-4fabb1a015ee?q=80&w=2676&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
plate31.photo.attach(io: file31, filename: 'plate31.png', content_type: 'image/png')
plate31.save!

# Plate for restaurant25 (Sushi Haven)
plate32 = Plate.new(
  name: "Dragon Roll",
  restaurant_id: restaurant25.id,
  cooked_date: Date.today - rand(0..5),
  stock: 7,
  new_price: 14.50,
  old_price: 18.00,
  description: "Dive into the exquisite world of sushi, where delicate rice, fresh fish, and crisp vegetables unite in a symphony of flavors. Our sushi is free from gluten and nuts, providing a delectable experience for all. Revel in the artistry of this Japanese culinary delight without worry about common allergens."
)
file32 = URI.open("https://plus.unsplash.com/premium_photo-1670333291474-cb722ca783a5?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
plate32.photo.attach(io: file32, filename: 'plate32.png', content_type: 'image/png')
plate32.save!

# Additional plates (starting from 33)
plate33 = Plate.new(
  name: "Champignon Pizza",
  restaurant_id: restaurant1.id,
  cooked_date: Date.today - rand(0..5),
  stock: 5,
  new_price: 11.50,
  old_price: 15.00,
  description: "Savor the earthy goodness of our champignon pizza, a tantalizing blend of creamy mushrooms, melted cheese, and aromatic herbs atop a golden crust. Please be aware that this pizza contains gluten and dairy, ensuring a rich and satisfying experience for those without sensitivity to these allergens."
)
file33 = URI.open("https://images.unsplash.com/photo-1635832801146-102d3bb7f88e?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTZ8fHBpenphfGVufDB8MHwwfHx8MA%3D%3D")
plate33.photo.attach(io: file33, filename: 'plate33.png', content_type: 'image/png')
plate33.save!

plate34 = Plate.new(
  name: "Spicy Tuna Roll",
  restaurant_id: restaurant2.id,
  cooked_date: Date.today - rand(0..5),
  stock: 6,
  new_price: 13.50,
  old_price: 17.00,
  description: "A sushi roll with a kick, featuring spicy tuna, avocado, and Sriracha. WARNING: SPICY!"
)
file34 = URI.open("https://images.unsplash.com/photo-1623947459509-73603a441a00?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
plate34.photo.attach(io: file34, filename: 'plate34.png', content_type: 'image/png')
plate34.save!



#Categories
puts "Creating categories"

category1 = Category.create!(
  name: "Pizza"
)

category2 = Category.create!(
  name: "Pasta"
)

category3 = Category.create!(
  name: "Bakery"
)

category4 = Category.create!(
  name: "BBQ"
)

category5 = Category.create!(
  name: "Vegetarian"
)

category6 = Category.create!(
  name: "Tacos"
)

category7 = Category.create!(
  name: "Sushi"
)

category8 = Category.create!(
  name: "Vegan"
)

#Category Plates
puts "Assigning categories to plates"

categoryplate1 = CategoryPlate.create!(
  category_id: category2.id,
  plate_id: plate1.id
)

categoryplate2 = CategoryPlate.create!(
  category_id: category1.id,
  plate_id: plate2.id
)

categoryplate3 = CategoryPlate.create!(
  category_id: category1.id,
  plate_id: plate3.id
)

categoryplate4 = CategoryPlate.create!(
  category_id: category6.id,
  plate_id: plate4.id
)

categoryplate5 = CategoryPlate.create!(
  category_id: category6.id,
  plate_id: plate5.id
)

categoryplate6 = CategoryPlate.create!(
  category_id: category1.id,
  plate_id: plate6.id
)

categoryplate7 = CategoryPlate.create!(
  category_id: category2.id,
  plate_id: plate7.id
)

categoryplate8 = CategoryPlate.create!(
  category_id: category2.id,
  plate_id: plate8.id
)

categoryplate9 = CategoryPlate.create!(
  category_id: category5.id,
  plate_id: plate9.id
)

categoryplate10 = CategoryPlate.create!(
  category_id: category3.id,
  plate_id: plate10.id
)

categoryplate11 = CategoryPlate.create!(
  category_id: category5.id,
  plate_id: plate11.id
)

categoryplate12 = CategoryPlate.create!(
  category_id: category4.id,
  plate_id: plate12.id
)

categoryplate13 = CategoryPlate.create!(
  category_id: category7.id,
  plate_id: plate13.id
)

categoryplate14 = CategoryPlate.create!(
  category_id: category8.id,
  plate_id: plate14.id
)

categoryplate15 = CategoryPlate.create!(
  category_id: category3.id,
  plate_id: plate15.id
)

categoryplate16 = CategoryPlate.create!(
  category_id: category4.id,
  plate_id: plate16.id
)

categoryplate17 = CategoryPlate.create!(
  category_id: category5.id,
  plate_id: plate8.id
)

categoryplate18 = CategoryPlate.create!(
  category_id: category8.id,
  plate_id: plate11.id
)

categoryplate14 = CategoryPlate.create!(
  category_id: category5.id,
  plate_id: plate14.id
)

categoryplate15 = CategoryPlate.create!(
  category_id: category4.id,
  plate_id: plate17.id
)

categoryplate16 = CategoryPlate.create!(
  category_id: category4.id,
  plate_id: plate18.id
)

categoryplate17 = CategoryPlate.create!(
  category_id: category4.id,
  plate_id: plate19.id
)

categoryplate18 = CategoryPlate.create!(
  category_id: category1.id,
  plate_id: plate20.id
)

categoryplate19 = CategoryPlate.create!(
  category_id: category7.id,
  plate_id: plate21.id
)

categoryplate20 = CategoryPlate.create!(
  category_id: category3.id,
  plate_id: plate22.id
)

categoryplate21 = CategoryPlate.create!(
  category_id: category4.id,
  plate_id: plate23.id
)

categoryplate22 = CategoryPlate.create!(
  category_id: category4.id,
  plate_id: plate24.id
)

categoryplate23 = CategoryPlate.create!(
  category_id: category3.id,
  plate_id: plate25.id
)

categoryplate24 = CategoryPlate.create!(
  category_id: category7.id,
  plate_id: plate26.id
)

categoryplate25 = CategoryPlate.create!(
  category_id: category4.id,
  plate_id: plate27.id
)

categoryplate26 = CategoryPlate.create!(
  category_id: category2.id,
  plate_id: plate28.id
)

categoryplate27 = CategoryPlate.create!(
  category_id: category6.id,
  plate_id: plate29.id
)

categoryplate28 = CategoryPlate.create!(
  category_id: category5.id,
  plate_id: plate30.id
)
categoryplate29 = CategoryPlate.create!(
  category_id: category8.id,
  plate_id: plate30.id
)
categoryplate30 = CategoryPlate.create!(
  category_id: category1.id,
  plate_id: plate31.id
)
categoryplate31 = CategoryPlate.create!(
  category_id: category7.id,
  plate_id: plate32.id
)
categoryplate32 = CategoryPlate.create!(
  category_id: category1.id,
  plate_id: plate33.id
)
categoryplate33 = CategoryPlate.create!(
  category_id: category7.id,
  plate_id: plate34.id
)

# Creating reviews for each restaurant

# Review for restaurant1 (Ristorante delizioso)
review1 = Review.create!(
  user_id: sofia_alfaro.id,
  restaurant_id: restaurant1.id,
  rating: rand(1..5),
  comment: "Great place with a cozy ambiance. Loved the authentic Italian flavors!"
)

# Review for restaurant2 (La Taquería auténtica)
review2 = Review.create!(
  user_id: sofia_alfaro.id,
  restaurant_id: restaurant2.id,
  rating: rand(1..5),
  comment: "Tacos were amazing! Really enjoyed the vibrant atmosphere."
)

# Review for restaurant3 (Sabor del Este)
review3 = Review.create!(
  user_id: sofia_alfaro.id,
  restaurant_id: restaurant3.id,
  rating: rand(1..5),
  comment: "Delicious flavors from the East. The dumplings were a favorite!"
)

# Review for restaurant4 (Veggie Haven)
review4 = Review.create!(
  user_id: sofia_alfaro.id,
  restaurant_id: restaurant4.id,
  rating: rand(1..5),
  comment: "As a vegetarian, this place is a haven for tasty and creative veggie dishes."
)

# Review for restaurant5 (Carnes y Brasas)
review5 = Review.create!(
  user_id: sofia_alfaro.id,
  restaurant_id: restaurant5.id,
  rating: rand(1..5),
  comment: "The grilled meats here are exceptional! A meat lover's paradise."
)

# Review for restaurant6 (Pasta Paradiso)
review6 = Review.create!(
  user_id: sofia_alfaro.id,
  restaurant_id: restaurant6.id,
  rating: rand(1..5),
  comment: "Pasta perfection! Loved the variety and homemade taste."
)

# Review for restaurant7 (Tokyo Bites)
review7 = Review.create!(
  user_id: sofia_alfaro.id,
  restaurant_id: restaurant7.id,
  rating: rand(1..5),
  comment: "Authentic Japanese cuisine. Sushi was fresh and flavorful."
)

# Review for restaurant8 (El Sazón Exótico)
review8 = Review.create!(
  user_id: sofia_alfaro.id,
  restaurant_id: restaurant8.id,
  rating: rand(1..5),
  comment: "Exotic flavors and a diverse menu. A delightful culinary experience."
)

# Review for restaurant9 (Kaime)
review9 = Review.create!(
  user_id: sofia_alfaro.id,
  restaurant_id: restaurant9.id,
  rating: rand(1..5),
  comment: "Unique fusion cuisine. The dishes were beautifully presented."
)

# Review for restaurant10 (BBQ Grill Master)
review10 = Review.create!(
  user_id: sofia_alfaro.id,
  restaurant_id: restaurant10.id,
  rating: rand(1..5),
  comment: "A barbecue lover's dream! The smoky flavors were fantastic."
)

# Review for restaurant11 (Parrilla del Norte)
review11 = Review.create!(
  user_id: sofia_alfaro.id,
  restaurant_id: restaurant11.id,
  rating: rand(1..5),
  comment: "Top-notch grilled meats. The steaks were perfectly cooked."
)

# Review for restaurant12 (El Fogón Patagónico)
review12 = Review.create!(
  user_id: sofia_alfaro.id,
  restaurant_id: restaurant12.id,
  rating: rand(1..5),
  comment: "Patagonian cuisine at its best. Loved the hearty and flavorful dishes."
)

# Review for restaurant13 (Sabores Cuyanos)
review13 = Review.create!(
  user_id: sofia_alfaro.id,
  restaurant_id: restaurant13.id,
  rating: rand(1..5),
  comment: "Cuyan flavors are truly unique. Enjoyed every bite of the regional specialties."
)

# Review for restaurant14 (Empanadas del Noroeste)
review14 = Review.create!(
  user_id: sofia_alfaro.id,
  restaurant_id: restaurant14.id,
  rating: rand(1..5),
  comment: "Empanadas were delicious! Each bite was a burst of flavor."
)

# Review for restaurant15 (Sushi Roll Bar)
review15 = Review.create!(
  user_id: sofia_alfaro.id,
  restaurant_id: restaurant15.id,
  rating: rand(1..5),
  comment: "Sushi perfection! Creative rolls and fresh ingredients."
)

# Review for restaurant16 (Dulces Tucumanos)
review16 = Review.create!(
  user_id: sofia_alfaro.id,
  restaurant_id: restaurant16.id,
  rating: rand(1..5),
  comment: "Tucuman sweets were a delightful treat. Loved the variety."
)

# Review for restaurant17 (El Buen Asado)
review17 = Review.create!(
  user_id: sofia_alfaro.id,
  restaurant_id: restaurant17.id,
  rating: rand(1..5),
  comment: "Authentic Argentine barbecue. The flavor of the meat was exceptional."
)

# Review for restaurant18 (Asian Fusion Bistro)
review18 = Review.create!(
  user_id: sofia_alfaro.id,
  restaurant_id: restaurant18.id,
  rating: rand(1..5),
  comment: "Creative fusion dishes with a touch of Asian flair. Enjoyed the unique combinations."
)

# Review for restaurant19 (Mediterranean Delights)
review19 = Review.create!(
  user_id: sofia_alfaro.id,
  restaurant_id: restaurant19.id,
  rating: rand(1..5),
  comment: "Mediterranean cuisine at its finest. The flavors transported me to the Mediterranean."
)

# Review for restaurant20 (Café de Paris)
review20 = Review.create!(
  user_id: sofia_alfaro.id,
  restaurant_id: restaurant20.id,
  rating: rand(1..5),
  comment: "Charming French café with delectable pastries. A must-visit for pastry enthusiasts."
)

# Review for restaurant21 (Thai Delight)
review21 = Review.create!(
  user_id: sofia_alfaro.id,
  restaurant_id: restaurant21.id,
  rating: rand(1..5),
  comment: "Delightful Thai flavors. The Pad Thai noodles were a standout."
)

# Review for restaurant22 (MexiCuisine)
review22 = Review.create!(
  user_id: sofia_alfaro.id,
  restaurant_id: restaurant22.id,
  rating: rand(1..5),
  comment: "Authentic Mexican taste. Tacos al Pastor were a hit!"
)

# Review for restaurant23 (Green Eats)
review23 = Review.create!(
  user_id: sofia_alfaro.id,
  restaurant_id: restaurant23.id,
  rating: rand(1..5),
  comment: "Healthy and delicious quinoa salad. A perfect spot for the health-conscious."
)

# Review for restaurant24 (Mamma's Pizzeria)
review24 = Review.create!(
  user_id: sofia_alfaro.id,
  restaurant_id: restaurant24.id,
  rating: rand(1..5),
  comment: "Classic Four Cheese Pizza. A cheesy delight!"
)

# Review for restaurant25 (Sushi Haven)
review25 = Review.create!(
  user_id: sofia_alfaro.id,
  restaurant_id: restaurant25.id,
  rating: rand(1..5),
  comment: "The Dragon Roll was visually stunning and delicious. A sushi lover's paradise."
)

puts "Reviews created successfully"
