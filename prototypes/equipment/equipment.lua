data.raw["active-defense-equipment"]["personal-laser-defense-equipment"].attack_parameters = {
  type = "projectile",
  ammo_category = "electric",
  cooldown = 20,
  damage_modifier = 10,
  projectile_center = {0, 0},
  projectile_creation_distance = 0.6,
  range = 13,
  sound = make_laser_sounds(),
  ammo_type = {
    type = "projectile",
    category = "laser-turret",
    energy_consumption = "100kJ",
    projectile = "laser",
    speed = 1,
    action = {
      {
        type = "direct",
        action_delivery = {
          {
            type = "projectile",
            projectile = "laser",
            starting_speed = 0.28
          }
        }
      }
    }
  }
}
