require './model/wizard'
require './model/world'

class PlayerContext
  # @return [Array<Wizard, NilClass>, NilClass]
  attr_reader :wizards

  # @return [World, NilClass]
  attr_reader :world

  # @param [Array<Wizard, NilClass>, NilClass] wizards
  # @param [World, NilClass] world
  def initialize(wizards, world)
    @wizards = wizards
    @world = world
  end
end