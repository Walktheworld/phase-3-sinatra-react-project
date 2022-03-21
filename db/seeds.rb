puts "🌱 Seeding spices..."
Recipe.delete_all
User.delete_all

joe = User.create(full_name:"Joe", username:"walkthworld", email:"walkthworld@yahoo.com")

smoked_burgers = Recipe.create(name: "Smoked Burgers", ingredients: "Four-six 1.25-1.5 pound burger patties", directions: "Preheat pellet smoker to 375, brush a little olive oil and sprinkle some salt and pepper on the first side going down on the grill. Repeat olive oil and s&p turning once halfway through cooktime. Cook 10-15 minutes.")
# Seed your database here
smoked_burgers.user = joe
joe.recipes << smoked_burgers

puts "✅ Done seeding!"
