# frozen_string_literal: true

class Planet < ApplicationRecord
  has_many :characters
  has_many :kinds
end
