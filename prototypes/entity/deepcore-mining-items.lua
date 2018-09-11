data.raw["recipe"]["vtk-deepcore-mining-ore-chunk-refining"].results =
{
    {
        name = "vtk-deepcore-mining-iron-ore-chunk",
        probability = 0.6,
        amount_min = 2,
        amount_max = 6
    },
    {
        name = "vtk-deepcore-mining-copper-ore-chunk",
        probability = 0.667,
        amount_min = 2,
        amount_max = 6
    },
    {
        name = "vtk-deepcore-mining-coal-chunk",
        probability = 0.4,
        amount_min = 1,
        amount_max = 5
    },
    {
        name = "vtk-deepcore-mining-stone-chunk",
        probability = 0.5,
        amount_min = 1,
        amount_max = 5
    },
    {
        name = "vtk-deepcore-mining-uranium-ore-chunk",
        probability = 0.25,
        amount_min = 1,
        amount_max = 2
    },
}

local function chunk_refining_recipe_updater(ore_name, refining_result, result_amount, refining_liquid, refining_liquid_amount)

    data.raw["recipe"]["vtk-deepcore-mining-"..ore_name.."-chunk-refining"].energy_required = 10
    data.raw["recipe"]["vtk-deepcore-mining-"..ore_name.."-chunk-refining"].ingredients = 
        {
            {"vtk-deepcore-mining-"..ore_name.."-chunk", 1},
            {type="fluid", name=refining_liquid, amount=refining_liquid_amount},
        }
    data.raw["recipe"]["vtk-deepcore-mining-"..ore_name.."-chunk-refining"].results = 
        {
            {type="item", name=refining_result, amount=result_amount/4}, 
            {type="item", name=refining_result, amount=result_amount/4}, 
            {type="item", name=refining_result, amount=result_amount/4}, 
            {type="item", name=refining_result, amount=result_amount/4}, 
        }
end

local sulfuricacidname = "sulfuric-acid"

chunk_refining_recipe_updater(
    "iron-ore",             -- ore_name : used for recipe name "-chunk-refining", ingredient "-chunk", refining icon "-chunk-refining.png")
    "iron-ore",             -- result
    64,                    -- result amount
    sulfuricacidname,        -- refining liquid
    100                      -- refining liquid amount
)
chunk_refining_recipe_updater(
    "copper-ore", 
    "copper-ore", 
    60, 
    sulfuricacidname, 
    100 
)
chunk_refining_recipe_updater(
    "coal", 
    "coal", 
    40, 
    sulfuricacidname, 
    100 
)
chunk_refining_recipe_updater(
    "stone", 
    "stone", 
    40, 
    sulfuricacidname, 
    100 
)
chunk_refining_recipe_updater(
    "uranium-ore", 
    "uranium-ore",
    16,  
    sulfuricacidname, 
    1000
)

data.raw["mining-drill"]["vtk-deepcore-mining-drill"].energy_usage = "2.5MW"
data.raw["mining-drill"]["vtk-deepcore-mining-drill"].energy_source.emissions = 0.05
data.raw["mining-drill"]["vtk-deepcore-mining-drill"].input_fluid_box.base_area = 20

data.raw["mining-drill"]["vtk-deepcore-mining-drill-advanced"].energy_usage = "25MW"
data.raw["mining-drill"]["vtk-deepcore-mining-drill-advanced"].energy_source.emissions = 0.025