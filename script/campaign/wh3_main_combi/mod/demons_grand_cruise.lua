
local bDebug = false
local strDebugFirstSelectedRegion = nil
local bForceSelectedCharacterUpdate = false
local nSelectedCharacterCQI = false

demons_grand_cruise = {} 
function demons_grand_cruise.init()
	
	local aSelf = {}
	setmetatable(aSelf, {
		__index = demons_grand_cruise,
		__tostring = function() return "DEMONS_GRAND_CRUISE" end
	})
	_G.demons_grand_cruise = aSelf
	
end

function demons_grand_cruise.msg(strText)
	
	strText = tostring(strText)
	
	local cFile = io.open("demons_grand_cruise_log.txt","a")
	cFile:write(strText.."\n")
	cFile:flush()
	cFile:close()
	
end

function demons_grand_cruise.createUIComponent(cParent, strName, strType)
	
	local cComponent = find_uicomponent(cParent, strName)
	if cComponent == false then
		cComponent = UIComponent(cParent:CreateComponent(strName, strType))
	end
	cComponent:SetVisible(true)
	
	return cComponent
	
end

function demons_grand_cruise.tableSize(aTable)
	local i = 0
	for k,v in pairs(aTable) do
		i = i + 1
	end
	return i
end

function demons_grand_cruise.priceMultiplier(arrivalRegion, departRegion)

    local multiplier = 1.0
    local arrivalX = arrivalRegion:name()
    local departureX = departRegion:name()
    local majorOneArrive = cm:get_region(aSeaPorts[arrivalX].strParent)
    local majorTwoArrive = cm:get_region(aSeaPorts[arrivalX].strParent2)
    local majorOneDep = cm:get_region(aSeaPorts[departureX].strParent)
    local majorTwoDep = cm:get_region(aSeaPorts[departureX].strParent2)
    
    --travelling in same region
    if aSeaPorts[arrivalX].strParent == aSeaPorts[departureX].strParent then
        multiplier = multiplier * 0.5
    end
    
    --we own arrival major port
    if majorOneArrive:settlement():primary_slot():building():building_level() >= 3 and majorOneArrive:owning_faction():name() == cm:get_local_faction(true):name() or majorTwoArrive:settlement():primary_slot():building():building_level() >= 3 and majorTwoArrive:owning_faction():name() == cm:get_local_faction(true):name() then
        multiplier = multiplier * 0.5
    end
    
    --we own departure major port
    if majorOneDep:settlement():primary_slot():building():building_level() >= 3 and majorOneDep:owning_faction():name() == cm:get_local_faction(true):name() or majorTwoDep:settlement():primary_slot():building():building_level() >= 3 and majorTwoDep:owning_faction():name() == cm:get_local_faction(true):name() then
        multiplier = multiplier * 0.75
    end
    
    return multiplier
end

function demons_grand_cruise.getCostToUseRailNetwork(cRegion, cCharacter)
	
    local baseCost = 500
	local departRegion = cm:get_region("wh3_main_combi_region_the_daemons_stump")
	
	--is the region null + are we at sea
	if cCharacter:region():is_null_interface() and cCharacter:is_at_sea() then
        --are we in a valid sea region
        if cCharacter:sea_region():is_null_interface() then
            --TODO map ocean regions to this!
            departRegion = cm:get_region("wh3_main_combi_region_the_daemons_stump")
        else
            departRegion = cm:get_region("wh3_main_combi_region_the_daemons_stump")
        end
    else
        departRegion = cCharacter:region()
	end
	
	
	local nDifficulty = cm:get_difficulty()
	if nDifficulty == 2 then
		baseCost = 750
	elseif nDifficulty == 3 then
		baseCost = 1000
	elseif nDifficulty == 4 then
		baseCost = 2000
	elseif nDifficulty == 5 then
		baseCost = 4000
	end
	
	--army size mult, lords count as 1, heroes count as 2 if alone.
	local nCost = 4
	if cCharacter:has_military_force() then
		nCost = nCost + cCharacter:military_force():unit_list():num_items()
	end
	
	--multiply turn number
	nCost = nCost * math.min(cm:turn_number(), 200)
	
	--multiply value
	nCost = nCost * 7.5
	
	--add hidden port price increase
	if demons_grand_cruise.nodeIsHiddenPort(cRegion) or demons_grand_cruise.nodeIsHiddenPort(cCharacter:region()) then
        nCost = nCost * 2
    end
	if demons_grand_cruise.nodeIsHiddenPort(cRegion) then
        nCost = nCost + 2000
	end
	if demons_grand_cruise.nodeIsHiddenPort(cCharacter:region()) then
        nCost = nCost + 2000
	end
	
	--multiply port and local discount
	nCost = nCost * demons_grand_cruise.priceMultiplier(cRegion, departRegion)
	
	return baseCost + math.floor(nCost)
