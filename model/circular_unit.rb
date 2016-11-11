require './model/faction'
require './model/unit'

class CircularUnit < Unit
  # @return [Float]
  attr_reader :radius

  # @param [Integer] id
  # @param [Float] x
  # @param [Float] y
  # @param [Float] speed_x
  # @param [Float] speed_y
  # @param [Float] angle
  # @param [Integer, NilClass] faction
  # @param [Float] radius
  def initialize(id, x, y, speed_x, speed_y, angle, faction, radius)
    super(id, x, y, speed_x, speed_y, angle, faction)

    @radius = radius
  end
end