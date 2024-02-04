local function tc_teleport_character_regionName(context)
    local character = cm:get_character_by_cqi(context:faction_cqi)
    local region = string.gsub(context:trigger, "tc_teleport(character, regionName):")
	local x, y = cm:find_valid_spawn_location_for_character_from_settlement(character:faction():name(), region:name(), false, true)
	cm:teleport_to(cm:char_lookup_str(character), x, y)
	cm:zero_action_points(cm:char_lookup_str(character))
end

local function tc_treasury_mod_faction_cost(context)
    local faction = cm:model():faction_for_command_queue_index(context:faction_cqi());
    local cost = string.gsub(context:trigger, "tc_treasury_mod(faction, cost):")
    cm:treasury_mod(faction:name(), cost)
end

local function AAAtc_multiplayer_listeners()
    core:add_listener(
        "tc_teleport(character, regionName)",
        "UITrigger",
        function(context)
            return string.find(context:trigger(), "tc_teleport(character, regionName):")
        end,
        function(context)
            tc_teleport_character_regionName(context)
        end,
        true
    )
    core:add_listener(
        "tc_treasury_mod(faction, cost)",
        "UITrigger",
        function(context)
            return string.find(context:trigger(), "tc_treasury_mod(faction, cost):")
        end,
        function(context)
            tc_treasury_mod_faction_cost(context)
        end,
        true
    )
end

cm:add_first_tick_callback(function() AAAAAtc_multiplayer_listeners() end);