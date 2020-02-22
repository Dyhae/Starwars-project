# frozen_string_literal: true

class Character < ApplicationRecord
  has_and_belongs_to_many :starships
  belongs_to :kind
  belongs_to :planet

  validates :name, :birth_year, presence: true
end
