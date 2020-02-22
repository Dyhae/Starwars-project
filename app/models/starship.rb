# frozen_string_literal: true

class Starship < ApplicationRecord
  has_and_belongs_to_many :characters

  validates :name, :model, :starship_class, :cost_in_credits, presence: true
end
