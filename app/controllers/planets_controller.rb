# frozen_string_literal: true

class PlanetsController < ApplicationController
  def index
    @planets = Planet.all.order(:name)
  end

  def show
    @planet = Planet.find(params[:id])
  end
end
