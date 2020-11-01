data.raw["electric-turret"]["laser-turret"].energy_source = {
  type = "electric",
  buffer_capacity = "48800kJ",
  input_flow_limit = "4808kW",
  drain = "8kW",
  usage_priority = "primary-input"
}

data.raw["ammo-turret"]["vtk-cannon-turret"].attack_parameters.range = 60
data.raw["ammo-turret"]["vtk-cannon-turret"].attack_parameters.prepare_range = 68
data.raw["ammo-turret"]["vtk-cannon-turret-heavy"].attack_parameters.range = 50
data.raw["ammo-turret"]["vtk-cannon-turret-heavy"].attack_parameters.prepare_range = 56
data.raw["ammo"]["cannon-shell-magazine"].ammo_type.action.action_delivery.max_range = 70
data.raw["ammo"]["explosive-cannon-shell-magazine"].ammo_type.action.action_delivery.max_range = 70
data.raw["ammo"]["uranium-cannon-shell-magazine"].ammo_type.action.action_delivery.max_range = 70
data.raw["ammo"]["explosive-uranium-cannon-shell-magazine"].ammo_type.action.action_delivery.max_range = 70
