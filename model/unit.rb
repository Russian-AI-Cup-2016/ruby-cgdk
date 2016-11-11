require './model/faction'

# noinspection RubyInstanceVariableNamingConvention
class Unit
  # @return [Integer]
  attr_reader :id

  # @return [Float]
  attr_reader :x

  # @return [Float]
  attr_reader :y

  # @return [Float]
  attr_reader :speed_x

  # @return [Float]
  attr_reader :speed_y

  # @return [Float]
  attr_reader :angle

  # @return [Integer, NilClass]
  attr_reader :faction

  # @param [Integer] id
  # @param [Float] x
  # @param [Float] y
  # @param [Float] speed_x
  # @param [Float] speed_y
  # @param [Float] angle
  # @param [Integer, NilClass] faction
  def initialize(id, x, y, speed_x, speed_y, angle, faction)
    @id = id
    @x = x
    @y = y
    @speed_x = speed_x
    @speed_y = speed_y
    @angle = angle
    @faction = faction
  end

  # @param [Float] x
  # @param [Float] y
  # @return [Float]
  def get_angle_to(x, y)
    absolute_angle_to = Math::atan2(y - @y, x - @x)
    relative_angle_to = absolute_angle_to - @angle

    while relative_angle_to > Math::PI
      relative_angle_to -= 2.0 * Math::PI
    end

    while relative_angle_to < -Math::PI
      relative_angle_to += 2.0 * Math::PI
    end

    relative_angle_to
  end

  # @param [Unit] unit
  # @return [Float]
  def get_angle_to_unit(unit)
    get_angle_to(unit.x, unit.y)
  end

  # @param [Float] x
  # @param [Float] y
  # @return [Float]
  def get_distance_to(x, y)
    Math::hypot(x - @x, y - @y)
  end

  # @param [Unit] unit
  # @return [Float]
  def get_distance_to_unit(unit)
    get_distance_to(unit.x, unit.y)
  end

  # @param [Float] x
  # @param [Float] y
  # @return [Float]
  def angle_to(x, y)
    absolute_angle_to = Math::atan2(y - @y, x - @x)
    relative_angle_to = absolute_angle_to - @angle

    while relative_angle_to > Math::PI
      relative_angle_to -= 2.0 * Math::PI
    end

    while relative_angle_to < -Math::PI
      relative_angle_to += 2.0 * Math::PI
    end

    relative_angle_to
  end

  # @param [Unit] unit
  # @return [Float]
  def angle_to_unit(unit)
    get_angle_to(unit.x, unit.y)
  end

  # @param [Float] x
  # @param [Float] y
  # @return [Float]
  def distance_to(x, y)
    Math::hypot(x - @x, y - @y)
  end

  # @param [Unit] unit
  # @return [Float]
  def distance_to_unit(unit)
    get_distance_to(unit.x, unit.y)
  end
end