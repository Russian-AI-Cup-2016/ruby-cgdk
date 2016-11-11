require './model/bonus_type'
require './model/circular_unit'
require './model/faction'

class Bonus < CircularUnit
  # @return [Integer, NilClass]
  attr_reader :type

  # @param [Integer] id
  # @param [Float] x
  # @param [Float] y
  # @param [Float] speed_x
  # @param [Float] speed_y
  # @param [Float] angle
  # @param [Integer, NilClass] faction
  # @param [Float] radius
  # @param [Integer, NilClass] type
  def initialize(id, x, y, speed_x, speed_y, angle, faction, radius, type)
    super(id, x, y, speed_x, speed_y, angle, faction, radius)

    @type = type
  end
end