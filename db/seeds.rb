# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'json'
require 'rest-client'
require 'open-uri'

url = "https://pokeapi.co/api/v2/pokemon?limit=100000&offset=0"
pokemon_list = URI.open(url).read
pokemons = JSON.parse(pokemon_list)

151.times do |index|
  pokemon_id = index + 1
  new_pokemon = Character.create(
    id: pokemon_id,
    name: pokemons["results"][index]["name"]
  )
  new_pokemon.save
end

10.times do |index|
  new_category = Category.create(
    id: index,
    name: Faker::Commerce.department
  )
  new_category.save
  puts new_category.name
end


100.times do |index|
  category = Category.find(rand(0..9))
  price = Faker::Commerce.price(range: 0..50.0)
  # category.products <<
  new_product = Product.create(
    name: Faker::Commerce.product_name,
    description: Faker::Hipster.sentence,
    price: price
  )

  category.products << new_product

  Character.all.each do |character|
    new_product.custom_products << CustomProduct.create(
      character: character,
      price: price
    )
  end

  new_product.save
end


