local data_util = require("data_util")

se_core_fragment_resources["raw-rare-metals"] = { multiplier = 1.25, omni_multiplier = 0.25}
data_util.replace_or_add_ingredient("se-cryonite-to-methane-ice", "se-cryonite-slush", "se-cryonite-slush", 1, true)
