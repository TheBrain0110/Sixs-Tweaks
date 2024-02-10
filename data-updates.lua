if mods["Krastorio2"] then
  require("prototypes.recipe.landfill")
  require("prototypes.entity.kr-miners")
  require("prototypes.entity.kr-turrets")
end

if mods["Stormwalls"] then
  require("prototypes.entity.stormwall")
end

if mods["vtk-deep-core-mining"] then
  require("prototypes.entity.deepcore-mining-items")
  require("prototypes.entity.deepcore-mining-resources")
end

if mods["Texugo_TA-miners"] then
  require("prototypes.entity.ta-miners")
end

if mods["vtk-cannon-turret"] then
  require("prototypes.entity.vtk-cannon-turret")
end

if mods["Logistic-Gun-Turret"] then
  data.raw.recipe["turret-interface"].ingredients[2] = { "logistic-chest-storage", 1 }
end

if mods["aai-industry"] then
  data.raw["wall"]["steel-wall"].attack_reaction[1].reaction_modifier = 0.667
end

if mods["nullius"] then
  require("prototypes.entity.nullius")
end
