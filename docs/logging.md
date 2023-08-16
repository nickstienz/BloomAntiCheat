# Logging

[Return](./index.md)

The Logging module allows Bloom to internally store and manage logs.
You can access the module to make new logs or get them. This allows for
you to understand what Bloom is doing and for better debugging.

The logging module uses a circular buffer in order to store the most
recent logs up to a max amount.

***Location:*** ReplicatedStorage/bloom_shared/utils/logging.lua

## Functions

### okay

The `okay` function adds a "[+]" to the beginning of the message.

> `function logging.okay(file_name: string, message: string) -> void`

***file_name:*** This value can be passed in using the *Script* `Name` or
`GetFullName` functions. You could also use any string so do what you want.

***message:*** This is the string placed into the logs table for storage.

```lua
--- main.lua
local replicated_storage = game:GetService("ReplicatedStorage")
local logging = require(replicated_storage.bloom_shared.utils.logging)

logging.okay(script.Name(), "Test okay log from the main file!")
```

### info

The `info` function adds a "[i]" to the beginning of the message.

> `function logging.info(file_name: string, message: string) -> void`

***file_name:*** This value can be passed in using the *Script* `Name` or
`GetFullName` functions. You could also use any string so do what you want.

***message:*** This is the string placed into the logs table for storage.

```lua
--- main.lua
local replicated_storage = game:GetService("ReplicatedStorage")
local logging = require(replicated_storage.bloom_shared.utils.logging)

logging.info(script.Name(), "Test info log from the main file!")
```

### warn

The `warn` function adds a "[-]" to the beginning of the message.

> `function logging.warn(file_name: string, message: string) -> void`

***file_name:*** This value can be passed in using the *Script* `Name` or
`GetFullName` functions. You could also use any string so do what you want.

***message:*** This is the string placed into the logs table for storage.

```lua
--- main.lua
local replicated_storage = game:GetService("ReplicatedStorage")
local logging = require(replicated_storage.bloom_shared.utils.logging)

logging.warn(script.Name(), "Test warn log from the main file!")
```

### error

The `error` function adds a "[!]" to the beginning of the message.
It also stores the error in a seperate table for errors.

> `function logging.error(file_name: string, message: string) -> void`

***file_name:*** This value can be passed in using the *Script* `Name` or
`GetFullName` functions. You could also use any string so do what you want.

***message:*** This is the string placed into the logs and errors table for storage.

```lua
--- main.lua
local replicated_storage = game:GetService("ReplicatedStorage")
local logging = require(replicated_storage.bloom_shared.utils.logging)

logging.error(script.Name(), "Test error log from the main file!")
```

### get_logs

The `get_logs` function returns a table with all the
current logs in it.

> `function logging.get_logs() -> {string}`

```lua
---main.lua
local replicated_storage = game:GetService("ReplicatedStorage")
local logging = require(replicated_storage.bloom_shared.utils.logging)

let current_logs = logging.get_logs()
print(current_logs)
```

### get_errors

The `get_errors` function returns a table with all the
errors in it.

> `function logging.get_errors() -> {string}`

```lua
---main.lua
local replicated_storage = game:GetService("ReplicatedStorage")
local logging = require(replicated_storage.bloom_shared.utils.logging)

let current_errors = logging.get_errors()
print(current_errors)
```

## Settings

### do_logging

- ***Type:*** boolean
- ***Default:*** true

Enables or Disables all of the logging functions.
I don't know why you would disable this...

### print_logs

- ***Type:*** number
- ***Range:*** 1-3
- ***Default:*** 3

0 = No printing at all

1 = Only print in Studios

2 = Only print on the client

3 = Print everywhere

### max_log_size

- ***Type:*** number
- ***Range:*** 1-inf (i64 limit)
- ***Default:*** 100

Sets how many of the most recent logs to store.
After max number is reached, the oldest are
overwritten.
