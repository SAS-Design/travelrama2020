# frozen_string_literal: true

class Connection < ApplicationRecord
  belongs_to :city
  belongs_to :connected_city, class_name: 'City'

  validates :cost, presence: true, numericality: { greater_than_or_equal_to: 0 }
  after_create :create_inverse
  after_destroy :destroy_inverse

  def inverse
    Connection.find_or_initialize_by(city_id: connected_city_id, connected_city_id: city_id)
  end

  private

  def create_inverse
    connection = inverse
    connection[:cost] = cost
    connection.save
  end

  def destroy_inverse
    inverse.destroy
  end
end
