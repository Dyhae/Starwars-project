# frozen_string_literal: true

class RenameCharacterStarshipsTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :character_starships
  end
end
