local modname = assert(core.get_current_modname())
dofile(core.get_modpath(modname) .. "chat_welcome.lua")
dofile(core.get_modpath(modname) .. "show_ctf_util.lua")
dofile(core.get_modpath(modname) .. "capture_counter.lua")
dofile(core.get_modpath(modname) .. "donation.lua")
dofile(core.get_modpath(modname) .. "particles.lua")
dofile(core.get_modpath(modname) .. "ignore.lua")
dofile(core.get_modpath(modname) .. "help.lua")

minetest.register_on_sending_chat_message(function(message)
    return say(message)
end)

function say(message)
    if string.sub(message, 1, 1) ~= "/" then
        message = message .. string.char(127)
    else
        return false
    end
    minetest.send_chat_message(message)
	local name = minetest.localplayer:get_name()
	minetest.display_chat_message("<"..name.."> " .. message)
    return true
end