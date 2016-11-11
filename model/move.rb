require './model/action_type'
require './model/message'
require './model/skill_type'

# noinspection RubyTooManyInstanceVariablesInspection
class Move
  # @return [Float]
  attr_accessor :speed

  # @return [Float]
  attr_accessor :strafe_speed

  # @return [Float]
  attr_accessor :turn

  # @return [Integer, NilClass]
  attr_accessor :action

  # @return [Float]
  attr_accessor :cast_angle

  # @return [Float]
  attr_accessor :min_cast_distance

  # @return [Float]
  attr_accessor :max_cast_distance

  # @return [Integer]
  attr_accessor :status_target_id

  # @return [Integer, NilClass]
  attr_accessor :skill_to_learn

  # @return [Array<Message, NilClass>, NilClass]
  attr_accessor :messages

  def initialize
    @speed = 0.0
    @strafe_speed = 0.0
    @turn = 0.0
    @action = nil
    @cast_angle = 0.0
    @min_cast_distance = 0.0
    @max_cast_distance = 10000.0
    @status_target_id = -1
    @skill_to_learn = nil
    @messages = nil
  end
end