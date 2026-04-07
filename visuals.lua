-- Hotdog's zeaql spawner - Fixed Global Logic
_G.ZealStudio = _G.ZealStudio or {
    index = 1,
    list = {
        { name = "Zeal Light", path = "units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat" },
        { name = "Zeal Heavy", path = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy" },
        { name = "Zeal Shield", path = "units/pd2_dlc_gitgud/characters/ene_zeal_shield/ene_zeal_shield" }, -- doesnt seem to spawn sheilds.. need right path
        { name = "Zeal Dozer", path = "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer" },
        { name = "Zeal Cloaker", path = "units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker" }
    }
}

-- The Scroll Function
function ScrollZeal()
    local self = _G.ZealStudio
    self.index = (self.index % #self.list) + 1
    local current_name = self.list[self.index].name
    
    -- On-screen message so you know it worked
    managers.hud:show_hint({ text = "HOTDOG SELECTED: " .. current_name })
end

-- The Spawn Function
function SpawnZeal()
    local self = _G.ZealStudio
    local player = managers.player:local_player()
    
    if not alive(player) then return end
    
    local spawn_path = self.list[self.index].path
    local spawn_pos = player:position() + player:rotation():y() * 250
    local spawn_rot = player:rotation()
    
    -- Check if the unit path is valid and spawn
    if DB:has(Idstring("unit"), Idstring(spawn_path)) then
        local unit = World:spawn_unit(Idstring(spawn_path), spawn_pos, spawn_rot)
        if unit and unit:brain() then
            unit:brain():set_active(false) -- Freeze them
            managers.hud:show_hint({ text = "SPAWNED: " .. self.list[self.index].name })
        end
    else
        managers.hud:show_hint({ text = "ERROR: UNIT NOT LOADED" })
    end
end

-- broken and old. fuck you for being broken