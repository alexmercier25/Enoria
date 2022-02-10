# Enoria
Read the Documentation to see how to get started: https://thebuildex.gitbook.io/enoria/

## Features

- State management (global and per-widget)
- OOP Approach
- Quickly bind events to UI components
- Declarative syntax

```lua
local Enoria = require(game.ReplicatedStorage.Enoria.Enoria) -- importing Enoria core model

local e = Enoria.new() -- creating the Enoria core object

e:RunApp({
	Name = "MyApp",
	Home = e.TextLabel("Hello world")
})
```
