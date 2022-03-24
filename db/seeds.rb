puts "🌱 Seeding spices..."
Recipe.delete_all
User.delete_all

joe = User.create(full_name:"Joe", username:"walkthworld", email:"walkthworld@yahoo.com")

smoked_burgers = Recipe.create(name: "Smoked Burgers", ingredients: "Four-six 1.25-1.5 pound burger patties", directions: "Preheat pellet smoker to 375, brush a little olive oil and sprinkle some salt and pepper on the first side going down on the grill. Repeat olive oil and s&p turning once halfway through cooktime. Cook 10-15 minutes.")
pellet_pizza = Recipe.create(name: "Pellet-grilled Pizza", ingredients: "One Fresh pizza dough, toppings of your choice", directions: "Preheat pellet smoker to 450, let pizza stone sit at 450 for at least 30 minutes prior to use, cover pizza paddle with a light dusting of flour and cornmeal, spread 14-inch dough top with ingredients, place on stone close lid for 10-13 minutes")
pellet_pizza.user = joe
smoked_burgers.user = joe
smoked_burgers.save
pellet_pizza.save


puts "✅ Done seeding!"
