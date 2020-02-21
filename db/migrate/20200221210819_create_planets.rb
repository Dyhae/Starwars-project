class CreatePlanets < ActiveRecord::Migration[6.0]
  def change
    create_table :planets do |t|
      t.string :name
      t.integer :population
      t.float :gravity
      t.float :diameter

      t.timestamps
    end
  end
end
