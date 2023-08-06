local settings = require(game.ReplicatedStorage:WaitForChild("BloomShared").data.settings)
local output_logs = settings.output_logs
local max_log_size = settings.max_log_size

local logging = {}

local logs = {}
local log_errors = {}
local head = 1

local function log(message: string)
    logs[head] = message
    head = (head % max_log_size) + 1

    if output_logs then print("(Bloom)~" .. message) end
end

function logging.okay(message: string)
    log("[+] " .. message)
end

function logging.info(message: string)
    log("[i] " .. message)
end

function logging.warn(message: string)
    log("[!] " .. message)
end

function logging.error(message: string)
    log("[-] " .. message)
    table.insert(log_errors, message)
end

function logging.get_logs()
    return logs
end

return logging