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
  kind = grabinformation(url_kind)
  kind_name = kind['name']
  kind_classification = kind['classification']
  kind_designation = kind['designation']
  kind_average_lifespan = kind['average_lifespan']

  url_planet = JSON.parse(person)['homeworld']
  planet = grabinformation(url_planet)
  planet_name = planet['name']
  planet_population = planet['population'].to_f
  planet_gravity = planet['gravity']
  planet_diameter = planet['diameter'].to_f

  #create the tables

  #first create the planet table
  created_planet = Planet.create(name = planet_name, population = planet_population, gravity = planet_gravity, diameter = planet_diameter)

  puts n
  puts JSON.parse(person)['name']
  puts kind['name']
  puts "diameter: #{planet_diameter}"
  n += 1
rescue StandardError => e
  puts e.message
  n += 1
end
