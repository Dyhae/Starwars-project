class AddPlanetToKinds < ActiveRecord::Migration[6.0]
  def change
    add_reference :kinds, :planet, null: true, foreign_key: true
  end
end
