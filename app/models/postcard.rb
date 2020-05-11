# frozen_string_literal: true

class Postcard < ApplicationRecord
  belongs_to :city
  has_many :tags
  has_one_attached :image
end
