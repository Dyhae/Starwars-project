# frozen_string_literal: true

class StarshipsController < ApplicationController
  def index
    @starships = Starship.all.order(:name)
  end

  def show
    @starship = Starship.find(params[:id])
  end
end
