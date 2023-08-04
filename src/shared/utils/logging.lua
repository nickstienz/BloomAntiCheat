local settings = require(game.ReplicatedStorage:WaitForChild("BloomShared").data.settings)
local maxLogSize = settings.maxLogSize
local outputLogs = settings.outputLogs

local logging = {}

local logs = {}
local logErrors = {}
local head = 1

local function log(message: string)
    logs[head] = message
    head = (head % maxLogSize) + 1

    if outputLogs then print("(Bloom)~" .. message) end
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
    table.insert(logErrors, message)
end

function logging.getLogs()
    return logs
end

return logging