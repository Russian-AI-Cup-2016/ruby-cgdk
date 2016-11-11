require './model/building_type'
require './model/faction'
require './model/living_unit'
require './model/status'

# noinspection RubyInstanceVariableNamingConvention,RubyParameterNamingConvention
class Building < LivingUnit
  # @return [Integer, NilClass]
  attr_reader :type

  # @return [Float]
  attr_reader :vision_range

  # @return [Float]
  attr_reader :attack_range

  # @return [Integer]
  attr_reader :damage

  # @return [Integer]
  attr_reader :cooldown_ticks

  # @return [Integer]
  attr_reader :remaining_action_cooldown_ticks

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
  # @param [Integer, NilClass] type
  # @param [Float] vision_range
  # @param [Float] attack_range
  # @param [Integer] damage
  # @param [Integer] cooldown_ticks
  # @param [Integer] remaining_action_cooldown_ticks
  def initialize(id, x, y, speed_x, speed_y, angle, faction, radius, life, max_life, statuses, type, vision_range,
                 attack_range, damage, cooldown_ticks, remaining_action_cooldown_ticks)
    super(id, x, y, speed_x, speed_y, angle, faction, radius, life, max_life, statuses)

    @type = type
    @vision_range = vision_range
    @attack_range = attack_range
    @damage = damage
    @cooldown_ticks = cooldown_ticks
    @remaining_action_cooldown_ticks = remaining_action_cooldown_ticks
  end
end