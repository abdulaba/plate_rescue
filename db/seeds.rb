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
User.destroy_all
Restaurant.destroy_all
Plate.destroy_all
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
  opening_date: "Monday-Sunday",
  opening_time: "11am-11pm",
  user_id: sofia_alfaro.id
)

restaurant2 = Restaurant.new(
  name: "La Taquería auténtica",
  address: "Calle Defensa 567, San Telmo, Buenos Aires, Argentina",
  opening_date: "Tuesday-Sunday",
  opening_time: "12pm-10pm",
  user_id: ana_cabral.id
)

restaurant3 = Restaurant.new(
  name: "Sabor del Este",
  address: "Av. Cabildo 890, Belgrano, Buenos Aires, Argentina",
  opening_date: "Monday-Saturday",
  opening_time: "8am-5pm",
  user_id: francisco_macias.id
)

restaurant4 = Restaurant.new(
  name: "Veggie Haven",
  address: "Calle Thames 456, Palermo, Buenos Aires, Argentina",
  opening_date: "Monday-Sunday",
  opening_time: "9am-6pm",
  user_id: sofia_alfaro.id
)

restaurant5 = Restaurant.new(
  name: "Carnes y Brasas",
  address: "Av. Corrientes 3456, Almagro, Buenos Aires, Argentina",
  opening_date: "Wednesday-Sunday",
  opening_time: "1pm-12am",
  user_id: ana_cabral.id
)

restaurant6 = Restaurant.new(
  name: "Pasta Paradiso",
  address: "Calle Scalabrini Ortiz 678, Villa Crespo, Buenos Aires, Argentina",
  opening_date: "Monday-Friday",
  opening_time: "11am-11pm",
  user_id: francisco_macias.id
)

restaurant7 = Restaurant.new(
  name: "Tokyo Bites",
  address: "Av. Libertador 4321, Palermo, Buenos Aires, Argentina",
  opening_date: "Tuesday-Saturday",
  opening_time: "6pm-11pm",
  user_id: ana_cabral.id
)

restaurant8 = Restaurant.new(
  name: "El Sazón Exótico",
  address: "Calle Bolívar 987, San Telmo, Buenos Aires, Argentina",
  opening_date: "Monday-Thursday",
  opening_time: "10am-10pm",
  user_id: sofia_alfaro.id
)

restaurant9 = Restaurant.new(
  name: "Kaime",
  address: "Av. Las Heras 2101, Recoleta, Buenos Aires, Argentina",
  opening_date: "Friday-Monday",
  opening_time: "10am-4pm",
  user_id: francisco_macias.id
)

restaurant10 = Restaurant.new(
  name: "BBQ Grill Master",
  address: "Calle Cerrito 1500, Retiro, Buenos Aires, Argentina",
  opening_date: "Monday-Sunday",
  opening_time: "4pm-12am",
  user_id: ana_cabral.id
)

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
plate1.save

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
plate2.save

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
plate3.save

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
plate4.save

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
plate5.save


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
plate6.save

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
plate7.save


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
plate8.save

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
plate9.save


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
plate10.save

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
plate11.save

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
plate12.save

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
plate13.save

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
plate14.save

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
plate15.save

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
plate16.save
