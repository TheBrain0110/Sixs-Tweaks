data.raw["mining-drill"]["crust_extractor"].energy_usage = "6.50MW" -- Not significantly changing the energy usage from default, just cutting off the 0.001MW that was bugging me with rounding errors...
data.raw["mining-drill"]["crust_extractor"].energy_source.emissions = 0.05
data.raw["mining-drill"]["crust_extractor"].allowed_effects = {"productivity", "consumption", "pollution", "speed"}

data.raw["mining-drill"]["moho_extractor"].energy_usage = "12.50MW"
data.raw["mining-drill"]["moho_extractor"].energy_source.emissions = 0.05
data.raw["mining-drill"]["moho_extractor"].allowed_effects = {"productivity", "consumption", "pollution", "speed"}

data.raw["mining-drill"]["mantle_extractor"].energy_usage = "25.00MW"
data.raw["mining-drill"]["mantle_extractor"].energy_source.emissions = 0.05
data.raw["mining-drill"]["mantle_extractor"].allowed_effects = {"productivity", "consumption", "pollution", "speed"}