end

--is level 3 or higher and owned by player/ally/vassal
function demons_grand_cruise.nodeIsRebuiltAndOwned(cRegion)
    
    local foreignslotman = cRegion:foreign_slot_manager_for_faction(cm:get_local_faction(true):name())
    
    if cRegion:settlement():primary_slot():building():building_level() >= 3 and cRegion:owning_faction():name() == cm:get_local_faction(true):name() or cRegion:settlement():primary_slot():building():building_level() >= 3 and cRegion:owning_faction():is_ally_vassal_or_client_state_of(cm:get_local_faction(true)) or cRegion:settlement():primary_slot():building():building_level() >= 3 and foreignslotman:is_null_interface() == false then
        return true
    end
	
	return false
end

--is it specifically a hidden port/undercity/outpost?
function demons_grand_cruise.nodeIsHiddenPort(cRegion)
    
    local foreignslotman = cRegion:foreign_slot_manager_for_faction(cm:get_local_faction(true):name())
    
    if cRegion:settlement():primary_slot():building():building_level() >= 3 and cRegion:owning_faction():name() == cm:get_local_faction(true):name() or cRegion:settlement():primary_slot():building():building_level() >= 3 and cRegion:owning_faction():is_ally_vassal_or_client_state_of(cm:get_local_faction(true)) then
        return false
    else
        if cRegion:settlement():primary_slot():building():building_level() >= 3 and foreignslotman:is_null_interface() == false then
            return true
        else
            return false
        end
    end
	
end

function demons_grand_cruise.canMove(cRegion, cCharacter)
	
	local aReasons = true
	
	--not a real region, just in case
	--actually think this is only for great ocean so nah
	--if cCharacter:region():is_null_interface() ~= false and cCharacter:sea_region():is_null_interface() ~= false then
	--	aReasons = {}
	--	aReasons["not_connected"] = true
	--	return aReasons
	--end 
	
	--not rebuilt or owned by ally
	if demons_grand_cruise.nodeIsRebuiltAndOwned(cRegion) == false then
		aReasons = {}
		aReasons["not_connected"] = true
		return aReasons
	end

    --is the character's region built?
        --if cCharacter:sea_region():is_null_interface() or demons_grand_cruise.nodeIsRebuiltAndOwned(cCharacter:region()) == false then
    if cCharacter:region():is_null_interface() or demons_grand_cruise.nodeIsRebuiltAndOwned(cCharacter:region()) == false then
        if aReasons == true then
            aReasons = {}
        end
        aReasons["not_atport"] = true
        return aReasons
    end
        
    --character has no movement points
    if cCharacter:action_points_remaining_percent() ~= 100 then
        if aReasons == true then
            aReasons = {}
        end
        aReasons["no_movement"] = true
    end
    
    --cannot afford material cost
    if demons_grand_cruise.getCostToUseRailNetwork(cRegion, cCharacter) > cm:get_local_faction(true):treasury() then
        if aReasons == true then
            aReasons = {}
        end
        aReasons["no_materials"] = true
    end
	
	
	return aReasons
	
end

