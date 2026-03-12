local Widget = {}
Widget.__index = Widget

--# Module for Random ID generation #--
local SystemID = require(script.Parent.Parent.Modules.id)

--- Creates a new custom widget.
---@param options any
---@param theme any
---@param context any
function Widget.new(options, theme, context, name)
	local self = {}
	setmetatable(self, Widget)
	
	self.Options = options or {}
	
	self.StateInitiated = false
	self.Context = context
	self.WidgetId = SystemID.randomString(12)
	
	-- Set the theme of the widget
	if context.Theme == nil then
		self.Theme = {}
	else
		self.Theme = context.Theme[theme]
	end
	
	self.WidgetName = name

	self.DefaultTheme = context.DefaultTheme[theme]
	
	return self
end

--- Builds the widget tree.
---@param tree any
function Widget:BuildTree(tree)
	for i, v in next, self.Context.Uses do
		v:BeforeWidgetBuild(self)
	end

	-- We create a wrapper frame for the widget's tree
	local folder = Instance.new("Frame")
	folder:SetAttribute("EnoriaName", self.WidgetName)
	folder.Name = "_"
	self.Folder = folder
	tree.Parent = folder.Parent
	self.CurrentTree = tree

	for i, v in next, self.Context.Uses do
		v:AfterWidgetBuild(self)
	end
	
	return tree
end

--- Changes the state of the widget. It updates the state variables by running the function provided, then rebuilds the widget tree.
---@param fnc function
function Widget:SetState(fnc)
	for i, v in next, self.Context.Uses do
		v:BeforeSetState(self)
	end

	self.StateInitiated = true
	fnc()
	-- if self.CurrentTree.Parent == nil then
	-- 	error('You may have tried to render a widget outside of the widget tree. Widgets always have to render at build time when calling SetState.')
	-- end
	repeat wait() until self.CurrentTree.Parent
	local parent = self.CurrentTree.Parent
	self.Folder:Destroy()
	self.CurrentTree:Destroy()
	local element = self:Build(self.Context)
	element.Parent = parent
end

--- Rebuilds the widget by setting it's state with an empty function
function Widget:Rebuild()
	self:SetState(function()
		-- do nothing
	end)
end

--- Required for calling injections
---@param widget any
function Widget:Parent(widget)
	self.ParentWidgetId = widget
	return self
end

--- Get injection made in the context object
---@param name string
function Widget:GetInjection(name)
	return self.Context.GetInjection(self.ParentWidgetId or self.WidgetId, name)
end

--- Injects a value in the context object
---@param name string
---@param value any
function Widget:Inject(name, value)
	self.Context.Inject(self.WidgetId, name, value)
end

--- Change the given property of the given element by priority: options, theme or the default theme.
---@param element any
---@param propertyName string
---@param options any
---@param theme any
---@param defaultTheme any
function Widget:SetPropertyFromOptionsOrTheme(element, propertyName, options, theme, defaultTheme)
	theme = theme or self.Theme
	if theme == nil then theme = {} end
	defaultTheme = defaultTheme or self.DefaultTheme
	
	if options[propertyName] ~= nil then
		element[propertyName] = options[propertyName]
	elseif theme[propertyName] ~= nil then
		element[propertyName] = theme[propertyName]
	else
		element[propertyName] = defaultTheme[propertyName]
	end
end

--- Do something with options object or the theme (fallback). It's for more complex props like UIGradient.
---@param options any
---@param theme any
---@param key string
---@param doFunction function
function Widget:DoWithOptionsOrTheme(options, theme, key, doFunction)
	if options[key] ~= nil then
		doFunction(options)
	else
		if theme ~= nil then
			if theme[key] ~=nil then
				doFunction(theme)
			end
		end
	end
end

