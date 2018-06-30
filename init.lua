local materials = {
	["wood"] = "default",
	["junglewood"] = "default",
	["pine_wood"] = "default",
	["acacia_wood"] = "default",
	["aspen_wood"] = "default",
	["maple_wood"] = "maple",
	["banana_wood"] = "ethereal",
	["birch_wood"] = "ethereal",
	["frost_wood"] = "ethereal",
	["palm_wood"] = "ethereal",
	["willow_wood"] = "ethereal",
	["yellow_wood"] = "ethereal",
	["redwood_wood"] = "ethereal",
}


local frametypes = {
	{
		name = "Simple window frame", 
		node = "window_frame_simple", 
		model = "si_frame_simple.obj"
      },
	{
		name = "Quartered window frame", 
		node = "window_frame_quartered", 
		model = "si_frame_quartered.obj"
      },
	{
		name = "Quartered (diagonal) window frame", 
		node = "window_frame_quartered_diagonal", 
		model = "si_frame_quartered_diagonal.obj"
      },
}

for material, modname in pairs(materials) do
	if minetest.get_modpath(modname) then
		local nodedef = minetest.registered_nodes[modname .. ":" .. material]
		if nodedef then
		
			local texture = nodedef.tiles[1]
		
			if texture then
				for _,f in ipairs(frametypes) do
					
					minetest.register_node ("si_frames:" .. f.node .. "_" .. material, {
						description = f.name,
						drawtype = "mesh",
						mesh = f.model,
						tiles = {texture},
						paramtype = "light",
						paramtype2 = "facedir",
						is_ground_content = false,
						sunlight_propagates = true,
						groups = {choppy=1, snappy=1, oddly_breakable_by_hand=1 },
						sounds = default.node_sound_stone_defaults(),
						walkable = false,
						selection_box = { type = "fixed",
									fixed = {{-0.4, -0.45, 0.4, 0.4, 0.4, 0.5}}
									},
						collisionbox = {{-0.4, -0.45, 0.4, 0.4, 0.4, 0.5}},
					})

					
				end
			end
		end
	end
end

--[[

minetest.register_node ("si_frames:window_frame_simple", {
	description = "Simple window frame",
	drawtype = "mesh",
	mesh = "si_frame_simple.obj",
	tiles = {"maple_wood.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy=1, snappy=1, oddly_breakable_by_hand=1 },
	sounds = default.node_sound_stone_defaults(),
	walkable = false,
	selection_box = { type = "fixed",
				 fixed = {{-0.4, -0.45, 0.4, 0.4, 0.4, 0.5}}
				 },
	collisionbox = {{-0.4, -0.45, 0.4, 0.4, 0.4, 0.5}},
})

minetest.register_node ("si_frames:window_frame_quartered", {
	description = "Quartered window frame",
	drawtype = "mesh",
	mesh = "si_frame_quartered.obj",
	tiles = {"maple_wood.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy=1, snappy=1, oddly_breakable_by_hand=1 },
	sounds = default.node_sound_stone_defaults(),
	walkable = false,
	selection_box = { type = "fixed",
				 fixed = {{-0.4, -0.45, 0.4, 0.4, 0.4, 0.5}}
				 },
	collisionbox = {{-0.4, -0.45, 0.4, 0.4, 0.4, 0.5}},
})

minetest.register_node ("si_frames:window_frame_quartered_diagonal", {
	description = "Quartered (diagonal) window frame",
	drawtype = "mesh",
	mesh = "si_frame_quartered_diagonal.obj",
	tiles = {"maple_wood.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy=1, snappy=1, oddly_breakable_by_hand=1 },
	sounds = default.node_sound_stone_defaults(),
	walkable = false,
	selection_box = { type = "fixed",
				 fixed = {{-0.4, -0.45, 0.4, 0.4, 0.4, 0.5}}
				 },
	collisionbox = {{-0.4, -0.45, 0.4, 0.4, 0.4, 0.5}},
})
   
]]--