--teleports character if valid
function demons_grand_cruise.teleportCharacterToRegionByNetwork(cRegion)
	
	local cCharacter = cm:get_character_by_cqi(nSelectedCharacterCQI)
	if demons_grand_cruise.canMove(cRegion, cCharacter) ~= true then
		return
	end
	
    cm:treasury_mod(cm:get_local_faction(true):name(), -demons_grand_cruise.getCostToUseRailNetwork(cRegion, cCharacter))
	
	local x, y = cm:find_valid_spawn_location_for_character_from_settlement(cCharacter:faction():name(), cRegion:name(), false, true)
	--cm:teleport_military_force_to(cCharacter:military_force(), x, y)
	
	cm:teleport_to(cm:char_lookup_str(cCharacter), x, y)
	cm:zero_action_points(cm:char_lookup_str(cCharacter))
	cm:trigger_2d_ui_sound("UI_CAM_HUD_DLC21_Sea_Lanes_Panel_Travel", 0) --UI_CAM_PRO_HUD_Occupy_First_Settlement
	--cm:scroll_camera_with_cutscene_to_character(1, nil, nSelectedCharacterCQI)
	
	local _,_,d,b,h = cm:get_camera_position()
	cm:set_camera_position(cCharacter:display_position_x(), cCharacter:display_position_y(), d, b, h)
	
	demons_grand_cruise.hideMap()
	
end

