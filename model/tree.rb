require './model/faction'
require './model/living_unit'
require './model/status'

class Tree < LivingUnit
  # @param [Integer] id
  # @param [Float] x
  # @param [Float] y
  # @param [Float] speed_x
  # @param [Float] speed_y
  # @param [Float] angle
  # @param [Integer, NilClass] faction
  # @param [Float] radius
  # @param [Integer] life
  # @param [Integer] max_life
  # @param [Array<Status, NilClass>, NilClass] statuses
  def initialize(id, x, y, speed_x, speed_y, angle, faction, radius, life, max_life, statuses)
    super(id, x, y, speed_x, speed_y, angle, faction, radius, life, max_life, statuses)  end
end