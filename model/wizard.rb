require './model/faction'
require './model/living_unit'
require './model/message'
require './model/skill_type'
require './model/status'

# noinspection RubyInstanceVariableNamingConvention,RubyParameterNamingConvention,RubyTooManyInstanceVariablesInspection
class Wizard < LivingUnit
  # @return [Integer]
  attr_reader :owner_player_id

  # @return [TrueClass, FalseClass]
  attr_reader :me

  # @return [Integer]
  attr_reader :mana

  # @return [Integer]
  attr_reader :max_mana

  # @return [Float]
  attr_reader :vision_range

  # @return [Float]
  attr_reader :cast_range

  # @return [Integer]
  attr_reader :xp

  # @return [Integer]
  attr_reader :level

  # @return [Array<Integer, NilClass>, NilClass]
  attr_reader :skills

  # @return [Integer]
  attr_reader :remaining_action_cooldown_ticks

  # @return [Array<Integer>, NilClass]
  attr_reader :remaining_cooldown_ticks_by_action

  # @return [TrueClass, FalseClass]
  attr_reader :master

  # @return [Array<Message, NilClass>, NilClass]
  attr_reader :messages

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
  # @param [Integer] owner_player_id
  # @param [TrueClass, FalseClass] me
  # @param [Integer] mana
  # @param [Integer] max_mana
  # @param [Float] vision_range
  # @param [Float] cast_range
  # @param [Integer] xp
  # @param [Integer] level
  # @param [Array<Integer, NilClass>, NilClass] skills
  # @param [Integer] remaining_action_cooldown_ticks
  # @param [Array<Integer>, NilClass] remaining_cooldown_ticks_by_action
  # @param [TrueClass, FalseClass] master
  # @param [Array<Message, NilClass>, NilClass] messages
  def initialize(id, x, y, speed_x, speed_y, angle, faction, radius, life, max_life, statuses, owner_player_id, me,
                 mana, max_mana, vision_range, cast_range, xp, level, skills, remaining_action_cooldown_ticks,
                 remaining_cooldown_ticks_by_action, master, messages)
    super(id, x, y, speed_x, speed_y, angle, faction, radius, life, max_life, statuses)

    @owner_player_id = owner_player_id
    @me = me
    @mana = mana
    @max_mana = max_mana
    @vision_range = vision_range
    @cast_range = cast_range
    @xp = xp
    @level = level
    @skills = skills
    @remaining_action_cooldown_ticks = remaining_action_cooldown_ticks
    @remaining_cooldown_ticks_by_action = remaining_cooldown_ticks_by_action
    @master = master
    @messages = messages
  end
end