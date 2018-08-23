require("prototypes.equipment.equipment")
require("prototypes.entity.turrets")
require("prototypes.recipe.fluid-recipe")

if mods["Stormwalls"] then
    require("prototypes.entity.stormwall")
end

if mods["bobmodules"] then 
    require("prototypes.recipe.modules")
end