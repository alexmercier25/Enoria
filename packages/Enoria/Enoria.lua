local Enoria = {}
Enoria.__index = Enoria

Enoria.Context = {}
Enoria.Context.Widgets = {}
Enoria.Context.Player = game.Players.LocalPlayer
Enoria.Context.DefaultTheme = require(script.Parent.DefaultTheme)

Enoria.Container = function(options)
	return require(script.Parent.Widgets.Container).new(options, Enoria.Context)
end

Enoria.TextButton = function(text, options)
	return require(script.Parent.Widgets.TextButton).new(text, options, Enoria.Context)
end

Enoria.TextLabel = function(text, options)
	return require(script.Parent.Widgets.TextLabel).new(text, options, Enoria.Context)
end

Enoria.Column = function(options)
	return require(script.Parent.Widgets.Column).new(options, Enoria.Context)
end

Enoria.Form = function(formKey, options)
	return require(script.Parent.Widgets.Form).new(formKey, options, Enoria.Context)
end

Enoria.TextFormField = function(formKey, options)
	return require(script.Parent.Widgets.TextFormField).new(formKey, options, Enoria.Context)
end

Enoria.GridBuilder = function(itemCount, builder, options)
	return require(script.Parent.Widgets.GridBuilder).new(itemCount, builder, options, Enoria.Context)
end

Enoria.ImageButton = function(image, options)
	return require(script.Parent.Widgets.ImageButton).new(image, options, Enoria.Context)
end

Enoria.ImageLabel = function(image, options)
	return require(script.Parent.Widgets.ImageLabel).new(image, options, Enoria.Context)
end

Enoria.ListBuilder = function(itemCount, builder, options)
	return require(script.Parent.Widgets.ListBuilder).new(itemCount, builder, options, Enoria.Context)
end

Enoria.Row = function(options)
	return require(script.Parent.Widgets.Row).new(options, Enoria.Context)
end

Enoria.ScrollContainer = function(options)
	return require(script.Parent.Widgets.ScrollContainer).new(options, Enoria.Context)
end

Enoria.TextBox = function(options)
	return require(script.Parent.Widgets.TextBox).new(options, Enoria.Context)
end

Enoria.Stack = function(options)
	return require(script.Parent.Widgets.Stack).new(options, Enoria.Context)
end

Enoria.PageLayout = function(options)
	return require(script.Parent.Widgets.PageLayout).new(options, Enoria.Context)
end

Enoria.VerticalSpacer = function(size, options)
	return require(script.Parent.Widgets.VerticalSpacer).new(size, options, Enoria.Context)
end

Enoria.HorizontalSpacer = function(size, options)
	return require(script.Parent.Widgets.HorizontalSpacer).new(size, options, Enoria.Context)
end

Enoria.Viewport = function(options)
	return require(script.Parent.Widgets.Viewport).new(options, Enoria.Context)
end

function Enoria.new()
	local self = {}
	setmetatable(self, Enoria)
	
	return self
end



--[[ ENORIA ID SYSTEM ]]--

local id_letters = {
    "a", "b", "c", "d", "e",
    "f", "g", "h", "i", "j",
    "k", "l", "m", "n", "o",
    "p", "q", "r", "s", "t",
    "u", "v", "w", "x", "y", "z"
}
local id_numbers = {
    "0", "1", "2", "3", "4",
    "5", "6", "7", "8", "9"
}
local id_chars = {
    "-", "]", "[", "|", "_", "@"
}
local id_chances = {
    "letters", "letters",
    "numbers", "numbers",
    "chars",
}

local id_next_char

function id_getChar()
    local index = math.random(1, #chances)

    if id_chances[index] == "letters" then
        local random = math.random(1, #id_letters)
        return id_letters[random]
    end

    if id_chances[index] == "numbers" then
        local random = math.random(1, #id_numbers)
        return id_numbers[random]
    end
    
    if id_chances[index] == "chars" then
        local random = math.random(1, #id_chars)
        return chars[random]
    end

end

function id_randomString(nChars)
    local result = ""
    for i = 0, (nChars-1), 1 do
        id_next_char = tostring(id_getChar())
        result = result .. id_next_char
    end
    return result
end

--[[ ]] --



function Enoria:RunApp(options)
	local context = Enoria.Context
	local player = game.Players.LocalPlayer
	local output = options.Output or player.PlayerGui
	local name = options.Name or "EnoriaApp"
	
	if context.Theme == nil then
		context.Theme = {}
	end
	
	if output:FindFirstChild(name) then
		output:FindFirstChild(name):Destroy()
	end
	
	local screenGui = Instance.new(options.GUIType or "ScreenGui", output)
	screenGui.ResetOnSpawn = false
	screenGui.Name = name
	screenGui:SetAttribute("EnoriaId", randomString(12))
	context.GUI = screenGui
	
	if options.Face then
		screenGui.Face = options.Face
	end
	
	if options.Home then
		options.Home.Parent = screenGui
		context.RunApp = Enoria.RunApp
	else
		error("App does not have any home widget!")
	end
end

Enoria.Context.GetElementByName = function(name)
	local descendants = Enoria.Context.GUI:GetDescendants()
	
	for index, descendant in pairs(descendants) do
		if descendant.Name == name then
			return descendant
		end
	end
	
	return nil
end

Enoria.Context.GetElementByEnoriaId = function(id)
	local descendants = Enoria.Context.GUI:GetDescendants()

	for index, descendant in pairs(descendants) do
		if descendant:GetAttribute("EnoriaId") == id then
			return descendant
		end
	end

	return nil
end

Enoria.Utils = {}
Enoria.Utils.CreateProject = function(projectName)
	if projectName == nil or projectName == "" then
		error("Project name cannot be empty.")
		return
	end
	print("[Enoria] Creating a new project called "..projectName.."...")
	local newProject = script.Parent.Parent.Parent.example.MyProject:Clone()
	newProject.Parent = game.StarterPlayer.StarterPlayerScripts
	newProject.Name = projectName
	newProject.lib.Main.Name = projectName.."Main"
	print("[Enoria] Project "..projectName.." was created in "..newProject.Parent.Name)
end

return Enoria
