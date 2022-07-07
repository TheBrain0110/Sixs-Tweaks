-- Borrowed from Space Exploration's libraries
local data_util = {}

function data_util.remove_ingredient_sub(recipe, name)
  for i = #recipe.ingredients, 1, -1 do
    if recipe.ingredients[i] then
      for _, value in pairs(recipe.ingredients[i]) do
        if value == name then
          table.remove(recipe.ingredients, i)
        end
      end
    end
  end
end

function data_util.add_ingredient_sub(recipe, name, amount, is_fluid)
  local found = false
  for i = #recipe.ingredients, 1, -1 do
    if recipe.ingredients[i] then
      for _, value in pairs(recipe.ingredients[i]) do
        if value == name then
          found = true
          recipe.ingredients[i] = {type = is_fluid and "fluid" or "item", name = name, amount = amount}
          break
        end
      end
    end
  end
  if not found then
    table.insert(recipe.ingredients, {type = is_fluid and "fluid" or "item", name = name, amount = amount})
  end
end

function data_util.replace_or_add_ingredient_sub(recipe, old, new, amount, is_fluid)
  -- old can be nil to just add
  if old then
    data_util.remove_ingredient_sub(recipe, old)
  end
  data_util.add_ingredient_sub(recipe, new, amount, is_fluid)
end

function data_util.remove_ingredient(recipe, name)
  if type(recipe) == "string" then
    recipe = data.raw.recipe[recipe]
  end
  if not recipe then
    return
  end
  if recipe.ingredients then
    data_util.remove_ingredient_sub(recipe, name)
  end
  if recipe.normal and recipe.normal.ingredients then
    data_util.remove_ingredient_sub(recipe.normal, name)
  end
  if recipe.expensive and recipe.expensive.ingredients then
    data_util.remove_ingredient_sub(recipe.expensive, name)
  end
end

function data_util.replace_or_add_ingredient(recipe, old, new, amount, is_fluid)
  if type(recipe) == "string" then
    recipe = data.raw.recipe[recipe]
  end
  if not recipe then
    return
  end
  if recipe.ingredients then
    data_util.replace_or_add_ingredient_sub(recipe, old, new, amount, is_fluid)
  end
  if recipe.normal and recipe.normal.ingredients then
    data_util.replace_or_add_ingredient_sub(recipe.normal, old, new, amount, is_fluid)
  end
  if recipe.expensive and recipe.expensive.ingredients then
    data_util.replace_or_add_ingredient_sub(recipe.expensive, old, new, amount, is_fluid)
  end
end

function data_util.tech_add_prerequisites(prototype_name, prerequisites)
  local prototype = data.raw.technology[prototype_name]
  if not prototype then return end
  for _, new_prerequisite in pairs(prerequisites) do
    local found = false
    if prototype.prerequisites then
      for _, old_prerequisite in pairs(prototype.prerequisites) do
        if old_prerequisite == new_prerequisite then
          found = true break
        end
      end
    end
    if not found then
      prototype.prerequisites = prototype.prerequisites or {}
      table.insert(prototype.prerequisites, new_prerequisite)
    end
  end
end

return data_util
