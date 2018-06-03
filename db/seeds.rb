# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Cocktail.create(name: "Daiquiri")
# Cocktail.create(name: "Bloody Mary")
# Cocktail.create(name: "Gin&Tonic")
# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")
require 'json'
require 'open-uri'

url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredient_serialized = open(url).read
ingredient_list = JSON.parse(ingredient_serialized)
ingredient = ingredient_list["drinks"]

ingredient.each do |ing|
  Ingredient.create(name: ing["strIngredient1"])
end
