require './model/status_type'

# noinspection RubyParameterNamingConvention
class Status
  # @return [Integer]
  attr_reader :id

  # @return [Integer, NilClass]
  attr_reader :type

  # @return [Integer]
  attr_reader :wizard_id

  # @return [Integer]
  attr_reader :player_id

  # @return [Integer]
  attr_reader :remaining_duration_ticks

  # @param [Integer] id
  # @param [Integer, NilClass] type
  # @param [Integer] wizard_id
  # @param [Integer] player_id
  # @param [Integer] remaining_duration_ticks
  def initialize(id, type, wizard_id, player_id, remaining_duration_ticks)
    @id = id
    @type = type
    @wizard_id = wizard_id
    @player_id = player_id
    @remaining_duration_ticks = remaining_duration_ticks
  end
end