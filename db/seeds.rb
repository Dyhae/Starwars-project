# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'swapi'
require 'net/http'
require 'json'

CharactersStarship.destroy_all
Starship.destroy_all
Character.destroy_all
Kind.destroy_all
Planet.destroy_all

allPeople = Swapi.get_all('people')
COUNT = JSON.parse(allPeople)['count']
n = 1

def grabinformation(urlpassed)
  url = urlpassed
  uri = URI(url)
  response = Net::HTTP.get(uri)
  JSON.parse(response)
end

Count_Faker = 5

Count_Faker.times do
  people = Faker::Movies::StarWars.character
  specie = Faker::Movies::StarWars.specie
  planet = Faker::Movies::StarWars.planet

  # first create the planet table
  created_planet = Planet.find_or_create_by(name: planet)
  created_planet.population = 45_554
  created_planet.gravity = 'very heavy'
  created_planet.diameter = 4444.0
  created_planet.save

  # second create the Species (kind) table
  # if kind_name != 'Unknown'
  created_kind = Kind.find_or_create_by(name: specie)
  created_kind.classification = 'nice'
  created_kind.designation = 'beautiful'
  created_kind.average_lifespan = 'no longe'
  created_kind.planet = created_planet
  created_kind.save
  # end

  created_character = Character.find_or_create_by(name: people)
  created_character.birth_year = '555YBB'
  created_character.planet = created_planet
  created_character.kind = created_kind
  created_character.save
end

COUNT.times do
  person = Swapi.get_person(n)
  person_name = JSON.parse(person)['name']
  person_birth_year = JSON.parse(person)['birth_year']

  url_kind = JSON.parse(person)['species'][0]

  if url_kind.nil?
    kind_name = 'unknown'
    kind_classification = 'unknown'
    kind_designation = 'unknown'
    kind_average_lifespan = 'unknown'
  else
    kind = grabinformation(url_kind)
    kind_name = kind['name']
    kind_classification = kind['classification']
    kind_designation = kind['designation']
    kind_average_lifespan = kind['average_lifespan']
  end

  url_planet = JSON.parse(person)['homeworld']
  planet = grabinformation(url_planet)
  planet_name = planet['name']
  planet_population = planet['population'].to_i
  planet_gravity = planet['gravity']
  planet_diameter = planet['diameter'].to_f

  # create the tables

  # first create the planet table
  created_planet = Planet.find_or_create_by(name: planet_name)
  created_planet.population = planet_population
  created_planet.gravity = planet_gravity
  created_planet.diameter = planet_diameter
  created_planet.save

  # second create the Species (kind) table
  # if kind_name != 'Unknown'
  created_kind = Kind.find_or_create_by(name: kind_name)
  created_kind.classification = kind_classification
  created_kind.designation = kind_designation
  created_kind.average_lifespan = kind_average_lifespan
  created_kind.planet = created_planet
  created_kind.save
  # end

  # third create the character table
  created_character = Character.find_or_create_by(name: person_name)
  created_character.birth_year = person_birth_year
  created_character.planet = created_planet
  created_character.kind = created_kind
  created_character.save

  # Forth create the Starships table

  url_starship = JSON.parse(person)['starships']

  if url_starship.empty?

    starship_name = 'unknown'
    starship_model = 'unknown'
    starship_starship_class = 'unknown'
    starship_cost_in_credits = 'unknown'

    created_starship = Starship.find_or_create_by(name: starship_name)
    created_starship.model = starship_model
    created_starship.starship_class = starship_starship_class
    created_starship.cost_in_credits = starship_cost_in_credits
    created_starship.save

    created_character_starship = CharactersStarship.create(character: created_character, starship: created_starship)
    created_character_starship.save

  else
    url_starship.each do |single|
      starship = grabinformation(single)
      starship_name = starship['name']
      starship_model = starship['model']
      starship_starship_class = starship['starship_class']
      starship_cost_in_credits = starship['cost_in_credits']

      created_starship = Starship.find_or_create_by(name: starship_name)
      created_starship.model = starship_model
      created_starship.starship_class = starship_starship_class
      created_starship.cost_in_credits = starship_cost_in_credits
      created_starship.save

      created_character_starship = CharactersStarship.create(character: created_character, starship: created_starship)
      created_character_starship.save
    end
  end

  puts n

  n += 1
rescue StandardError => e
  puts e.message
  n += 1
end

# puts some_model_object.errors.message.inspect

# person = Swapi.get_person(18)
# starship = JSON.parse(person)['starships']
# for single in starship do

#  puts single
# end
# puts JSON.parse(person)['name'] if starship.length > 1
