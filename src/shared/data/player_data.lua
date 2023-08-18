local player_data = {}
player_data.__index = player_data

local replicated_storage = game:GetService("ReplicatedStorage")
local logging = require(replicated_storage.bloom_shared.utils.logging)

local player_database = {}

local database_template = {
    id = nil,
    username = nil,
    display_name = nil,

    active = nil,
    last_activity = nil,

    threshold = nil,
}

function player_data.new(player_instance: Player)
    local new_player = table.clone(database_template)
    setmetatable(new_player, player_data)

    new_player.id = player_instance.UserId()
    new_player.username = player_instance.Name
    new_player.display_name = player_instance.DisplayName

    new_player.active = true
    new_player.last_activity = tick()

    new_player.threshold = 0

    logging.info(script.Name, "New player data created!")
    logging.okay(script.Name, "\\___[ User ID\n\t\\_" .. new_player.id .. " ]")
    return new_player
end

function player_data:add_data_to_database(player_data)
    player_data.last_activity = tick()
    player_database[player_data.id] = player_data
end