--show/hide the world map of the underway/rail network
function demons_grand_cruise.showMap()
	
	local cCharacter = cm:get_character_by_cqi(nSelectedCharacterCQI)
	local cPanelManager = find_uicomponent(core:get_ui_root(), "panel_manager")
	
	local cWorldMap = demons_grand_cruise.createUIComponent(cPanelManager, "demons_grand_cruise_worldmap", "ui/campaign ui/demons_grand_cruise_panel_main.twui.xml")
	cWorldMap:SetDockOffset(0, 53)
	

    find_uicomponent(cWorldMap, "worldmap"):SetImagePath("campaign_maps/wh3_main_combi_map_2/wh3_main_combi_map_seaports.png", 0)
    find_uicomponent(cWorldMap, "worldmap_scroll"):SetImagePath("ui/skins/default/1x1_transparent_white.png", 0)
    find_uicomponent(cWorldMap, "header_holder"):SetImagePath("ui/skins/wh3_dlc23_chd_chaos_dwarfs/panel_title_large.png", 0)
    find_uicomponent(cWorldMap, "header_holder", "tx_header"):SetStateText(common.get_localised_string("cruise_button"), "")
	
	cm:steal_escape_key(true)
	
	--create each region icon for each stop on the underway / rail network
	local aNetworkToUse = nil
	
	--set to dwarf pngs
	aNetworkToUse = aSeaPorts
	
	for strRegionName,aData in pairs(aNetworkToUse) do
		
		local cRegionIcon = demons_grand_cruise.createUIComponent(cWorldMap, "regionicon_"..strRegionName, "ui/campaign ui/demons_grand_cruise_region_icon.twui.xml")
		cRegionIcon:SetDockingPoint(1)
		cRegionIcon:SetDockOffset(aData.x-15, aData.y-15)
		
		local cRegionIconImage = find_uicomponent(cRegionIcon, "demons_grand_cruise_region_icon_image")
		local cRegionIconBackglow = find_uicomponent(cRegionIcon, "demons_grand_cruise_region_icon_backglow")
		local cRegionIconCover = find_uicomponent(cRegionIcon, "demons_grand_cruise_region_icon_circle")
		local cRegionIconHidden = find_uicomponent(cRegionIcon, "demons_grand_cruise_region_icon_hidden")
        cRegionIconCover:SetImagePath("ui/skins/default/1x1_transparent_white.png", 0)
        cRegionIconHidden:SetImagePath("ui/skins/default/1x1_transparent_white.png", 0)
		
		local strTooltip = ""
		
		--underway / rail is potentially valid location
		if demons_grand_cruise.nodeIsRebuiltAndOwned(aData.cRegion) then
			
			strTooltip = "[[col:dip_attitude_6]]"..common.get_localised_string("regions_onscreen_"..aData.strName).."[[/col]]"
			
			--dorfs
            local aCanMoveReason = demons_grand_cruise.canMove(aData.cRegion, cCharacter)
            
            --player is at this node
            if cCharacter:region():is_null_interface() == false and cCharacter:region():name() == aData.cRegion:name() and not cCharacter:is_at_sea() then
                cRegionIconImage:SetImagePath("ui/campaign ui/icons/portstation_full_here.png", 0)
                strTooltip = strTooltip.."\n  "..common.get_localised_string("you_are_here")
                    if demons_grand_cruise.nodeIsHiddenPort(cCharacter:region()) then
                        strTooltip = strTooltip.."\n  "..common.get_localised_string("this_hidden_port")
                    end
                
            --player can teleport to this node
            elseif aCanMoveReason == true then
                cRegionIconImage:SetImagePath("ui/campaign ui/icons/portstation.png", 0)
                    if demons_grand_cruise.nodeIsHiddenPort(aData.cRegion) then
                        strTooltip = strTooltip.."\n[[col:dip_attitude_3]]"..common.get_localised_string("hidden_port").."[[/col]]"
                    end
                    if demons_grand_cruise.nodeIsHiddenPort(cCharacter:region()) then
                        strTooltip = strTooltip.."\n[[col:dip_attitude_3]]"..common.get_localised_string("at_hidden_port").."[[/col]]"
                    end
                strTooltip = strTooltip.."\n  "..common.get_localised_string("can_move_here_cost")
                strTooltip = strTooltip:gsub("_amount_", demons_grand_cruise.getCostToUseRailNetwork(aData.cRegion, cCharacter))
                
            --cannot reach this node
            else
                
                if aCanMoveReason["not_connected"] then
                    strTooltip = strTooltip.."\n[[col:dip_attitude_3]]"..common.get_localised_string("cannot_move_connected").."[[/col]]"
                    cRegionIconImage:SetImagePath("ui/campaign ui/icons/portstation_broken.png", 0)
                end
                
                if aCanMoveReason["no_movement"] then
                    strTooltip = strTooltip.."\n[[col:dip_attitude_3]]"..common.get_localised_string("cannot_move_actionpoints").."[[/col]]"
                    cRegionIconImage:SetImagePath("ui/campaign ui/icons/portstation.png", 0)
                    cRegionIconCover:SetImagePath("ui/campaign ui/icons/notatport.png", 0)
                end
                
                if aCanMoveReason["not_atport"]then
                    strTooltip = strTooltip.."\n[[col:dip_attitude_3]]"..common.get_localised_string("cannot_move_atport").."[[/col]]"
                    cRegionIconImage:SetImagePath("ui/campaign ui/icons/portstation.png", 0)
                    cRegionIconCover:SetImagePath("ui/campaign ui/icons/notatport.png", 0)
                end
                
                --cost wasnt hooked up, said cannot_move_connected? sus
                if aCanMoveReason["no_materials"] then
                    strTooltip = strTooltip.."\n[[col:dip_attitude_3]]"..common.get_localised_string("cannot_move_cost").."[[/col]]"
                    strTooltip = strTooltip:gsub("_amount_", demons_grand_cruise.getCostToUseRailNetwork(aData.cRegion, cCharacter))
                    cRegionIconImage:SetImagePath("ui/campaign ui/icons/portstation.png", 0)
                    cRegionIconCover:SetImagePath("ui/campaign ui/icons/notatport.png", 0)
                end
            end
				
            
			
		--port is not rebuilt and/or owned, give reasons
		else
			
            cRegionIconImage:SetImagePath("ui/campaign ui/icons/portstation_broken.png", 0)
			
			strTooltip = "[[col:dip_attitude_3]]"..common.get_localised_string("regions_onscreen_"..aData.strName).."[[/col]]"
			
			--not high enough level
			if aData.cRegion:settlement():primary_slot():building():building_level() < 3 then
				strTooltip = strTooltip.."\n[[col:dip_attitude_1]]  "..common.get_localised_string("unavailable_reason_notlvl3").."[[/col]]"
			end
			
			
			--not owned by player faction/allies
                --and not cRegion:owning_faction():is_ally_vassal_or_client_state_of(cm:get_local_faction(true))
            if aData.cRegion:owning_faction():name() ~= cm:get_local_faction(true):name() and demons_grand_cruise.nodeIsHiddenPort(aData.cRegion) == false and aData.cRegion:owning_faction():is_ally_vassal_or_client_state_of(cm:get_local_faction(true)) == false then
                strTooltip = strTooltip.."\n[[col:dip_attitude_1]]  "..common.get_localised_string("unavailable_reason_notus").."[[/col]]"
                --if cRegion:owning_faction():is_ally_vassal_or_client_state_of(cm:get_local_faction(true)) then
                --else
                    --strTooltip = strTooltip.."\n[[col:dip_attitude_1]]  "..common.get_localised_string("unavailable_reason_notus").."[[/col]]"
                --end
            end
            
		end
		
        cRegionIconImage:Resize(30, 30)
        cRegionIconBackglow:Resize(30, 30)
        cRegionIconCover:Resize(30, 30)
        cRegionIconHidden:Resize(30, 30)
        cRegionIconBackglow:SetImagePath("ui/skins/default/1x1_transparent_white.png", 0)
            
        --resize prov campitals, change to port capitals
        --if aData.cRegion:is_province_capital() then
        if aData.strName == aData.strParent or aData.strName == aData.strParent2 then
            cRegionIconImage:Resize(40, 40)
            cRegionIconBackglow:Resize(40, 40)
            cRegionIconCover:Resize(40, 40)
            cRegionIconHidden:Resize(40, 40)
            if aData.strName == "wh3_main_combi_region_citadel_of_dusk" then
                cRegionIconBackglow:SetImagePath("ui/campaign ui/icons/lustria.png", 0)
            end
            if aData.strName == "wh3_main_combi_region_the_galleons_graveyard" or aData.strName == "wh3_main_combi_region_lothern" then
                cRegionIconBackglow:SetImagePath("ui/campaign ui/icons/centralgreatocean.png", 0)
            end
            if aData.strName == "wh3_main_combi_region_sartosa" then
                cRegionIconBackglow:SetImagePath("ui/campaign ui/icons/piratecoast.png", 0)
            end
            if aData.strName == "wh3_main_combi_region_fortress_of_dawn" or aData.strName == "wh3_main_combi_region_sudenburg" then
                cRegionIconBackglow:SetImagePath("ui/campaign ui/icons/southgreatocean.png", 0)
            end
            if aData.strName == "wh3_main_combi_region_tower_of_the_sun" then
                cRegionIconBackglow:SetImagePath("ui/campaign ui/icons/seaofdread.png", 0)
            end
            if aData.strName == "wh3_main_combi_region_haichai" then
                cRegionIconBackglow:SetImagePath("ui/campaign ui/icons/jadesea.png", 0)
            end
            if aData.strName == "wh3_main_combi_region_karond_kar" then
                cRegionIconBackglow:SetImagePath("ui/campaign ui/icons/northgreatocean.png", 0)
            end
            if aData.strName == "wh3_main_combi_region_marienburg" or aData.strName == "wh3_main_combi_region_erengrad" then
                cRegionIconBackglow:SetImagePath("ui/campaign ui/icons/southseaofchaos.png", 0)
            end
            if aData.strName == "wh3_main_combi_region_monolith_of_flesh" then
                cRegionIconBackglow:SetImagePath("ui/campaign ui/icons/northseaofchaos.png", 0)
            end
            strTooltip = strTooltip.."\n[[col:dip_attitude_3]]"..common.get_localised_string("major_port").."[[/col]]"
        end
        --sethiddenimg
        if demons_grand_cruise.nodeIsHiddenPort(aData.cRegion) then
            cRegionIconHidden:SetImagePath("ui/campaign ui/icons/hidden_port.png", 0)
        else
            cRegionIconHidden:SetImagePath("ui/skins/default/1x1_transparent_white.png", 0)
        end
		
		cRegionIcon:SetTooltipText(strTooltip, true)
		
	end
	
