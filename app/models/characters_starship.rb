# frozen_string_literal: true

class CharactersStarship < ApplicationRecord
  belongs_to :character
  belongs_to :starship
end
