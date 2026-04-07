_G.ZealList = _G.ZealList or {
    { name = "Zeal Light", path = "units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat" },
    { name = "Zeal Heavy", path = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy" },
    { name = "Zeal Shield", path = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield" },
    { name = "Zeal Dozer", path = "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer" },
    { name = "Zeal Cloaker", path = "units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker" }
}
_G.ZealIndex = (_G.ZealIndex or 0) % #_G.ZealList + 1

local current = _G.ZealList[_G.ZealIndex].name
managers.hud:show_hint({ text = "SELECTED UNIT: " .. current })