end

function demons_grand_cruise.hideMap()
	
	--debug to print out region icon locations
	if bDebug then
		
		local cLog = io.open("demons_grand_cruise_log.txt","w+")
		cLog:write("")
		
		local aNetworkToUse = nil
		local strTypeName = ""
        strTypeName = "aSeaPorts"
        aNetworkToUse = aSeaPorts
		
		local cPanelManager = find_uicomponent(core:get_ui_root(), "panel_manager")
		local cWorldMap = find_uicomponent(cPanelManager, "demons_grand_cruise_worldmap")
		
		demons_grand_cruise.msg(strTypeName.." = {}\n\n")
		
		for strRegionName,aData in pairs(aNetworkToUse) do
			
			local cRegion = cm:get_region(strRegionName)
			local cRegionIcon = find_uicomponent(cWorldMap, "regionicon_"..strRegionName)
			local x, y, _, _ = common.get_context_value("CcoComponent", cRegionIcon:Id(), "RelativePosition")
			
			local strData = strTypeName.."[\""..strRegionName.."\"] =\n{\n\tstrName = \""..aData.strName.."\",\n\tx = "..x..",\n\ty = "..y.."\n}\n\n"
			demons_grand_cruise.msg(strData)
			
            aSeaPorts[strRegionName].x = x
            aSeaPorts[strRegionName].y = y
		end
	end
	--end of debug
	
	
	local cPanelManager = find_uicomponent(core:get_ui_root(), "panel_manager")
	
	local cWorldMap = demons_grand_cruise.createUIComponent(cPanelManager, "demons_grand_cruise_worldmap", "ui/campaign ui/demons_grand_cruise_panel_main.twui.xml")
	cWorldMap:SetVisible(false)
	
	cm:steal_escape_key(false)
	
