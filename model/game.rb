# noinspection RubyInstanceVariableNamingConvention,RubyParameterNamingConvention,RubyTooManyInstanceVariablesInspection
class Game
  # @return [Integer]
  attr_reader :random_seed

  # @return [Integer]
  attr_reader :tick_count

  # @return [Float]
  attr_reader :map_size

  # @return [TrueClass, FalseClass]
  attr_reader :skills_enabled

  # @return [TrueClass, FalseClass]
  attr_reader :raw_messages_enabled

  # @return [Float]
  attr_reader :friendly_fire_damage_factor

  # @return [Float]
  attr_reader :building_damage_score_factor

  # @return [Float]
  attr_reader :building_elimination_score_factor

  # @return [Float]
  attr_reader :minion_damage_score_factor

  # @return [Float]
  attr_reader :minion_elimination_score_factor

  # @return [Float]
  attr_reader :wizard_damage_score_factor

  # @return [Float]
  attr_reader :wizard_elimination_score_factor

  # @return [Float]
  attr_reader :team_working_score_factor

  # @return [Integer]
  attr_reader :victory_score

  # @return [Float]
  attr_reader :score_gain_range

  # @return [Integer]
  attr_reader :raw_message_max_length

  # @return [Float]
  attr_reader :raw_message_transmission_speed

  # @return [Float]
  attr_reader :wizard_radius

  # @return [Float]
  attr_reader :wizard_cast_range

  # @return [Float]
  attr_reader :wizard_vision_range

  # @return [Float]
  attr_reader :wizard_forward_speed

  # @return [Float]
  attr_reader :wizard_backward_speed

  # @return [Float]
  attr_reader :wizard_strafe_speed

  # @return [Integer]
  attr_reader :wizard_base_life

  # @return [Integer]
  attr_reader :wizard_life_growth_per_level

  # @return [Integer]
  attr_reader :wizard_base_mana

  # @return [Integer]
  attr_reader :wizard_mana_growth_per_level

  # @return [Float]
  attr_reader :wizard_base_life_regeneration

  # @return [Float]
  attr_reader :wizard_life_regeneration_growth_per_level

  # @return [Float]
  attr_reader :wizard_base_mana_regeneration

  # @return [Float]
  attr_reader :wizard_mana_regeneration_growth_per_level

  # @return [Float]
  attr_reader :wizard_max_turn_angle

  # @return [Integer]
  attr_reader :wizard_max_resurrection_delay_ticks

  # @return [Integer]
  attr_reader :wizard_min_resurrection_delay_ticks

  # @return [Integer]
  attr_reader :wizard_action_cooldown_ticks

  # @return [Integer]
  attr_reader :staff_cooldown_ticks

  # @return [Integer]
  attr_reader :magic_missile_cooldown_ticks

  # @return [Integer]
  attr_reader :frost_bolt_cooldown_ticks

  # @return [Integer]
  attr_reader :fireball_cooldown_ticks

  # @return [Integer]
  attr_reader :haste_cooldown_ticks

  # @return [Integer]
  attr_reader :shield_cooldown_ticks

  # @return [Integer]
  attr_reader :magic_missile_manacost

  # @return [Integer]
  attr_reader :frost_bolt_manacost

  # @return [Integer]
  attr_reader :fireball_manacost

  # @return [Integer]
  attr_reader :haste_manacost

  # @return [Integer]
  attr_reader :shield_manacost

  # @return [Integer]
  attr_reader :staff_damage

  # @return [Float]
  attr_reader :staff_sector

  # @return [Float]
  attr_reader :staff_range

  # @return [Array<Integer>, NilClass]
  attr_reader :level_up_xp_values

  # @return [Float]
  attr_reader :minion_radius

  # @return [Float]
  attr_reader :minion_vision_range

  # @return [Float]
  attr_reader :minion_speed

  # @return [Float]
  attr_reader :minion_max_turn_angle

  # @return [Integer]
  attr_reader :minion_life

  # @return [Integer]
  attr_reader :faction_minion_appearance_interval_ticks

  # @return [Integer]
  attr_reader :orc_woodcutter_action_cooldown_ticks

  # @return [Integer]
  attr_reader :orc_woodcutter_damage

  # @return [Float]
  attr_reader :orc_woodcutter_attack_sector

  # @return [Float]
  attr_reader :orc_woodcutter_attack_range

  # @return [Integer]
  attr_reader :fetish_blowdart_action_cooldown_ticks

  # @return [Float]
  attr_reader :fetish_blowdart_attack_range

  # @return [Float]
  attr_reader :fetish_blowdart_attack_sector

  # @return [Float]
  attr_reader :bonus_radius

  # @return [Integer]
  attr_reader :bonus_appearance_interval_ticks

  # @return [Integer]
  attr_reader :bonus_score_amount

  # @return [Float]
  attr_reader :dart_radius

  # @return [Float]
  attr_reader :dart_speed

  # @return [Integer]
  attr_reader :dart_direct_damage

  # @return [Float]
  attr_reader :magic_missile_radius

  # @return [Float]
  attr_reader :magic_missile_speed

  # @return [Integer]
  attr_reader :magic_missile_direct_damage

  # @return [Float]
  attr_reader :frost_bolt_radius

  # @return [Float]
  attr_reader :frost_bolt_speed

  # @return [Integer]
  attr_reader :frost_bolt_direct_damage

  # @return [Float]
  attr_reader :fireball_radius

  # @return [Float]
  attr_reader :fireball_speed

  # @return [Float]
  attr_reader :fireball_explosion_max_damage_range

  # @return [Float]
  attr_reader :fireball_explosion_min_damage_range

  # @return [Integer]
  attr_reader :fireball_explosion_max_damage

  # @return [Integer]
  attr_reader :fireball_explosion_min_damage

  # @return [Float]
  attr_reader :guardian_tower_radius

  # @return [Float]
  attr_reader :guardian_tower_vision_range

  # @return [Float]
  attr_reader :guardian_tower_life

  # @return [Float]
  attr_reader :guardian_tower_attack_range

  # @return [Integer]
  attr_reader :guardian_tower_damage

  # @return [Integer]
  attr_reader :guardian_tower_cooldown_ticks

  # @return [Float]
  attr_reader :faction_base_radius

  # @return [Float]
  attr_reader :faction_base_vision_range

  # @return [Float]
  attr_reader :faction_base_life

  # @return [Float]
  attr_reader :faction_base_attack_range

  # @return [Integer]
  attr_reader :faction_base_damage

  # @return [Integer]
  attr_reader :faction_base_cooldown_ticks

  # @return [Integer]
  attr_reader :burning_duration_ticks

  # @return [Integer]
  attr_reader :burning_summary_damage

  # @return [Integer]
  attr_reader :empowered_duration_ticks

  # @return [Float]
  attr_reader :empowered_damage_factor

  # @return [Integer]
  attr_reader :frozen_duration_ticks

  # @return [Integer]
  attr_reader :hastened_duration_ticks

  # @return [Float]
  attr_reader :hastened_bonus_duration_factor

  # @return [Float]
  attr_reader :hastened_movement_bonus_factor

  # @return [Float]
  attr_reader :hastened_rotation_bonus_factor

  # @return [Integer]
  attr_reader :shielded_duration_ticks

  # @return [Float]
  attr_reader :shielded_bonus_duration_factor

  # @return [Float]
  attr_reader :shielded_direct_damage_absorption_factor

  # @return [Float]
  attr_reader :aura_skill_range

  # @return [Float]
  attr_reader :range_bonus_per_skill_level

  # @return [Integer]
  attr_reader :magical_damage_bonus_per_skill_level

  # @return [Integer]
  attr_reader :staff_damage_bonus_per_skill_level

  # @return [Float]
  attr_reader :movement_bonus_factor_per_skill_level

  # @return [Integer]
  attr_reader :magical_damage_absorption_per_skill_level

  # @param [Integer] random_seed
  # @param [Integer] tick_count
  # @param [Float] map_size
  # @param [TrueClass, FalseClass] skills_enabled
  # @param [TrueClass, FalseClass] raw_messages_enabled
  # @param [Float] friendly_fire_damage_factor
  # @param [Float] building_damage_score_factor
  # @param [Float] building_elimination_score_factor
  # @param [Float] minion_damage_score_factor
  # @param [Float] minion_elimination_score_factor
  # @param [Float] wizard_damage_score_factor
  # @param [Float] wizard_elimination_score_factor
  # @param [Float] team_working_score_factor
  # @param [Integer] victory_score
  # @param [Float] score_gain_range
  # @param [Integer] raw_message_max_length
  # @param [Float] raw_message_transmission_speed
  # @param [Float] wizard_radius
  # @param [Float] wizard_cast_range
  # @param [Float] wizard_vision_range
  # @param [Float] wizard_forward_speed
  # @param [Float] wizard_backward_speed
  # @param [Float] wizard_strafe_speed
  # @param [Integer] wizard_base_life
  # @param [Integer] wizard_life_growth_per_level
  # @param [Integer] wizard_base_mana
  # @param [Integer] wizard_mana_growth_per_level
  # @param [Float] wizard_base_life_regeneration
  # @param [Float] wizard_life_regeneration_growth_per_level
  # @param [Float] wizard_base_mana_regeneration
  # @param [Float] wizard_mana_regeneration_growth_per_level
  # @param [Float] wizard_max_turn_angle
  # @param [Integer] wizard_max_resurrection_delay_ticks
  # @param [Integer] wizard_min_resurrection_delay_ticks
  # @param [Integer] wizard_action_cooldown_ticks
  # @param [Integer] staff_cooldown_ticks
  # @param [Integer] magic_missile_cooldown_ticks
  # @param [Integer] frost_bolt_cooldown_ticks
  # @param [Integer] fireball_cooldown_ticks
  # @param [Integer] haste_cooldown_ticks
  # @param [Integer] shield_cooldown_ticks
  # @param [Integer] magic_missile_manacost
  # @param [Integer] frost_bolt_manacost
  # @param [Integer] fireball_manacost
  # @param [Integer] haste_manacost
  # @param [Integer] shield_manacost
  # @param [Integer] staff_damage
  # @param [Float] staff_sector
  # @param [Float] staff_range
  # @param [Array<Integer>, NilClass] level_up_xp_values
  # @param [Float] minion_radius
  # @param [Float] minion_vision_range
  # @param [Float] minion_speed
  # @param [Float] minion_max_turn_angle
  # @param [Integer] minion_life
  # @param [Integer] faction_minion_appearance_interval_ticks
  # @param [Integer] orc_woodcutter_action_cooldown_ticks
  # @param [Integer] orc_woodcutter_damage
  # @param [Float] orc_woodcutter_attack_sector
  # @param [Float] orc_woodcutter_attack_range
  # @param [Integer] fetish_blowdart_action_cooldown_ticks
  # @param [Float] fetish_blowdart_attack_range
  # @param [Float] fetish_blowdart_attack_sector
  # @param [Float] bonus_radius
  # @param [Integer] bonus_appearance_interval_ticks
  # @param [Integer] bonus_score_amount
  # @param [Float] dart_radius
  # @param [Float] dart_speed
  # @param [Integer] dart_direct_damage
  # @param [Float] magic_missile_radius
  # @param [Float] magic_missile_speed
  # @param [Integer] magic_missile_direct_damage
  # @param [Float] frost_bolt_radius
  # @param [Float] frost_bolt_speed
  # @param [Integer] frost_bolt_direct_damage
  # @param [Float] fireball_radius
  # @param [Float] fireball_speed
  # @param [Float] fireball_explosion_max_damage_range
  # @param [Float] fireball_explosion_min_damage_range
  # @param [Integer] fireball_explosion_max_damage
  # @param [Integer] fireball_explosion_min_damage
  # @param [Float] guardian_tower_radius
  # @param [Float] guardian_tower_vision_range
  # @param [Float] guardian_tower_life
  # @param [Float] guardian_tower_attack_range
  # @param [Integer] guardian_tower_damage
  # @param [Integer] guardian_tower_cooldown_ticks
  # @param [Float] faction_base_radius
  # @param [Float] faction_base_vision_range
  # @param [Float] faction_base_life
  # @param [Float] faction_base_attack_range
  # @param [Integer] faction_base_damage
  # @param [Integer] faction_base_cooldown_ticks
  # @param [Integer] burning_duration_ticks
  # @param [Integer] burning_summary_damage
  # @param [Integer] empowered_duration_ticks
  # @param [Float] empowered_damage_factor
  # @param [Integer] frozen_duration_ticks
  # @param [Integer] hastened_duration_ticks
  # @param [Float] hastened_bonus_duration_factor
  # @param [Float] hastened_movement_bonus_factor
  # @param [Float] hastened_rotation_bonus_factor
  # @param [Integer] shielded_duration_ticks
  # @param [Float] shielded_bonus_duration_factor
  # @param [Float] shielded_direct_damage_absorption_factor
  # @param [Float] aura_skill_range
  # @param [Float] range_bonus_per_skill_level
  # @param [Integer] magical_damage_bonus_per_skill_level
  # @param [Integer] staff_damage_bonus_per_skill_level
  # @param [Float] movement_bonus_factor_per_skill_level
  # @param [Integer] magical_damage_absorption_per_skill_level
  def initialize(random_seed, tick_count, map_size, skills_enabled, raw_messages_enabled, friendly_fire_damage_factor,
                 building_damage_score_factor, building_elimination_score_factor, minion_damage_score_factor,
                 minion_elimination_score_factor, wizard_damage_score_factor, wizard_elimination_score_factor,
                 team_working_score_factor, victory_score, score_gain_range, raw_message_max_length,
                 raw_message_transmission_speed, wizard_radius, wizard_cast_range, wizard_vision_range,
                 wizard_forward_speed, wizard_backward_speed, wizard_strafe_speed, wizard_base_life,
                 wizard_life_growth_per_level, wizard_base_mana, wizard_mana_growth_per_level,
                 wizard_base_life_regeneration, wizard_life_regeneration_growth_per_level,
                 wizard_base_mana_regeneration, wizard_mana_regeneration_growth_per_level, wizard_max_turn_angle,
                 wizard_max_resurrection_delay_ticks, wizard_min_resurrection_delay_ticks, wizard_action_cooldown_ticks,
                 staff_cooldown_ticks, magic_missile_cooldown_ticks, frost_bolt_cooldown_ticks, fireball_cooldown_ticks,
                 haste_cooldown_ticks, shield_cooldown_ticks, magic_missile_manacost, frost_bolt_manacost,
                 fireball_manacost, haste_manacost, shield_manacost, staff_damage, staff_sector, staff_range,
                 level_up_xp_values, minion_radius, minion_vision_range, minion_speed, minion_max_turn_angle,
                 minion_life, faction_minion_appearance_interval_ticks, orc_woodcutter_action_cooldown_ticks,
                 orc_woodcutter_damage, orc_woodcutter_attack_sector, orc_woodcutter_attack_range,
                 fetish_blowdart_action_cooldown_ticks, fetish_blowdart_attack_range, fetish_blowdart_attack_sector,
                 bonus_radius, bonus_appearance_interval_ticks, bonus_score_amount, dart_radius, dart_speed,
                 dart_direct_damage, magic_missile_radius, magic_missile_speed, magic_missile_direct_damage,
                 frost_bolt_radius, frost_bolt_speed, frost_bolt_direct_damage, fireball_radius, fireball_speed,
                 fireball_explosion_max_damage_range, fireball_explosion_min_damage_range,
                 fireball_explosion_max_damage, fireball_explosion_min_damage, guardian_tower_radius,
                 guardian_tower_vision_range, guardian_tower_life, guardian_tower_attack_range, guardian_tower_damage,
                 guardian_tower_cooldown_ticks, faction_base_radius, faction_base_vision_range, faction_base_life,
                 faction_base_attack_range, faction_base_damage, faction_base_cooldown_ticks, burning_duration_ticks,
                 burning_summary_damage, empowered_duration_ticks, empowered_damage_factor, frozen_duration_ticks,
                 hastened_duration_ticks, hastened_bonus_duration_factor, hastened_movement_bonus_factor,
                 hastened_rotation_bonus_factor, shielded_duration_ticks, shielded_bonus_duration_factor,
                 shielded_direct_damage_absorption_factor, aura_skill_range, range_bonus_per_skill_level,
                 magical_damage_bonus_per_skill_level, staff_damage_bonus_per_skill_level,
                 movement_bonus_factor_per_skill_level, magical_damage_absorption_per_skill_level)
    @random_seed = random_seed
    @tick_count = tick_count
    @map_size = map_size
    @skills_enabled = skills_enabled
    @raw_messages_enabled = raw_messages_enabled
    @friendly_fire_damage_factor = friendly_fire_damage_factor
    @building_damage_score_factor = building_damage_score_factor
    @building_elimination_score_factor = building_elimination_score_factor
    @minion_damage_score_factor = minion_damage_score_factor
    @minion_elimination_score_factor = minion_elimination_score_factor
    @wizard_damage_score_factor = wizard_damage_score_factor
    @wizard_elimination_score_factor = wizard_elimination_score_factor
    @team_working_score_factor = team_working_score_factor
    @victory_score = victory_score
    @score_gain_range = score_gain_range
    @raw_message_max_length = raw_message_max_length
    @raw_message_transmission_speed = raw_message_transmission_speed
    @wizard_radius = wizard_radius
    @wizard_cast_range = wizard_cast_range
    @wizard_vision_range = wizard_vision_range
    @wizard_forward_speed = wizard_forward_speed
    @wizard_backward_speed = wizard_backward_speed
    @wizard_strafe_speed = wizard_strafe_speed
    @wizard_base_life = wizard_base_life
    @wizard_life_growth_per_level = wizard_life_growth_per_level
    @wizard_base_mana = wizard_base_mana
    @wizard_mana_growth_per_level = wizard_mana_growth_per_level
    @wizard_base_life_regeneration = wizard_base_life_regeneration
    @wizard_life_regeneration_growth_per_level = wizard_life_regeneration_growth_per_level
    @wizard_base_mana_regeneration = wizard_base_mana_regeneration
    @wizard_mana_regeneration_growth_per_level = wizard_mana_regeneration_growth_per_level
    @wizard_max_turn_angle = wizard_max_turn_angle
    @wizard_max_resurrection_delay_ticks = wizard_max_resurrection_delay_ticks
    @wizard_min_resurrection_delay_ticks = wizard_min_resurrection_delay_ticks
    @wizard_action_cooldown_ticks = wizard_action_cooldown_ticks
    @staff_cooldown_ticks = staff_cooldown_ticks
    @magic_missile_cooldown_ticks = magic_missile_cooldown_ticks
    @frost_bolt_cooldown_ticks = frost_bolt_cooldown_ticks
    @fireball_cooldown_ticks = fireball_cooldown_ticks
    @haste_cooldown_ticks = haste_cooldown_ticks
    @shield_cooldown_ticks = shield_cooldown_ticks
    @magic_missile_manacost = magic_missile_manacost
    @frost_bolt_manacost = frost_bolt_manacost
    @fireball_manacost = fireball_manacost
    @haste_manacost = haste_manacost
    @shield_manacost = shield_manacost
    @staff_damage = staff_damage
    @staff_sector = staff_sector
    @staff_range = staff_range
    @level_up_xp_values = level_up_xp_values
    @minion_radius = minion_radius
    @minion_vision_range = minion_vision_range
    @minion_speed = minion_speed
    @minion_max_turn_angle = minion_max_turn_angle
    @minion_life = minion_life
    @faction_minion_appearance_interval_ticks = faction_minion_appearance_interval_ticks
    @orc_woodcutter_action_cooldown_ticks = orc_woodcutter_action_cooldown_ticks
    @orc_woodcutter_damage = orc_woodcutter_damage
    @orc_woodcutter_attack_sector = orc_woodcutter_attack_sector
    @orc_woodcutter_attack_range = orc_woodcutter_attack_range
    @fetish_blowdart_action_cooldown_ticks = fetish_blowdart_action_cooldown_ticks
    @fetish_blowdart_attack_range = fetish_blowdart_attack_range
    @fetish_blowdart_attack_sector = fetish_blowdart_attack_sector
    @bonus_radius = bonus_radius
    @bonus_appearance_interval_ticks = bonus_appearance_interval_ticks
    @bonus_score_amount = bonus_score_amount
    @dart_radius = dart_radius
    @dart_speed = dart_speed
    @dart_direct_damage = dart_direct_damage
    @magic_missile_radius = magic_missile_radius
    @magic_missile_speed = magic_missile_speed
    @magic_missile_direct_damage = magic_missile_direct_damage
    @frost_bolt_radius = frost_bolt_radius
    @frost_bolt_speed = frost_bolt_speed
    @frost_bolt_direct_damage = frost_bolt_direct_damage
    @fireball_radius = fireball_radius
    @fireball_speed = fireball_speed
    @fireball_explosion_max_damage_range = fireball_explosion_max_damage_range
    @fireball_explosion_min_damage_range = fireball_explosion_min_damage_range
    @fireball_explosion_max_damage = fireball_explosion_max_damage
    @fireball_explosion_min_damage = fireball_explosion_min_damage
    @guardian_tower_radius = guardian_tower_radius
    @guardian_tower_vision_range = guardian_tower_vision_range
    @guardian_tower_life = guardian_tower_life
    @guardian_tower_attack_range = guardian_tower_attack_range
    @guardian_tower_damage = guardian_tower_damage
    @guardian_tower_cooldown_ticks = guardian_tower_cooldown_ticks
    @faction_base_radius = faction_base_radius
    @faction_base_vision_range = faction_base_vision_range
    @faction_base_life = faction_base_life
    @faction_base_attack_range = faction_base_attack_range
    @faction_base_damage = faction_base_damage
    @faction_base_cooldown_ticks = faction_base_cooldown_ticks
    @burning_duration_ticks = burning_duration_ticks
    @burning_summary_damage = burning_summary_damage
    @empowered_duration_ticks = empowered_duration_ticks
    @empowered_damage_factor = empowered_damage_factor
    @frozen_duration_ticks = frozen_duration_ticks
    @hastened_duration_ticks = hastened_duration_ticks
    @hastened_bonus_duration_factor = hastened_bonus_duration_factor
    @hastened_movement_bonus_factor = hastened_movement_bonus_factor
    @hastened_rotation_bonus_factor = hastened_rotation_bonus_factor
    @shielded_duration_ticks = shielded_duration_ticks
    @shielded_bonus_duration_factor = shielded_bonus_duration_factor
    @shielded_direct_damage_absorption_factor = shielded_direct_damage_absorption_factor
    @aura_skill_range = aura_skill_range
    @range_bonus_per_skill_level = range_bonus_per_skill_level
    @magical_damage_bonus_per_skill_level = magical_damage_bonus_per_skill_level
    @staff_damage_bonus_per_skill_level = staff_damage_bonus_per_skill_level
    @movement_bonus_factor_per_skill_level = movement_bonus_factor_per_skill_level
    @magical_damage_absorption_per_skill_level = magical_damage_absorption_per_skill_level
  end
end