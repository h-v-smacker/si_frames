-- This mod provides a selection of window frames from different materials
-- They are used by "snapping" a frame to a glass pane, and the frame is positioned 
-- propely due to model having an offset

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
		node = "wfs", 
		model = "si_frame_simple.obj",
		howto = {
				{"default:stick", "default:stick", "default:stick"},
				{"default:stick", "%MATERIAL%", "default:stick"},
				{"default:stick", "default:stick", "default:stick"}
			}
      },
	{
		name = "Quartered window frame", 
		node = "wfq", 
		model = "si_frame_quartered.obj",
		howto = {
				{"", "default:stick", ""},
				{"default:stick", "%MATERIAL%", "default:stick"},
				{"", "default:stick", ""}
			}
      },
	{
		name = "Quartered (diagonal) window frame", 
		node = "wfqd", 
		model = "si_frame_quartered_diagonal.obj",
		howto = {
				{"default:stick", "", "default:stick"},
				{"", "%MATERIAL%", ""},
				{"default:stick", "", "default:stick"}
			}
      },
}

minetest.register_node("si_frames:test", {
	description = "Universal frame test",
	tiles = { 	"inset_glass.png^((maple_wood.png^tmask.png)^[makealpha:0,0,0)"
			},
	paramtype = "light",
	drawtype = "nodebox",
})

minetest.register_node("si_frames:universal", {
	description = "Universal frame",
	tiles = {	"maple_wood.png",
			"maple_wood.png",
			"maple_wood.png^[transformR90",
			"maple_wood.png^[transformR90",
			"inset_glass.png^(((maple_wood.png^tmask.png)^[makealpha:0,0,0)^((maple_wood.png^[transformR90^tmask2.png)^[makealpha:0,0,0))",
			"inset_glass.png^(((maple_wood.png^tmask.png)^[makealpha:0,0,0)^((maple_wood.png^[transformR90^tmask2.png)^[makealpha:0,0,0))",
			},
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
-- 	on_place = minetest.rotate_node,
	is_ground_content = false,
	sunlight_propagates = true,
	legacy_facedir_simple = true,
	connects_to = {"group:stone", "group:wood", "group:window_frames"},
	node_box = {
		type = "connected",
		fixed = {-0.5, -0.5, -0.05, 0.5, 0.5, 0.05},
		connect_top = {-0.5, 0.433, -0.125, 0.5, 0.5, 0.125},
 		connect_bottom = {-0.5, -0.5, -0.125, 0.5, -0.433, 0.125},
		connect_left = { -0.5, -0.5, -0.125, -0.433, 0.5, 0.125 },
		connect_right = { 0.433, -0.5, -0.125, 0.5, 0.5, 0.125 },
-- 		connect_front = box OR {box1, box2, ...},
-- 		connect_back = box OR {box1, box2, ...},
	},
	selection_box = { type = "fixed",
				fixed = {{-0.5, -0.5, -0.1, 0.5, 0.5, 0.1}}
				},
	collisionbox = {{-0.5, -0.5, -0.1, 0.5, 0.5, 0.1}},
})

for material, modname in pairs(materials) do
	
	if minetest.get_modpath(modname) then
		
		local nodedef = minetest.registered_nodes[modname .. ":" .. material]
		
		if nodedef then
		
			local texture = nodedef.tiles[1]
		
			if texture then
				
				for _,f in ipairs(frametypes) do
					
					local nodename = "si_frames:" .. f.node .. "_" .. material
					
					minetest.register_node (nodename, {
						description = f.name .. " (" .. material .. ")",
						drawtype = "mesh",
						mesh = f.model,
						tiles = {texture},
						inventory_image = "(" .. texture .. "^" .. f.node .. ".png^of.png)^[makealpha:0,0,0",
						wield_image = texture .. "^" .. f.node .. ".png",
						paramtype = "light",
						paramtype2 = "facedir",
						is_ground_content = false,
						sunlight_propagates = true,
						groups = {choppy=1, snappy=1, oddly_breakable_by_hand=1, window_frames=1 },
						sounds = default.node_sound_stone_defaults(),
						walkable = false,
						selection_box = { type = "fixed",
									fixed = {{-0.4, -0.45, 0.4, 0.4, 0.4, 0.5}}
									},
						collisionbox = {{-0.4, -0.45, 0.4, 0.4, 0.4, 0.5}},
					})
					
					if f.howto[2][2] == "%MATERIAL%" then
						f.howto[2][2] = modname .. ":" .. material
						minetest.register_craft({
							output = nodename,
							recipe = f.howto
						})
						f.howto[2][2] = "%MATERIAL%"
					else
						minetest.log("error", "Wrong recipe template for " .. nodename)
						minetest.log("error", "--> " .. f.howto[2][2])
					end

				end
			end
		end
	end
end
