# frozen_string_literal: true

class ChangeGravityToBe < ActiveRecord::Migration[6.0]
  def change
    change_column :planets, :gravity, :string
  end
end
