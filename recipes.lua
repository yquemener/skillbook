-- Some sample recipes using rubenwardy'crafting mod and mesecons if installed

-- Wood basics
crafting.register_recipe({type = "inv",output = "default:stick 4",items = {
	"group:wood 1"
},always_known = true})

crafting.register_recipe({type = "inv",output = "default:wood 4",items = {
	"default:tree 1"
},always_known = true})


-- Wood structures
crafting.register_recipe({type = "inv",output = "doors:door_wood",items = {
	"group:wood 6"
},always_known = false})
crafting.register_recipe({type = "inv",output = "stairs:stair_wood 8",items = {
	"default:wood 6"
},always_known = false})
crafting.register_recipe({type = "inv",output = "default:ladder_wood 5",items = {
	"group:stick 7"
},always_known = false})

-- Stone structures
crafting.register_recipe({type = "inv",output = "stairs:stair_cobble 8",items = {
	"default:cobble 6"
},always_known = false})
crafting.register_recipe({type = "inv",output = "stairs:slab_cobble 6",items = {
	"default:cobble 3"
},always_known = false})
-- Tools
crafting.register_recipe({type = "inv",output = "default:axe_stone",items = {
	"group:stick 2",
	"group:stone 3"
},always_known = false})
crafting.register_recipe({type = "inv",output = "default:shovel_stone",items = {
	"group:stick 2",
	"group:stone 1"
},always_known = false})
crafting.register_recipe({type = "inv",output = "default:pick_stone",items = {
	"group:stick 2",
	"group:stone 3"
},always_known = false})
crafting.register_recipe({type = "inv",output = "default:torch 4",items = {
	"default:coal_lump 1",
	"group:stick 1"
},always_known = false})

if minetest.global_exists("mesecons") then
  -- mesecons
  crafting.register_recipe({type = "inv",output = "mesecons:wire_00000000_off 4",items = {
  	"default:iron_lump 1"
  },always_known = false})

  crafting.register_recipe({type = "inv",output = "mesecons_lightstone:lightstone_yellow_off 1",items = {
  	"group:sand 1",
    "group:mesecon_conductor_craftable 1",
    "group:wood 1"
  },always_known = false})

  crafting.register_recipe({type = "inv",output = "mesecons_pressureplates:pressure_plate_wood_off 1",items = {
  	"group:wood 1",
    "group:mesecon_conductor_craftable 1"
  },always_known = false})

  crafting.register_recipe({type = "inv",output = "mesecons_walllever:wall_lever_off 1",items = {
    "stairs:slab_cobble 1",
    "group:mesecon_conductor_craftable 1",
    "group:wood 1"
  },always_known = false})

  crafting.register_recipe({type = "inv",output = "mesecons_torch:mesecon_torch_on 1",items = {
    "default:torch 1",
    "group:mesecon_conductor_craftable 1"
  },always_known = false})

  crafting.register_recipe({type = "inv",output = "mesecons_gates:not_off 1",items = {
    "mesecons_torch:mesecon_torch_on 1",
    "group:mesecon_conductor_craftable 1"
  },always_known = false})

  crafting.register_recipe({type = "inv",output = "mesecons_gates:and_off 1",items = {
    "mesecons_torch:mesecon_torch_on 1",
    "group:mesecon_conductor_craftable 2"
  },always_known = false})

  crafting.register_recipe({type = "inv",output = "mesecons_pistons:piston_sticky_off 1",items = {
    "mesecons_torch:mesecon_torch_on 1",
    "group:mesecon_conductor_craftable 2",
    "group:wood 1",
    "default:iron_lump 1"
  },always_known = false})
end