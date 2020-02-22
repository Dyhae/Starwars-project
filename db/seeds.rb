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
  puts n

  n += 1
rescue StandardError => e
  puts e.message
  n += 1
end
