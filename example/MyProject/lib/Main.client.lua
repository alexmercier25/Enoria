local Enoria = require(game.ReplicatedStorage.Enoria.packages.Enoria.Enoria)
local CustomTheme = require(script.Parent.Parent.style.Theme)

local e = Enoria.new()
e.Context.Theme = CustomTheme

e:RunApp({
	Name = script.Parent.Parent.Name,
	Home = e.TextLabel("Welcome to Enoria!")
})