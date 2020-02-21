# frozen_string_literal: true

class Kind < ApplicationRecord
  has_many :characters
  belongs_to :planet
end
