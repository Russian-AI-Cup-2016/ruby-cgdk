require './model/wizard'
require './model/game'
require './model/move'
require './model/world'

class MyStrategy
  # @param [Wizard] me
  # @param [World] world
  # @param [Game] game
  # @param [Move] move
  def move(me, world, game, move)
    move.speed = game.wizard_forward_speed
    move.speed = game.wizard_strafe_speed
    move.turn = game.wizard_max_turn_angle
    move.action = ActionType::MAGIC_MISSILE
  end
end