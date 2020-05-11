# frozen_string_literal: true

class Game < ApplicationRecord
  validates :name, presence: true
  validate :state_structure
  after_initialize :setup

  def parsed_state
    @parsed_state ||= (state || {}).with_indifferent_access
  end

  def setup
    players = []
    postcards = City.all.map(&:postcards).flatten
    4.times { players << Player.setup(postcards) }
    self[:state] = {
      postcards: postcards,
      hazards: Game.setup_hazards,
      players: players
    }
  end

  private

  def state_structure
    unless parsed_state[:postcards].nil? || parsed_state[:hazards].nil? || parsed_state[:players].nil?
      return
    end

    errors.add(:state, 'is malformed')
  end

  def self.setup_hazards
    []
  end
end
