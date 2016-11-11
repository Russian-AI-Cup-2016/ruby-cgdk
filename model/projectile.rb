require './model/circular_unit'
require './model/faction'
require './model/projectile_type'

class Projectile < CircularUnit
  # @return [Integer, NilClass]
  attr_reader :type

  # @return [Integer]
  attr_reader :owner_unit_id

  # @return [Integer]
  attr_reader :owner_player_id

  # @param [Integer] id
  # @param [Float] x
  # @param [Float] y
  # @param [Float] speed_x
  # @param [Float] speed_y
  # @param [Float] angle
  # @param [Integer, NilClass] faction
  # @param [Float] radius
  # @param [Integer, NilClass] type
  # @param [Integer] owner_unit_id
  # @param [Integer] owner_player_id
  def initialize(id, x, y, speed_x, speed_y, angle, faction, radius, type, owner_unit_id, owner_player_id)
    super(id, x, y, speed_x, speed_y, angle, faction, radius)

    @type = type
    @owner_unit_id = owner_unit_id
    @owner_player_id = owner_player_id
  end
end