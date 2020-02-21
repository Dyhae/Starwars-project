class CreateKinds < ActiveRecord::Migration[6.0]
  def change
    create_table :kinds do |t|
      t.string :name
      t.string :classification
      t.string :designation
      t.string :average_lifespan

      t.timestamps
    end
  end
end