--- Sets all the base GuiObject properties of an element.
---@param element any
function Widget:SetBaseGuiProperties(element)
	local Theme = self.Theme
	
	local options = self.Options

	if options.Class then
		Theme = self.Context.Classes[options.Class]
	end

	if self.WidgetName == nil then
		element:SetAttribute("EnoriaName", self.WidgetName)
	end
	
	local BASE_GUI_PROPERTIES = {
		"Active", "Visible", "AnchorPoint", "AutomaticSize",
		"BackgroundColor3", "BackgroundTransparency", "BorderColor3", "BorderMode", "BorderSizePixel",
		"LayoutOrder", "NextSelectionDown", "NextSelectionLeft", "NextSelectionRight", "NextSelectionUp",
		"Selectable", "Size", "SizeConstraint", "ClipsDescendants", "Position", "Rotation",
		"SelectionImageObject", "ZIndex", "AutoLocalize", "RootLocalizationTable", "Archivable", "Name",
	}
	for _, prop in ipairs(BASE_GUI_PROPERTIES) do
		self:SetPropertyFromOptionsOrTheme(element, prop, options, Theme, self.DefaultTheme)
	end

	self:DoWithOptionsOrTheme(options, Theme, "UIGradient", function(obj)
		local gradient = Instance.new("UIGradient")
		gradient.Parent = element

		local white = Color3.new(1, 1, 1)
		local lightBlue = Color3.new(0, 2/3, 1)
		local yellow = Color3.new(1, 1, 0)
		gradient.Color = obj.UIGradient.Color or ColorSequence.new{
			ColorSequenceKeypoint.new(0, white),
			ColorSequenceKeypoint.new(0.25, lightBlue),
			ColorSequenceKeypoint.new(0.5, white),
			ColorSequenceKeypoint.new(0.75, yellow),
			ColorSequenceKeypoint.new(1, white)
		}
		gradient.Enabled = obj.UIGradient.Enabled or true
		gradient.Offset = obj.UIGradient.Offset or Vector2.new(0, 0)
		gradient.Rotation = obj.UIGradient.Rotation or 0
		gradient.Transparency = obj.UIGradient.Transparency or NumberSequence.new{
			NumberSequenceKeypoint.new(0, 0), -- (time, value)
			NumberSequenceKeypoint.new(.5, .75),
			NumberSequenceKeypoint.new(1, 1)
		}
	end)

	self:DoWithOptionsOrTheme(options, Theme, "UITextSizeConstraint", function(obj)
		local tc = Instance.new("UITextSizeConstraint")
		tc.Parent = element

		tc.MaxTextSize = obj.UITextSizeConstraint.MaxTextSize or 100
		tc.MinTextSize = obj.UITextSizeConstraint.MinTextSize or 1
	end)

	self:DoWithOptionsOrTheme(options, Theme, "UIPadding", function(obj)
		local padding = Instance.new("UIPadding")
		padding.Parent = element

		padding.PaddingBottom = obj.UIPadding.Bottom or UDim.new(0, 0)
		padding.PaddingLeft = obj.UIPadding.Left or UDim.new(0, 0)
		padding.PaddingRight = obj.UIPadding.Right or UDim.new(0, 0)
		padding.PaddingTop = obj.UIPadding.Top or UDim.new(0, 0)

		if obj.UIPadding.All then
			padding.PaddingBottom = obj.UIPadding.All
			padding.PaddingLeft = obj.UIPadding.All
			padding.PaddingRight = obj.UIPadding.All
			padding.PaddingTop = obj.UIPadding.All
		end

		if obj.UIPadding.Vertical then
			padding.PaddingBottom = obj.UIPadding.Vertical
			padding.PaddingTop = obj.UIPadding.Vertical
		end

		if obj.UIPadding.Horizontal then
			padding.PaddingLeft = obj.UIPadding.Horizontal
			padding.PaddingRight = obj.UIPadding.Horizontal
		end
	end)

	self:DoWithOptionsOrTheme(options, Theme, "UIAspectRatioConstraint", function(obj)
		local constraint = Instance.new("UIAspectRatioConstraint")
		constraint.Parent = element
		
		constraint.AspectRatio = obj.UIAspectRatioConstraint.AspectRatio or 1
		constraint.AspectType = obj.UIAspectRatioConstraint.ApectType or Enum.AspectType.FitWithinMaxSize
		constraint.DominantAxis = obj.UIAspectRatioConstraint.DominantAxis or Enum.DominantAxis.Width
	end)

	self:DoWithOptionsOrTheme(options, Theme, "Centered", function(obj)
		element.Position = UDim2.new(0.5, 0, 0.5, 0)
		element.AnchorPoint = Vector2.new(0.5, 0.5)
	end)

	self:DoWithOptionsOrTheme(options, Theme, "CenteredVertically", function(obj)
		element.Position = UDim2.fromScale(element.Position.X.Scale, 0.5)
		element.AnchorPoint = Vector2.new(0, 0.5)
	end)

	self:DoWithOptionsOrTheme(options, Theme, "CenteredHorizontally", function(obj)
		element.Position = UDim2.fromScale(0.5, element.Position.Y.Scale)
		element.AnchorPoint = Vector2.new(0.5, 0)
	end)

	self:DoWithOptionsOrTheme(options, Theme, "UICorner", function(obj)
		local corner = Instance.new("UICorner", element)
		corner.CornerRadius = obj.UICorner.CornerRadius or UDim.new(0, 8)
	end)
end