end

--creates the button on the character info panel that shows the world map
local aDisallowedStances = {}
aDisallowedStances["MILITARY_FORCE_ACTIVE_STANCE_TYPE_FIXED_CAMP"] = true
aDisallowedStances["MILITARY_FORCE_ACTIVE_STANCE_TYPE_LAND_RAID"] = true
aDisallowedStances["MILITARY_FORCE_ACTIVE_STANCE_TYPE_MUSTER"] = true
aDisallowedStances["MILITARY_FORCE_SITUATIONAL_STANCE_GARRISON"] = true
aDisallowedStances["MILITARY_FORCE_SITUATIONAL_STANCE_LAY_SIEGE"] = true

function demons_grand_cruise.showCharacterUI()
	
	local cCharacterInfoPanel = find_uicomponent(core:get_ui_root(), "hud_campaign", "info_panel_holder", "primary_info_panel_holder", "info_panel_background", "CharacterInfoPopup", "character_info_parent")
	local cUnderwayButton = demons_grand_cruise.createUIComponent(cCharacterInfoPanel, "demons_grand_cruise_button", "ui/templates/square_medium_button.twui.xml")
	
	local cCharacter = cm:get_character_by_cqi(nSelectedCharacterCQI)
	if cCharacter == false or cCharacter:faction():name() ~= cm:get_local_faction(true):name() then
		cUnderwayButton:SetVisible(false)
		return
	end
	
	cUnderwayButton:SetDockOffset(-100, -120)
	if underways_and_rails then
        cUnderwayButton:SetDockOffset(-50, -120)
	end
	if cm:get_local_faction(true):culture() == "wh_main_chs_chaos" then
        cUnderwayButton:SetDockOffset(-8, -80)
	end
	
	--naval networks text
	local strTooltip = common.get_localised_string("cruise_button")
	
	--only allowed in certain stances
	if cCharacter:has_military_force() and aDisallowedStances[cCharacter:military_force():active_stance()] then
		cUnderwayButton:SetDisabled(true)
		cUnderwayButton:SetState("inactive")
		strTooltip = strTooltip.."||"..common.get_localised_string("cannot_use_in_this_stance")
	else
		cUnderwayButton:SetDisabled(false)
		cUnderwayButton:SetState("active")
	end
	cUnderwayButton:SetTooltipText(strTooltip, true)
	
end

demons_grand_cruise.init()




