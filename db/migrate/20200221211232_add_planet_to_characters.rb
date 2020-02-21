# frozen_string_literal: true

class AddPlanetToCharacters < ActiveRecord::Migration[6.0]
  def change
    add_reference :characters, :planet, null: true, foreign_key: true
  end
end
