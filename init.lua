local S = minetest.get_translator("skillbook")
local modpath = minetest.get_modpath("skillbook")
dofile(modpath.."/skillbook.lua")
dofile(modpath.."/recipes.lua")


-- Example of skill books. Change as you see fit.

skillbook.register_skill_book({     "doors:door_wood",
                                    "stairs:stair_wood 8",
                                    "default:ladder_wood 5"},
                                  S("Woodworking"))

skillbook.register_skill_book(    { "stairs:stair_cobble 8",
                                    "stairs:slab_cobble 6"},
                                  S("Stoneworking"))

skillbook.register_skill_book(    {"default:axe_stone",
                                   "default:pick_stone",
                                   "default:shovel_stone",
                                   "default:torch 4"},
                                 S("Stone Tools"))
                                 
if minetest.global_exists("mesecons") then
  skillbook.register_skill_book(    {"mesecons:wire_00000000_off 4",
                                     "mesecons_lightstone:lightstone_yellow_off 1",
                                     "mesecons_pressureplates:pressure_plate_wood_off 1",
                                     "mesecons_walllever:wall_lever_off 1",
                                     "mesecons_torch:mesecon_torch_on 1",
                                     "mesecons_gates:not_off 1",
                                     "mesecons_gates:and_off 1",
                                     "mesecons_pistons:piston_sticky_off 1"
                                   },
                                  S("Logic Circuits"))
end