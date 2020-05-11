# frozen_string_literal: true

class Player
  def self.setup(postcards)
    {
      starting_city_id: nil,
      current_location: nil,
      miles: 500,
      tickets: 0,
      goal: postcards.first(3) + Tag.first(2), # Specific postcards need to be 'drawn' so no two players have the same 1 postcard goal.
      inventory: []
    }
  end
end