--- Sets the base GuiObject events.
---@param element any
function Widget:SetBaseGuiEvents(element)
	local options = self.Options

	local BASE_GUI_EVENTS = {
		{"InputBegan", "OnInputBegan"}, {"InputChanged", "OnInputChanged"}, {"InputEnded", "OnInputEnded"},
		{"MouseEnter", "OnMouseEnter"}, {"MouseLeave", "OnMouseLeave"}, {"MouseMoved", "OnMouseMoved"},
		{"MouseWheelBackward", "OnMouseWheelBackward"}, {"MouseWheelForward", "OnMouseWheelForward"},
		{"SelectionGained", "OnSelectionGained"}, {"SelectionLost", "OnSelectionLost"},
		{"TouchLongPress", "OnTouchLongPress"}, {"TouchPan", "OnTouchPan"},
		{"TouchPinch", "OnTouchPinch"}, {"TouchRotate", "OnTouchRotate"},
		{"TouchSwipe", "OnTouchSwipe"}, {"TouchTap", "OnTouchTap"},
		{"AncestryChanged", "OnAncestryChanged"}, {"AttributeChanged", "OnAttributeChanged"},
		{"Changed", "OnChanged"}, {"ChildAdded", "OnChildAdded"}, {"ChildRemoved", "OnChildRemoved"},
		{"DescendantAdded", "OnDescendantAdded"}, {"DescendantRemoving", "OnDescendantRemoving"},
	}
	for _, pair in ipairs(BASE_GUI_EVENTS) do
		if options[pair[2]] then element[pair[1]]:Connect(options[pair[2]]) end
	end
end

--- Sets Button events.
---@param element any
function Widget:SetButtonGuiEvents(element)
	local options = self.Options
	
	local BUTTON_EVENTS = {
		{"MouseButton1Click", "OnClick"}, {"MouseButton1Down", "OnClickDown"},
		{"MouseButton1Up", "OnClickUp"}, {"MouseButton2Click", "OnRightClick"},
		{"MouseButton2Down", "OnRightClickDown"},
	}
	for _, pair in ipairs(BUTTON_EVENTS) do
		if options[pair[2]] then element[pair[1]]:Connect(options[pair[2]]) end
	end
end

--- Sets text properties.
---@param element any
function Widget:SetTextGuiProperties(element)
	local options = self.Options
	local Theme = self.Theme
	
	if Theme == nil then Theme = {} end

	if options.Class then
		Theme = self.Context.Classes[options.Class]
	end

	local TEXT_PROPERTIES = {
		"Font", "LineHeight", "RichText", "TextColor3", "TextScaled", "TextSize",
		"TextStrokeColor3", "TextStrokeTransparency", "TextTransparency",
		"TextTruncate", "TextWrapped", "TextXAlignment", "TextYAlignment",
	}
	for _, prop in ipairs(TEXT_PROPERTIES) do
		self:SetPropertyFromOptionsOrTheme(element, prop, options, Theme.TextTheme, self.DefaultTheme.TextTheme)
	end
end

--- Sets ImageButton properties.
---@param element any
function Widget:SetImageButtonGuiProperties(element)
	local options = self.Options
	local Theme = self.Theme

	if options.Class then
		Theme = self.Context.Classes[options.Class]
	end
	
	local IMAGE_BUTTON_PROPERTIES = {
		"HoverImage", "PressedImage", "ImageColor3", "ImageRectSize",
		"ImageTransparency", "ScaleType", "SliceScale", "ImageRectOffset", "SliceCenter",
	}
	for _, prop in ipairs(IMAGE_BUTTON_PROPERTIES) do
		self:SetPropertyFromOptionsOrTheme(element, prop, options, Theme, self.DefaultTheme)
	end
	
	self:SetButtonGuiEvents(element)
end

--- Sets ImageLabel properties.
---@param element any
function Widget:SetImageLabelGuiProperties(element)
	local options = self.Options
	local Theme = self.Theme

	if options.Class then
		Theme = self.Context.Classes[options.Class]
	end
	
	local IMAGE_LABEL_PROPERTIES = {
		"ImageColor3", "ImageRectSize", "ImageTransparency", "ScaleType", "SliceScale", "SliceCenter",
	}
	for _, prop in ipairs(IMAGE_LABEL_PROPERTIES) do
		self:SetPropertyFromOptionsOrTheme(element, prop, options, Theme, self.DefaultTheme)
	end
end

--- Sets Viewport properties.
---@param element any
function Widget:SetViewportGuiProperties(element)
	local options = self.Options
	local Theme = self.Theme

	if options.Class then
		Theme = self.Context.Classes[options.Class]
	end

	local VIEWPORT_PROPERTIES = {
		"Ambient", "CurrentCamera", "ImageColor3", "ImageTransparency", "LightColor", "LightDirection",
	}
	for _, prop in ipairs(VIEWPORT_PROPERTIES) do
		self:SetPropertyFromOptionsOrTheme(element, prop, options, Theme, self.DefaultTheme)
	end
end

return Widget
