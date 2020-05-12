# frozen_string_literal: true

class Game < ApplicationRecord
  validates :name, presence: true
  # validate :state_structure
  auto_strip_attributes :name, :password
  after_initialize :setup

  def state
    @state ||= (super || {}).with_indifferent_access
  end

  def setup
    return unless state.empty?
    
    self[:state] = {
      postcards: postcards = City.all.map(&:postcards).flatten,
      hazards: Game.setup_hazards,
      players: (1..4).map { |n| {"player#{n}" => Player.setup(postcards)} }
    }
  end

  private

  def state_structure
    return unless state[:postcards].nil? || state[:hazards].nil? || state[:players].nil?

    errors.add(:state, 'is malformed')
  end

  def self.setup_hazards
    []
  end
end
