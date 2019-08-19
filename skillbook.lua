local S = minetest.get_translator("skillbook")
skillbook = {}

local num_books=1
local function book_on_use(itemstack, user)
  -- local player = minetest.get_player_by_name("Yves")
  -- player:set_attribute("crafting:unlocked", "{}")

  local name = user:get_player_name()
  local unlocked = crafting.get_unlocked(name)
  local book = itemstack:get_definition()

--[[
  if(unlocked[book.recipe_name]) then
    -- crafting.lock(name, book.recipe_name)
    return itemstack
  end ]]--
  crafting.unlock(name, book.recipe_name)
  sfinv.set_player_inventory_formspec(user)
  itemstack:take_item(1)
  return itemstack
end


local function lock(name, output)
	local player = minetest.get_player_by_name(name)
	if not player then
		minetest.log("warning", "Crafting doesn't support setting unlocks for offline players")
		return {}
	end

	local unlocked = crafting.get_unlocked(name)

	if type(output) ~= "table" then
		unlocked[output] = false
		minetest.chat_send_player(name, "You've locked " .. output)
	end

	-- player:set_attribute("crafting:unlocked", minetest.write_json(unlocked))
	player:set_attribute("crafting:unlocked", minetest.write_json(unlocked))
  -- forces update of crafting's unlocked cache
  crafting.unlock(name, {})
	if minetest.global_exists("sfinv") then
		sfinv.set_player_inventory_formspec(player)
	end

end

minetest.register_chatcommand("resetskills", {
	description = "Resets the unlocked recipes of a player",
	params = "<player>",
	privs = {ban=true},
	func = function(name, param)
    local unlocked = crafting.get_unlocked(name)
    for key, value in pairs(unlocked) do
      lock(name, key)
    end
  end })

function skillbook.register_skill_book(recipe_name, description)
  description = description or ItemStack(recipe_name):get_definition().description
  minetest.register_craftitem("skillbook:skill_book_"..num_books, { --..recipe_name:gsub(":", "_"), {
  	description = S("Crafting recipe: @1", description),
    --description = S("Crafting recipe:")..S(description),
  	inventory_image = "skillbook_book.png",
  	groups = {book = 1},
  	stack_max = 1,
  	on_use = book_on_use,
    recipe_name = recipe_name
  })
  num_books = num_books+1
end
