# Enoria
Read the Documentation to see how to get started: https://thebuildex.gitbook.io/enoria/

## Features

- State management (global and per-widget)
- OOP Approach
- Quickly bind events to UI components
- Declarative syntax

```lua
local e = require(game.ReplicatedStorage.Enoria.Enoria).new() -- importing and initializing Enoria core model

e:RunApp({
	Name = "MyApp",
	Home = e.TextLabel("Hello world")
})
```
