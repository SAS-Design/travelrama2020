# frozen_string_literal: true

class City < ApplicationRecord
  has_many :postcards
  has_many :connections
  has_many :connected_cities, through: :connections, class_name: 'City'
end
