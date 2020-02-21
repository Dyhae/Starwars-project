# frozen_string_literal: true

class Starship < ApplicationRecord
  has_and_belongs_to_many :characters
end
