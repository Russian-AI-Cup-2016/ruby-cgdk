require './model/lane_type'
require './model/skill_type'

class Message
  # @return [Integer, NilClass]
  attr_reader :lane

  # @return [Integer, NilClass]
  attr_reader :skill_to_learn

  # @return
  attr_reader :raw_message

  # @param [Integer, NilClass] lane
  # @param [Integer, NilClass] skill_to_learn
  # @param raw_message
  def initialize(lane, skill_to_learn, raw_message)
    @lane = lane
    @skill_to_learn = skill_to_learn
    @raw_message = raw_message
  end
end