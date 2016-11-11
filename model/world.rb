require './model/bonus'
require './model/building'
require './model/minion'
require './model/player'
require './model/projectile'
require './model/tree'
require './model/wizard'

# noinspection RubyTooManyInstanceVariablesInspection
class World
  # @return [Integer]
  attr_reader :tick_index

  # @return [Integer]
  attr_reader :tick_count

  # @return [Float]
  attr_reader :width

  # @return [Float]
  attr_reader :height

  # @return [Array<Player, NilClass>, NilClass]
  attr_reader :players

  # @return [Array<Wizard, NilClass>, NilClass]
  attr_reader :wizards

  # @return [Array<Minion, NilClass>, NilClass]
  attr_reader :minions

  # @return [Array<Projectile, NilClass>, NilClass]
  attr_reader :projectiles

  # @return [Array<Bonus, NilClass>, NilClass]
  attr_reader :bonuses

  # @return [Array<Building, NilClass>, NilClass]
  attr_reader :buildings

  # @return [Array<Tree, NilClass>, NilClass]
  attr_reader :trees

  # @param [Integer] tick_index
  # @param [Integer] tick_count
  # @param [Float] width
  # @param [Float] height
  # @param [Array<Player, NilClass>, NilClass] players
  # @param [Array<Wizard, NilClass>, NilClass] wizards
  # @param [Array<Minion, NilClass>, NilClass] minions
  # @param [Array<Projectile, NilClass>, NilClass] projectiles
  # @param [Array<Bonus, NilClass>, NilClass] bonuses
  # @param [Array<Building, NilClass>, NilClass] buildings
  # @param [Array<Tree, NilClass>, NilClass] trees
  def initialize(tick_index, tick_count, width, height, players, wizards, minions, projectiles, bonuses, buildings,
                 trees)
    @tick_index = tick_index
    @tick_count = tick_count
    @width = width
    @height = height
    @players = players
    @wizards = wizards
    @minions = minions
    @projectiles = projectiles
    @bonuses = bonuses
    @buildings = buildings
    @trees = trees
  end

  # @return [Player, NilClass]
  def my_player
    @players.each do |player|
      if player.me
        return player
      end
    end

    nil
  end
end