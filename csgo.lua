-- Batman1259

local pui = require("neverlose/pui")
local clipboard = require("neverlose/clipboard")
local smoothy = require("neverlose/smoothy")
local gradient = require("neverlose/gradient")

info = {}

info.username = common.get_username()
info.version = "OS" -- Open Source

infotab = pui.create("\v"..ui.get_icon("user"), "Info")
aatab = pui.create("\v"..ui.get_icon("shield"), "Antiaim")
buildtab = pui.create("\v"..ui.get_icon("shield"), "Builder")

infotab:label("Username ~ \v"..info.username)
infotab:label("Version ~ \v"..info.version)

player_states = {"Global", "Stand", "SlowWalk", "Move", "Crouch", "CrouchMove", "Air", "Air Crouch"}
states = buildtab:combo("States", player_states)

menu = {
    antiaim = {
        defensive = aatab:switch("Defensive AA")
    },
    builder = {

    },
    
    misc = {

    },

    visuals = {
        
    }
}

ui.sidebar("2024", "diagram-project")

for i, v in pairs(player_states) do 
    menu.builder[i] = {}

    builderkey = menu.builder[i]

builderkey.edit = buildtab:switch("Edit ~ \v"..v)

builderkey.test = buildtab:switch("Test")


builderkey.edit:depend({states, v}, {states, "Global", true})
builderkey.test:depend({states, v}, {builderkey.edit, true})

end

for i in pairs(menu.builder) do 
print(i)
end

