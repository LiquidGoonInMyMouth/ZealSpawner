if not _G.ZealList or not _G.ZealIndex then return end

local player = managers.player:local_player()
if not alive(player) then return end

-- 1. Precision Raycast (Ignoring units and triggers)
local from = player:camera():position()
local to = from + player:camera():forward() * 10000
-- Mask 1 is 'Statics' (Floors/Walls). Mask 11 is 'World Geometry'.
local ray = World:raycast("ray", from, to, "slot_mask", managers.slot:get_mask("statics", "world_geometry"))

local spawn_pos
if ray and ray.hit_pos then
    -- Spawn on the surface we hit, slightly elevated so physics can 'settle' them
    spawn_pos = ray.hit_pos + Vector3(0, 0, 5)
else
    -- Fallback if looking at sky: 3 meters in front, but at YOUR floor level
    spawn_pos = player:position() + player:camera():forward():with_z(0) * 300
end

-- 2. Orientation (Facing your same direction)
local spawn_rot = Rotation(player:camera():forward():with_z(0), math.UP)

local spawn_path = _G.ZealList[_G.ZealIndex].path

if DB:has(Idstring("unit"), Idstring(spawn_path)) then
    local unit = World:spawn_unit(Idstring(spawn_path), spawn_pos, spawn_rot)
    
    if unit then
        -- Essential for LOUD mode stability
        local team_data = managers.groupai:state():team_data("law1")
        if unit:movement() then unit:movement():set_team(team_data) end
        if unit:brain() then unit:brain():set_team(team_data) end
        
        -- Allow damage for the ragdolls
        if unit:character_damage() then
            unit:character_damage():set_invulnerable(false)
        end
        -- managers.hud:show_hint({ text = "test test very cool test 123 you placed something"})

        managers.hud:show_hint({ text = "MEAT DEPLOYED TO " .. (ray and "SURFACE" or "DISTANCE") })
    end
else
    managers.hud:show_hint({ text = "PATH ERROR - UNIT NOT LOADED" })
end