--start game
cm:add_first_tick_callback(function()
	
	for strRegionName,aData in pairs(aSeaPorts) do
		local cRegion = cm:get_region(strRegionName)
		aSeaPorts[strRegionName].cRegion = cRegion
	end
	
	
    real_timer.register_repeating("demons_grand_cruise_characterselect_realtime", 10)
    
    core:add_listener(
        "DEMONS_GRAND_CRUISE_CHARACTERSELECT_REALTIME",
        "RealTimeTrigger",
        function(context)
            return context.string == "demons_grand_cruise_characterselect_realtime"
        end,
        function(context)
            
            if bForceSelectedCharacterUpdate then
                bForceSelectedCharacterUpdate = false
                demons_grand_cruise.showCharacterUI()
            end
            
        end,
        true
    )
    
    core:add_listener(
        "DEMONS_GRAND_CRUISE_CHARACTER_SELECTED",
        "CharacterSelected",
        function(context)
            return true
        end,
        function(context)
            nSelectedCharacterCQI = context:character():command_queue_index()
            bForceSelectedCharacterUpdate = true
        end,
        true
    )
    
    core:add_listener(
        "DEMONS_GRAND_CRUISE_CHARACTER_CHANGE",
        "ComponentLClickUp",
        function(context)
            return find_uicomponent(core:get_ui_root(), "units_panel", "main_units_panel") ~= false
        end,
        function(context)
            cm:callback(function()
                bForceSelectedCharacterUpdate = true
            end, 0.1)
        end,
        true
    )
    
    core:add_listener(
        "DEMONS_GRAND_CRUISE_BUTTON_CLICKED",
        "ComponentLClickUp",
        function(context)
            return context.string == "demons_grand_cruise_button" or context.string == "button_demons_grand_cruise_worldmap_close" or string.find(context.string, "regionicon_") ~= nil
        end,
        function(context)
            
            if context.string == "demons_grand_cruise_button" then
                demons_grand_cruise.showMap()
            elseif context.string == "button_demons_grand_cruise_worldmap_close" then
                demons_grand_cruise.hideMap()
            else
                local strRegionName = string.sub(context.string, 12, -1)
                
                --debug to create and print out connections between regions
                if bDebug then
                    if strDebugFirstSelectedRegion == nil then
                        strDebugFirstSelectedRegion = strRegionName
                    else
                        local strTypeName = ""
                        local aNetworkToUse = nil
                        
                        strDebugFirstSelectedRegion = nil
                        --cm:trigger_2d_ui_sound("UI_CAM_HUD_DLC21_Sea_Lanes_Panel_Travel", 0) -- UI_CAM_PRO_HUD_Occupy_First_Settlement
                        
                        local cLog = io.open("demons_grand_cruise_log.txt","w+")
                        cLog:write("")
                        demons_grand_cruise.msg(strTypeName.." = {}\n\n")
                        
                        for strRegionName,aData in pairs(aNetworkToUse) do
                            
                            local strData = strTypeName.."[\""..strRegionName.."\"] = {}\n"
                            for strConnectedRegionName,_ in pairs(aData) do
                                strData = strData..strTypeName.."[\""..strRegionName.."\"][\""..strConnectedRegionName.."\"] = true\n"
                            end
                            demons_grand_cruise.msg(strData)
                        end
                    end
                    
                --end of debug
                else
                    demons_grand_cruise.teleportCharacterToRegionByNetwork(cm:get_region(strRegionName))
                end
            end
            
        end,
        true
    )
    
    if bDebug then
        core:add_listener(
            "DEMONS_GRAND_CRUISE_DEBUG_SETTLEMENT_SELECTED",
            "SettlementSelected",
            true,
            function(context)
                
                local strRegionName = context:garrison_residence():settlement_interface():region():name()
                
                if aSeaPorts[strRegionName] == nil then
                    aSeaPorts[strRegionName] =
                    {
                        strName = strRegionName,
                        x = 100,
                        y = 100,
                        cRegion = context:garrison_residence():settlement_interface():region()
                    }
                end
                
            end,
            true
        )
    end
	
end)

function OnKeyPressed(key, is_key_up)
	if is_key_up == true then
		demons_grand_cruise.hideMap()
	end;
end;
