--# Module for Random ID generation #--
local SystemID = require(script.Parent.id)

local Enoria = {}
Enoria.__index = Enoria

--# Context dictionnary creation #--
Enoria.Context = {}
Enoria.Context.Widgets = {}
Enoria.Context.Player = game.Players.LocalPlayer
Enoria.Context.DefaultTheme = require(script.Parent.DefaultTheme)

--# List of widgets with required module #--
local Widgets = {
	Container = require(script.Parent.Widgets.Container),
	TextButton = require(script.Parent.Widgets.TextButton),
	TextLabel = require(script.Parent.Widgets.TextLabel),
	Column = require(script.Parent.Widgets.Column),
	Form = require(script.Parent.Widgets.Form),
	TextFormField = require(script.Parent.Widgets.TextFormField),
	GridBuilder = require(script.Parent.Widgets.GridBuilder),
	ImageButton = require(script.Parent.Widgets.ImageButton),
	ImageLabel = require(script.Parent.Widgets.ImageLabel),
	ListBuilder = require(script.Parent.Widgets.ListBuilder),
	Row = require(script.Parent.Widgets.Row),
	ScrollContainer = require(script.Parent.Widgets.ScrollContainer),
	TextBox = require(script.Parent.Widgets.TextBox),
	Stack = require(script.Parent.Widgets.Stack),
	PageLayout = require(script.Parent.Widgets.PageLayout),
	VerticalSpacer = require(script.Parent.Widgets.VerticalSpacer),
	HorizontalSpacer = require(script.Parent.Widgets.HorizontalSpacer),
	Viewport = require(script.Parent.Widgets.Viewport),
}

--# Components constructor #--

function Enoria.Container(options) return Widgets["Container"].new(options, Enoria.Context) end

function Enoria.TextButton(text, options) return Widgets["TextButton"].new(text, options, Enoria.Context) end

function Enoria.TextLabel(text, options) return Widgets["TextLabel"].new(text, options, Enoria.Context) end

function Enoria.Column(options) return Widgets["Column"].new(options, Enoria.Context) end

function Enoria.Form(formKey, options) return Widgets["Form"].new(formKey, options, Enoria.Context) end

function Enoria.TextFormField(formKey, options) return Widgets["TextFormField"].new(formKey, options, Enoria.Context) end

function Enoria.GridBuilder(itemCount, builder, options) return Widgets["GridBuilder"].new(itemCount, builder, options, Enoria.Context) end

function Enoria.ImageButton(image, options) return Widgets["ImageButton"].new(image, options, Enoria.Context) end

function Enoria.ImageLabel(image, options) return Widgets["ImageLabel"].new(image, options, Enoria.Context) end

function Enoria.ListBuilder(itemCount, builder, options) return Widgets["ListBuilder"].new(itemCount, builder, options, Enoria.Context) end

function Enoria.Row(options) return Widgets["Row"].new(options, Enoria.Context) end

function Enoria.ScrollContainer(options) return Widgets["ScrollContainer"].new(options, Enoria.Context) end

function Enoria.TextBox(options) return Widgets["TextBox"].new(options, Enoria.Context) end

function Enoria.Stack(options) return Widgets["Stack"].new(options, Enoria.Context) end

function Enoria.PageLayout(options) return Widgets["PageLayout"].new(options, Enoria.Context) end

function Enoria.VerticalSpacer(size, options) return Widgets["VerticalSpacer"].new(size, options, Enoria.Context) end

function Enoria.HorizontalSpacer(size, options) return Widgets["HorizontalSpacer"].new(size, options, Enoria.Context) end

function Enoria.Viewport(options) return Widgets["Viewport"].new(options, Enoria.Context) end

--- Enoria constructor
function Enoria.new()
	local self = {}
	setmetatable(self, Enoria)
	
	return self
end

--- Creates a ScreenGui with the provided options.
---@param options any
function Enoria:RunApp(options)
	local context = Enoria.Context
	local player = game.Players.LocalPlayer
	local output = options.Output or player.PlayerGui
	local name = options.Name or "EnoriaApp"
	
	if context.Theme == nil then
		context.Theme = {}
	end
	
	-- If there's a sussy imposter DESTROY HIM
	if output:FindFirstChild(name) then
		output:FindFirstChild(name):Destroy()
	end
	
	local screenGui = Instance.new(options.GUIType or "ScreenGui", output)
	screenGui.ResetOnSpawn = false
	screenGui.Name = name
	screenGui:SetAttribute("EnoriaId", SystemID.randomString(12))
	context.GUI = screenGui
	
	if options.Face then
		screenGui.Face = options.Face
	end
	
	-- Put the Home widget provided in the ScreenGui
	if options.Home then
		options.Home.Parent = screenGui
		context.RunApp = Enoria.RunApp
	else
		error("App does not have any home widget!")
	end
end

--- Get an element in the current ScreenGui by it's name.
--- Not the best practice, but it's here if you have no other choices.
---@param name string
function Enoria.Context.GetElementByName(name)
	local player = Enoria.Context.Player
	local playerGui = player:WaitForChild("PlayerGui") or nil
	local apps
	
	if playerGui then apps = playerGui:GetChildren() end

	for _, app in pairs(apps) do
		if app.Name == name then
			return app
		end
	end
	
	return nil
end

--- Get an element in the current ScreenGui by it's EnoriaId.
--- Not the best practice, but it's here if you have no other choices.
---@param id string
function Enoria.Context.GetAppById(id)
	local player = Enoria.Context.Player
	local playerGui = player:WaitForChild("PlayerGui") or nil
	local apps

	if playerGui then apps = playerGui:GetChildren() end

	for _, app in pairs(apps) do
		if app:GetAttribute("EnoriaId") == id then
			return app
		end
	end

	return nil
end

return Enoria