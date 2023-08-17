local logging = {}

local replicated_storage = game:GetService("ReplicatedStorage")
local run_service = game:GetService("RunService")

local settings = require(replicated_storage.bloom_shared.settings)
local do_logging = settings.do_logging
local print_logs = settings.output_logs
local max_log_size = settings.max_log_size

local is_studio = run_service:IsStudio()

local logs_table = {}
local log_errors_table = {}
local head = 1

local function log(file_name: string, message: string)
    if not do_logging then return end

    local formated_message = message .. " (" .. file_name .. ")"
    logs_table[head] = formated_message
    head = (head % max_log_size) + 1

    if print_logs == 0 then return end -- No prints
    if print_logs == 3 then -- All
        print("(Bloom)~" .. formated_message)
    elseif print_logs == 2 and not is_studio then -- Only Game
        print("(Bloom)~" .. formated_message)
    elseif print_logs == 1 and is_studio then -- Only Studio
        print("(Bloom)~" .. formated_message)
    end
end

function logging.okay(file_name: string, message: string)
    log(file_name, "[+] " .. message)
end

function logging.info(file_name: string, message: string)
    log(file_name, "[i] " .. message)
end

function logging.warn(file_name: string, message: string)
    log(file_name, "[-] " .. message)
end

function logging.error(file_name: string, message: string)
    log(file_name, "[!] " .. message)

    if not do_logging then return end

    local formated_message = "Error: " .. message .. " (" .. file_name .. ")"
    if #log_errors_table < 999 then
        table.insert(log_errors_table, formated_message)
    end
end

function logging.get_logs()
    return logs_table
end

function logging.get_errors()
    return log_errors_table
end

return logging