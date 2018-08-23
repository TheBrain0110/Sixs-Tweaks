data.raw["resource"]["vtk-deepcore-mining-crack"].fluid_amount = 50,
data.raw["resource"]["vtk-deepcore-mining-crack"].required_fluid = "heavy-oil"

local ores = {"iron-ore", "copper-ore", "coal", "stone", "uranium-ore"}

for _, ore in pairs(ores) do
  data.raw["resource"][ore.."-patch"].results.name = "vtk-deepcore-mining-"..ore.."-chunk"
  data.raw["resource"][ore.."-patch"].minable.mining_time = data.raw["resource"][ore.."-patch"].minable.mining_time * 60
  if data.raw["resource"][ore.."-patch"].minable.fluid_amount > 0
    then data.raw["resource"][ore.."-patch"].minable.fluid_amount = data.raw["resource"][ore.."-patch"].minable.fluid_amount * 10
  end
  data.raw["resource"][ore.."-patch"].infinite_depletion_amount = 1
  data.raw["resource"][ore.."-patch"].minimum = 2500
end