data.raw["resource"]["vtk-deepcore-mining-crack"].fluid_amount = 50
data.raw["resource"]["vtk-deepcore-mining-crack"].required_fluid = "heavy-oil"

local ores = {"iron-ore", "copper-ore", "coal", "stone", "uranium-ore"}

for _, ore in pairs(ores) do
  data.raw["resource"][ore.."-patch"].minable.results =
  {
    {
      type = "item",
      name = "vtk-deepcore-mining-"..ore.."-chunk",
      amount_min = 1,
      amount_max = 1,
      probability = 1
    }
  }
  data.raw["resource"][ore.."-patch"].minable.mining_time = data.raw["resource"][ore].minable.mining_time * 40
  if data.raw["resource"][ore.."-patch"].minable.fluid_amount
    then data.raw["resource"][ore.."-patch"].minable.fluid_amount = data.raw["resource"][ore.."-patch"].minable.fluid_amount * 10
  end
  data.raw["resource"][ore.."-patch"].infinite_depletion_amount = 1 -- Values < 1 cause no depletion
  data.raw["resource"][ore.."-patch"].minimum = 2500
  data.raw["resource"][ore.."-patch"].normal = 10000 -- Not sure if this has any effect, patch min / max on spawn is handled in mod settings
end