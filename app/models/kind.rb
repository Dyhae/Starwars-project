# frozen_string_literal: true

class Kind < ApplicationRecord
  has_many :characters
  belongs_to :planet

  validates :name, :classification, :designation, :average_lifespan, presence:true
  validates :name, uniqueness: true


end
