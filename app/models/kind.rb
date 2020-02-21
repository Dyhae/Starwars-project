# frozen_string_literal: true

class Kind < ApplicationRecord
  has_many :characters
end
