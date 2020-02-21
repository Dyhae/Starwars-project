# frozen_string_literal: true

class CharacterStarship < ApplicationRecord
  belongs_to :character
  belongs_to :starship
end
