class PlanetsController < ApplicationController
  def index

    @planets = Planet.all

  end

  def show

    @planet = Planet.find_by(params :id)

  end
end
