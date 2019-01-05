local stormwalls = {"blue", "red", "green", "purple"}

for _, color in ipairs(stormwalls) do
  data.raw.wall[color .. "-stormwall"].resistances = {
    {
      type = "physical",
      decrease = 3,
      percent = 20
    },
    {
      type = "impact",
      decrease = 5,
      percent = 10
    },
    {
      type = "explosion",
      decrease = 10,
      percent = 40
    },
    {
      type = "fire",
      percent = 100
    },
    {
      type = "laser",
      percent = 10
    }
  }
end
