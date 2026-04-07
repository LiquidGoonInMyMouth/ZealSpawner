-- visuals.lua
if not _G.ZealStudioVisuals then
    _G.ZealStudioVisuals = {
        brush = Draw:brush(Color.yellow:with_alpha(0.5))
    }
    _G.ZealStudioVisuals.brush:set_depth_test(false)
end

Hooks:PostHook(GameSetup, "update", "JP_DrawZealTarget", function(self, t, dt)
    local player = managers.player:local_player()
    if not alive(player) or not player:camera() then return end

    -- Raycast to find the ground
    local from = player:camera():position()
    local to = from + player:camera():forward() * 20000
    local ray = World:raycast("ray", from, to, "slot_mask", managers.slot:get_mask("statics", "world_geometry"))

    if ray and ray.hit_pos then
        -- Draw a small yellow sphere where the meat will land
        _G.ZealStudioVisuals.brush:sphere(ray.hit_pos + Vector3(0, 0, 5), 5)
    end
end)

-- broken and idk why, wtf is this games fucking spagheti code, fuck you!!!!