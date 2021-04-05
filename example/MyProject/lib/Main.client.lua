local Enoria = require(game.ReplicatedStorage.Common.Enoria.packages.Enoria.Enoria)
local CustomTheme = require(script.Parent.Parent.style.Theme)
local Classes = require(script.Parent.Parent.style.Classes)

local e = Enoria.new()
e.Context.Theme = CustomTheme
e.Context.Classes = Classes

e:RunApp({
	Name = script.Parent.Parent.Name,
	Home = e.TextLabel("Welcome to Enoria!")
})