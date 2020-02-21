class AddKindToCharacters < ActiveRecord::Migration[6.0]
  def change
    add_reference :characters, :kind, null: true, foreign_key: true
  end
end
