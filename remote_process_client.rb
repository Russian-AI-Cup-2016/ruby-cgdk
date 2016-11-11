require 'socket'
require './model/action_type'
require './model/bonus'
require './model/bonus_type'
require './model/building'
require './model/building_type'
require './model/circular_unit'
require './model/faction'
require './model/game'
require './model/lane_type'
require './model/living_unit'
require './model/message'
require './model/minion'
require './model/minion_type'
require './model/move'
require './model/player'
require './model/player_context'
require './model/projectile'
require './model/projectile_type'
require './model/skill_type'
require './model/status'
require './model/status_type'
require './model/tree'
require './model/unit'
require './model/wizard'
require './model/world'

# noinspection RubyTooManyMethodsInspection
class RemoteProcessClient
  LITTLE_ENDIAN_BYTE_ORDER = true

  BYTE_ORDER_FORMAT_STRING = LITTLE_ENDIAN_BYTE_ORDER ? '<' : '>'

  INT_FORMAT_STRING = 'l' + BYTE_ORDER_FORMAT_STRING
  LONG_FORMAT_STRING = 'q' + BYTE_ORDER_FORMAT_STRING
  DOUBLE_FORMAT_STRING = LITTLE_ENDIAN_BYTE_ORDER ? 'E' : 'G'

  SIGNED_BYTE_SIZE_BYTES = 1
  INTEGER_SIZE_BYTES = 4
  LONG_SIZE_BYTES = 8
  DOUBLE_SIZE_BYTES = 8

  EMPTY_BYTE_ARRAY = ''

  @players = nil
  @buildings = nil
  @trees = nil

  def initialize(host, port)
    @socket = TCPSocket::new(host, port)
  end

  def write_token_message(token)
    write_enum(MessageType::AUTHENTICATION_TOKEN)
    write_string(token)
  end

  def write_protocol_version_message
    write_enum(MessageType::PROTOCOL_VERSION)
    write_int(2)
  end

  def read_team_size_message
    ensure_message_type(read_enum(MessageType), MessageType::TEAM_SIZE)
    read_int
  end

  def read_game_context_message
    ensure_message_type(read_enum(MessageType), MessageType::GAME_CONTEXT)
    read_game
  end

  def read_player_context_message
    message_type = read_enum(MessageType)
    if message_type == MessageType::GAME_OVER
      return nil
    end

    ensure_message_type(message_type, MessageType::PLAYER_CONTEXT)
    read_player_context
  end

  def write_moves_message(moves)
    write_enum(MessageType::MOVES)
    write_moves(moves)
  end

  def read_bonus
    unless read_boolean
      return nil
    end

    Bonus::new(read_long, read_double, read_double, read_double, read_double, read_double, read_enum(Faction),
               read_double, read_enum(BonusType))
  end

  def write_bonus(bonus)
    if bonus.nil?
      write_boolean(false)
    else
      write_boolean(true)

      write_long(bonus.id)
      write_double(bonus.x)
      write_double(bonus.y)
      write_double(bonus.speed_x)
      write_double(bonus.speed_y)
      write_double(bonus.angle)
      write_enum(bonus.faction)
      write_double(bonus.radius)
      write_enum(bonus.type)
    end
  end

  def read_bonuses
    bonus_count = read_int
    if bonus_count < 0
      return nil
    end

    bonuses = []

    bonus_count.times do |_|
      bonuses.push(read_bonus)
    end

    bonuses
  end

  def write_bonuses(bonuses)
    if bonuses.nil?
      write_int(-1)
    else
      write_int(bonuses.length)

      bonuses.each do |bonus|
        write_bonus(bonus)
      end
    end
  end

  def read_building
    unless read_boolean
      return nil
    end

    Building::new(read_long, read_double, read_double, read_double, read_double, read_double, read_enum(Faction),
                  read_double, read_int, read_int, read_statuses, read_enum(BuildingType), read_double, read_double,
                  read_int, read_int, read_int)
  end

  def write_building(building)
    if building.nil?
      write_boolean(false)
    else
      write_boolean(true)

      write_long(building.id)
      write_double(building.x)
      write_double(building.y)
      write_double(building.speed_x)
      write_double(building.speed_y)
      write_double(building.angle)
      write_enum(building.faction)
      write_double(building.radius)
      write_int(building.life)
      write_int(building.max_life)
      write_statuses(building.statuses)
      write_enum(building.type)
      write_double(building.vision_range)
      write_double(building.attack_range)
      write_int(building.damage)
      write_int(building.cooldown_ticks)
      write_int(building.remaining_action_cooldown_ticks)
    end
  end

  def read_buildings
    building_count = read_int
    if building_count < 0
      return @buildings
    end

    buildings = []

    building_count.times do |_|
      buildings.push(read_building)
    end

    @buildings = buildings
  end

  def write_buildings(buildings)
    if buildings.nil?
      write_int(-1)
    else
      write_int(buildings.length)

      buildings.each do |building|
        write_building(building)
      end
    end
  end

  def read_game
    unless read_boolean
      return nil
    end

    Game::new(read_long, read_int, read_double, read_boolean, read_boolean, read_double, read_double, read_double,
              read_double, read_double, read_double, read_double, read_double, read_int, read_double, read_int,
              read_double, read_double, read_double, read_double, read_double, read_double, read_double, read_int,
              read_int, read_int, read_int, read_double, read_double, read_double, read_double, read_double, read_int,
              read_int, read_int, read_int, read_int, read_int, read_int, read_int, read_int, read_int, read_int,
              read_int, read_int, read_int, read_int, read_double, read_double, read_ints, read_double, read_double,
              read_double, read_double, read_int, read_int, read_int, read_int, read_double, read_double, read_int,
              read_double, read_double, read_double, read_int, read_int, read_double, read_double, read_int,
              read_double, read_double, read_int, read_double, read_double, read_int, read_double, read_double,
              read_double, read_double, read_int, read_int, read_double, read_double, read_double, read_double,
              read_int, read_int, read_double, read_double, read_double, read_double, read_int, read_int, read_int,
              read_int, read_int, read_double, read_int, read_int, read_double, read_double, read_double, read_int,
              read_double, read_double, read_double, read_double, read_int, read_int, read_double, read_int)
  end

  def write_game(game)
    if game.nil?
      write_boolean(false)
    else
      write_boolean(true)

      write_long(game.random_seed)
      write_int(game.tick_count)
      write_double(game.map_size)
      write_boolean(game.skills_enabled)
      write_boolean(game.raw_messages_enabled)
      write_double(game.friendly_fire_damage_factor)
      write_double(game.building_damage_score_factor)
      write_double(game.building_elimination_score_factor)
      write_double(game.minion_damage_score_factor)
      write_double(game.minion_elimination_score_factor)
      write_double(game.wizard_damage_score_factor)
      write_double(game.wizard_elimination_score_factor)
      write_double(game.team_working_score_factor)
      write_int(game.victory_score)
      write_double(game.score_gain_range)
      write_int(game.raw_message_max_length)
      write_double(game.raw_message_transmission_speed)
      write_double(game.wizard_radius)
      write_double(game.wizard_cast_range)
      write_double(game.wizard_vision_range)
      write_double(game.wizard_forward_speed)
      write_double(game.wizard_backward_speed)
      write_double(game.wizard_strafe_speed)
      write_int(game.wizard_base_life)
      write_int(game.wizard_life_growth_per_level)
      write_int(game.wizard_base_mana)
      write_int(game.wizard_mana_growth_per_level)
      write_double(game.wizard_base_life_regeneration)
      write_double(game.wizard_life_regeneration_growth_per_level)
      write_double(game.wizard_base_mana_regeneration)
      write_double(game.wizard_mana_regeneration_growth_per_level)
      write_double(game.wizard_max_turn_angle)
      write_int(game.wizard_max_resurrection_delay_ticks)
      write_int(game.wizard_min_resurrection_delay_ticks)
      write_int(game.wizard_action_cooldown_ticks)
      write_int(game.staff_cooldown_ticks)
      write_int(game.magic_missile_cooldown_ticks)
      write_int(game.frost_bolt_cooldown_ticks)
      write_int(game.fireball_cooldown_ticks)
      write_int(game.haste_cooldown_ticks)
      write_int(game.shield_cooldown_ticks)
      write_int(game.magic_missile_manacost)
      write_int(game.frost_bolt_manacost)
      write_int(game.fireball_manacost)
      write_int(game.haste_manacost)
      write_int(game.shield_manacost)
      write_int(game.staff_damage)
      write_double(game.staff_sector)
      write_double(game.staff_range)
      write_ints(game.level_up_xp_values)
      write_double(game.minion_radius)
      write_double(game.minion_vision_range)
      write_double(game.minion_speed)
      write_double(game.minion_max_turn_angle)
      write_int(game.minion_life)
      write_int(game.faction_minion_appearance_interval_ticks)
      write_int(game.orc_woodcutter_action_cooldown_ticks)
      write_int(game.orc_woodcutter_damage)
      write_double(game.orc_woodcutter_attack_sector)
      write_double(game.orc_woodcutter_attack_range)
      write_int(game.fetish_blowdart_action_cooldown_ticks)
      write_double(game.fetish_blowdart_attack_range)
      write_double(game.fetish_blowdart_attack_sector)
      write_double(game.bonus_radius)
      write_int(game.bonus_appearance_interval_ticks)
      write_int(game.bonus_score_amount)
      write_double(game.dart_radius)
      write_double(game.dart_speed)
      write_int(game.dart_direct_damage)
      write_double(game.magic_missile_radius)
      write_double(game.magic_missile_speed)
      write_int(game.magic_missile_direct_damage)
      write_double(game.frost_bolt_radius)
      write_double(game.frost_bolt_speed)
      write_int(game.frost_bolt_direct_damage)
      write_double(game.fireball_radius)
      write_double(game.fireball_speed)
      write_double(game.fireball_explosion_max_damage_range)
      write_double(game.fireball_explosion_min_damage_range)
      write_int(game.fireball_explosion_max_damage)
      write_int(game.fireball_explosion_min_damage)
      write_double(game.guardian_tower_radius)
      write_double(game.guardian_tower_vision_range)
      write_double(game.guardian_tower_life)
      write_double(game.guardian_tower_attack_range)
      write_int(game.guardian_tower_damage)
      write_int(game.guardian_tower_cooldown_ticks)
      write_double(game.faction_base_radius)
      write_double(game.faction_base_vision_range)
      write_double(game.faction_base_life)
      write_double(game.faction_base_attack_range)
      write_int(game.faction_base_damage)
      write_int(game.faction_base_cooldown_ticks)
      write_int(game.burning_duration_ticks)
      write_int(game.burning_summary_damage)
      write_int(game.empowered_duration_ticks)
      write_double(game.empowered_damage_factor)
      write_int(game.frozen_duration_ticks)
      write_int(game.hastened_duration_ticks)
      write_double(game.hastened_bonus_duration_factor)
      write_double(game.hastened_movement_bonus_factor)
      write_double(game.hastened_rotation_bonus_factor)
      write_int(game.shielded_duration_ticks)
      write_double(game.shielded_bonus_duration_factor)
      write_double(game.shielded_direct_damage_absorption_factor)
      write_double(game.aura_skill_range)
      write_double(game.range_bonus_per_skill_level)
      write_int(game.magical_damage_bonus_per_skill_level)
      write_int(game.staff_damage_bonus_per_skill_level)
      write_double(game.movement_bonus_factor_per_skill_level)
      write_int(game.magical_damage_absorption_per_skill_level)
    end
  end

  def read_games
    game_count = read_int
    if game_count < 0
      return nil
    end

    games = []

    game_count.times do |_|
      games.push(read_game)
    end

    games
  end

  def write_games(games)
    if games.nil?
      write_int(-1)
    else
      write_int(games.length)

      games.each do |game|
        write_game(game)
      end
    end
  end

  def read_message
    unless read_boolean
      return nil
    end

    Message::new(read_enum(LaneType), read_enum(SkillType), read_byte_array(false))
  end

  def write_message(message)
    if message.nil?
      write_boolean(false)
    else
      write_boolean(true)

      write_enum(message.lane)
      write_enum(message.skill_to_learn)
      write_byte_array(message.raw_message)
    end
  end

  def read_messages
    message_count = read_int
    if message_count < 0
      return nil
    end

    messages = []

    message_count.times do |_|
      messages.push(read_message)
    end

    messages
  end

  def write_messages(messages)
    if messages.nil?
      write_int(-1)
    else
      write_int(messages.length)

      messages.each do |message|
        write_message(message)
      end
    end
  end

  def read_minion
    unless read_boolean
      return nil
    end

    Minion::new(read_long, read_double, read_double, read_double, read_double, read_double, read_enum(Faction),
                read_double, read_int, read_int, read_statuses, read_enum(MinionType), read_double, read_int, read_int,
                read_int)
  end

  def write_minion(minion)
    if minion.nil?
      write_boolean(false)
    else
      write_boolean(true)

      write_long(minion.id)
      write_double(minion.x)
      write_double(minion.y)
      write_double(minion.speed_x)
      write_double(minion.speed_y)
      write_double(minion.angle)
      write_enum(minion.faction)
      write_double(minion.radius)
      write_int(minion.life)
      write_int(minion.max_life)
      write_statuses(minion.statuses)
      write_enum(minion.type)
      write_double(minion.vision_range)
      write_int(minion.damage)
      write_int(minion.cooldown_ticks)
      write_int(minion.remaining_action_cooldown_ticks)
    end
  end

  def read_minions
    minion_count = read_int
    if minion_count < 0
      return nil
    end

    minions = []

    minion_count.times do |_|
      minions.push(read_minion)
    end

    minions
  end

  def write_minions(minions)
    if minions.nil?
      write_int(-1)
    else
      write_int(minions.length)

      minions.each do |minion|
        write_minion(minion)
      end
    end
  end

  # @param [Move] move
  def write_move(move)
    if move.nil?
      write_boolean(false)
    else
      write_boolean(true)

      write_double(move.speed)
      write_double(move.strafe_speed)
      write_double(move.turn)
      write_enum(move.action)
      write_double(move.cast_angle)
      write_double(move.min_cast_distance)
      write_double(move.max_cast_distance)
      write_long(move.status_target_id)
      write_enum(move.skill_to_learn)
      write_messages(move.messages)
    end
  end

  def write_moves(moves)
    if moves.nil?
      write_int(-1)
    else
      write_int(moves.length)

      moves.each do |move|
        write_move(move)
      end
    end
  end

  def read_player
    unless read_boolean
      return nil
    end

    Player::new(read_long, read_boolean, read_string, read_boolean, read_int, read_enum(Faction))
  end

  def write_player(player)
    if player.nil?
      write_boolean(false)
    else
      write_boolean(true)

      write_long(player.id)
      write_boolean(player.me)
      write_string(player.name)
      write_boolean(player.strategy_crashed)
      write_int(player.score)
      write_enum(player.faction)
    end
  end

  def read_players
    player_count = read_int
    if player_count < 0
      return @players
    end

    players = []

    player_count.times do |_|
      players.push(read_player)
    end

    @players = players
  end

  def write_players(players)
    if players.nil?
      write_int(-1)
    else
      write_int(players.length)

      players.each do |player|
        write_player(player)
      end
    end
  end

  def read_player_context
    unless read_boolean
      return nil
    end

    PlayerContext::new(read_wizards, read_world)
  end

  def write_player_context(player_context)
    if player_context.nil?
      write_boolean(false)
    else
      write_boolean(true)

      write_wizards(player_context.wizards)
      write_world(player_context.world)
    end
  end

  def read_player_contexts
    player_context_count = read_int
    if player_context_count < 0
      return nil
    end

    player_contexts = []

    player_context_count.times do |_|
      player_contexts.push(read_player_context)
    end

    player_contexts
  end

  def write_player_contexts(player_contexts)
    if player_contexts.nil?
      write_int(-1)
    else
      write_int(player_contexts.length)

      player_contexts.each do |player_context|
        write_player_context(player_context)
      end
    end
  end

  def read_projectile
    unless read_boolean
      return nil
    end

    Projectile::new(read_long, read_double, read_double, read_double, read_double, read_double, read_enum(Faction),
                    read_double, read_enum(ProjectileType), read_long, read_long)
  end

  def write_projectile(projectile)
    if projectile.nil?
      write_boolean(false)
    else
      write_boolean(true)

      write_long(projectile.id)
      write_double(projectile.x)
      write_double(projectile.y)
      write_double(projectile.speed_x)
      write_double(projectile.speed_y)
      write_double(projectile.angle)
      write_enum(projectile.faction)
      write_double(projectile.radius)
      write_enum(projectile.type)
      write_long(projectile.owner_unit_id)
      write_long(projectile.owner_player_id)
    end
  end

  def read_projectiles
    projectile_count = read_int
    if projectile_count < 0
      return nil
    end

    projectiles = []

    projectile_count.times do |_|
      projectiles.push(read_projectile)
    end

    projectiles
  end

  def write_projectiles(projectiles)
    if projectiles.nil?
      write_int(-1)
    else
      write_int(projectiles.length)

      projectiles.each do |projectile|
        write_projectile(projectile)
      end
    end
  end

  def read_status
    unless read_boolean
      return nil
    end

    Status::new(read_long, read_enum(StatusType), read_long, read_long, read_int)
  end

  def write_status(status)
    if status.nil?
      write_boolean(false)
    else
      write_boolean(true)

      write_long(status.id)
      write_enum(status.type)
      write_long(status.wizard_id)
      write_long(status.player_id)
      write_int(status.remaining_duration_ticks)
    end
  end

  def read_statuses
    status_count = read_int
    if status_count < 0
      return nil
    end

    statuses = []

    status_count.times do |_|
      statuses.push(read_status)
    end

    statuses
  end

  def write_statuses(statuses)
    if statuses.nil?
      write_int(-1)
    else
      write_int(statuses.length)

      statuses.each do |status|
        write_status(status)
      end
    end
  end

  def read_tree
    unless read_boolean
      return nil
    end

    Tree::new(read_long, read_double, read_double, read_double, read_double, read_double, read_enum(Faction),
              read_double, read_int, read_int, read_statuses)
  end

  def write_tree(tree)
    if tree.nil?
      write_boolean(false)
    else
      write_boolean(true)

      write_long(tree.id)
      write_double(tree.x)
      write_double(tree.y)
      write_double(tree.speed_x)
      write_double(tree.speed_y)
      write_double(tree.angle)
      write_enum(tree.faction)
      write_double(tree.radius)
      write_int(tree.life)
      write_int(tree.max_life)
      write_statuses(tree.statuses)
    end
  end

  def read_trees
    tree_count = read_int
    if tree_count < 0
      return @trees
    end

    trees = []

    tree_count.times do |_|
      trees.push(read_tree)
    end

    @trees = trees
  end

  def write_trees(trees)
    if trees.nil?
      write_int(-1)
    else
      write_int(trees.length)

      trees.each do |tree|
        write_tree(tree)
      end
    end
  end

  def read_wizard
    unless read_boolean
      return nil
    end

    Wizard::new(read_long, read_double, read_double, read_double, read_double, read_double, read_enum(Faction),
                read_double, read_int, read_int, read_statuses, read_long, read_boolean, read_int, read_int,
                read_double, read_double, read_int, read_int, read_enums(SkillType), read_int, read_ints, read_boolean,
                read_messages)
  end

  def write_wizard(wizard)
    if wizard.nil?
      write_boolean(false)
    else
      write_boolean(true)

      write_long(wizard.id)
      write_double(wizard.x)
      write_double(wizard.y)
      write_double(wizard.speed_x)
      write_double(wizard.speed_y)
      write_double(wizard.angle)
      write_enum(wizard.faction)
      write_double(wizard.radius)
      write_int(wizard.life)
      write_int(wizard.max_life)
      write_statuses(wizard.statuses)
      write_long(wizard.owner_player_id)
      write_boolean(wizard.me)
      write_int(wizard.mana)
      write_int(wizard.max_mana)
      write_double(wizard.vision_range)
      write_double(wizard.cast_range)
      write_int(wizard.xp)
      write_int(wizard.level)
      write_enums(wizard.skills)
      write_int(wizard.remaining_action_cooldown_ticks)
      write_ints(wizard.remaining_cooldown_ticks_by_action)
      write_boolean(wizard.master)
      write_messages(wizard.messages)
    end
  end

  def read_wizards
    wizard_count = read_int
    if wizard_count < 0
      return nil
    end

    wizards = []

    wizard_count.times do |_|
      wizards.push(read_wizard)
    end

    wizards
  end

  def write_wizards(wizards)
    if wizards.nil?
      write_int(-1)
    else
      write_int(wizards.length)

      wizards.each do |wizard|
        write_wizard(wizard)
      end
    end
  end

  def read_world
    unless read_boolean
      return nil
    end

    World::new(read_int, read_int, read_double, read_double, read_players, read_wizards, read_minions, read_projectiles,
               read_bonuses, read_buildings, read_trees)
  end

  def write_world(world)
    if world.nil?
      write_boolean(false)
    else
      write_boolean(true)

      write_int(world.tick_index)
      write_int(world.tick_count)
      write_double(world.width)
      write_double(world.height)
      write_players(world.players)
      write_wizards(world.wizards)
      write_minions(world.minions)
      write_projectiles(world.projectiles)
      write_bonuses(world.bonuses)
      write_buildings(world.buildings)
      write_trees(world.trees)
    end
  end

  def read_worlds
    world_count = read_int
    if world_count < 0
      return nil
    end

    worlds = []

    world_count.times do |_|
      worlds.push(read_world)
    end

    worlds
  end

  def write_worlds(worlds)
    if worlds.nil?
      write_int(-1)
    else
      write_int(worlds.length)

      worlds.each do |world|
        write_world(world)
      end
    end
  end

  def ensure_message_type(actual_type, expected_type)
    if actual_type != expected_type
      raise ArgumentError "Received wrong message [actual=#{actual_type}, expected=#{expected_type}]."
    end
  end

  def read_byte_array(nullable)
    count = read_int

    if nullable
      if count < 0
        return nil
      end
    else
      if count <= 0
        return EMPTY_BYTE_ARRAY
      end
    end

    read_bytes(count)
  end

  def write_byte_array(array)
    if array.nil?
      write_int(-1)
    else
      write_int(array.length)
      write_bytes(array)
    end
  end

  def read_enum(enum_class)
    byte_array = read_bytes(SIGNED_BYTE_SIZE_BYTES)
    value = byte_array.unpack('c')[0]

    value >= 0 && value < enum_class::COUNT ? value : nil
  end

  def read_enums(enum_class)
    count = read_int
    if count < 0
      return nil
    end

    enums = []

    count.times do |_|
      enums.push(read_enum(enum_class))
    end

    enums
  end

  def read_enums_2d(enum_class)
    count = read_int
    if count < 0
      return nil
    end

    enums_2d = []

    count.times do |_|
      enums_2d.push(read_enums(enum_class))
    end

    enums_2d
  end

  def write_enum(value)
    write_bytes([value.nil? ? -1 : value].pack('c'))
  end

  def write_enums(enums)
    if enums.nil?
      write_int(-1)
    else
      write_int(enums.length)

      enums.each do |enum|
        write_enum(enum)
      end
    end
  end

  def write_enums_2d(enums_2d)
    if enums_2d.nil?
      write_enum(-1)
    else
      write_enum(enums_2d.length)

      enums_2d.each do |enums|
        write_enum(enums)
      end
    end
  end

  def read_string
    length = read_int
    if length == -1
      return nil
    end

    read_bytes(length)
  end

  def write_string(value)
    if value.nil?
      write_int(-1)
      return
    end

    write_int(value.length)
    write_bytes(value)
  end

  def read_boolean
    byte_array = read_bytes(SIGNED_BYTE_SIZE_BYTES)
    byte_array.unpack('c')[0] != 0
  end

  def write_boolean(value)
    write_bytes([value ? 1 : 0].pack('c'))
  end

  def read_int
    byte_array = read_bytes(INTEGER_SIZE_BYTES)
    byte_array.unpack(INT_FORMAT_STRING)[0]
  end

  def read_ints
    count = read_int
    if count < 0
      return nil
    end

    ints = []

    count.times do |_|
      ints.push(read_int)
    end

    ints
  end

  def read_ints_2d
    count = read_int
    if count < 0
      return nil
    end

    ints_2d = []

    count.times do |_|
      ints_2d.push(read_ints)
    end

    ints_2d
  end

  def write_int(value)
    write_bytes([value].pack(INT_FORMAT_STRING))
  end

  def write_ints(ints)
    if ints.nil?
      write_int(-1)
    else
      write_int(ints.length)

      ints.each do |int|
        write_int(int)
      end
    end
  end

  def write_ints_2d(ints_2d)
    if ints_2d.nil?
      write_int(-1)
    else
      write_int(ints_2d.length)

      ints_2d.each do |ints|
        write_int(ints)
      end
    end
  end

  def read_long
    byte_array = read_bytes(LONG_SIZE_BYTES)
    byte_array.unpack(LONG_FORMAT_STRING)[0]
  end

  def write_long(value)
    write_bytes([value].pack(LONG_FORMAT_STRING))
  end

  def read_double
    byte_array = read_bytes(DOUBLE_SIZE_BYTES)
    byte_array.unpack(DOUBLE_FORMAT_STRING)[0]
  end

  def write_double(value)
    write_bytes([value].pack(DOUBLE_FORMAT_STRING))
  end

  def read_bytes(byte_count)
    byte_array = ''

    while byte_array.length < byte_count
      chunk = @socket.recv(byte_count - byte_array.length)

      if chunk.length == 0
        raise IOError "Can't read #{byte_count} bytes from input stream."
      end

      byte_array += chunk
    end

    byte_array
  end

  def write_bytes(byte_array)
    @socket.write(byte_array)
  end

  def close
    @socket.close
  end

  module MessageType
    UNKNOWN = 0
    GAME_OVER = 1
    AUTHENTICATION_TOKEN = 2
    TEAM_SIZE = 3
    PROTOCOL_VERSION = 4
    GAME_CONTEXT = 5
    PLAYER_CONTEXT = 6
    MOVES = 7
    COUNT = 8
  end
end