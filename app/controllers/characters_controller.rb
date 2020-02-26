# frozen_string_literal: true

class CharactersController < ApplicationController
  def index
    @characters = Character.includes(:planet).includes(:kind).order(:name).page params[:page]
  end

  def show
    @character = Character.find(params[:id])
  end
end
