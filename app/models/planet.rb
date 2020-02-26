# frozen_string_literal: true

class Planet < ApplicationRecord
  has_many :characters
  has_many :kinds

  validates :name, :population, :gravity, :diameter, presence: true
  validates :name, uniqueness: true
  validates :population, numericality: { only_integer: true }
end
