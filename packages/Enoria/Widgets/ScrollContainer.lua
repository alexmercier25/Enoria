local Widget = require(script.Parent.Widget)

local ScrollContainer = {}
ScrollContainer.__index = ScrollContainer
setmetatable(ScrollContainer, Widget)

function ScrollContainer.new(options, context)
	local self = Widget.new(options, "ScrollContainerTheme", context)
	setmetatable(self, ScrollContainer)
	local Theme = self.Context.Theme
	
	local element = Instance.new("ScrollingFrame")
	
	if options.Child ~= nil then
		options.Child.Parent = element
	end
	
	--Theme = Theme.ScrollContainerTheme
	
	self:SetPropertyFromOptionsOrTheme(element, "AutomaticCanvasSize", options)
	self:SetPropertyFromOptionsOrTheme(element, "BottomImage", options)
	self:SetPropertyFromOptionsOrTheme(element, "CanvasPosition", options)
	self:SetPropertyFromOptionsOrTheme(element, "CanvasSize", options)
	self:SetPropertyFromOptionsOrTheme(element, "ElasticBehavior", options)
	self:SetPropertyFromOptionsOrTheme(element, "HorizontalScrollBarInset", options)
	self:SetPropertyFromOptionsOrTheme(element, "MidImage", options)
	self:SetPropertyFromOptionsOrTheme(element, "ScrollBarImageColor3", options)
	self:SetPropertyFromOptionsOrTheme(element, "ScrollBarImageTransparency", options)
	self:SetPropertyFromOptionsOrTheme(element, "ScrollBarThickness", options)
	self:SetPropertyFromOptionsOrTheme(element, "ScrollingDirection", options)
	self:SetPropertyFromOptionsOrTheme(element, "ScrollingEnabled", options)
	self:SetPropertyFromOptionsOrTheme(element, "TopImage", options)
	self:SetPropertyFromOptionsOrTheme(element, "VerticalScrollBarInset", options)
	self:SetPropertyFromOptionsOrTheme(element, "VerticalScrollBarPosition", options)
	
	if options.SmartSizing then
		element.AutomaticSize = Enum.AutomaticSize.None
		element.Changed:Connect(function()
			local list = element:FindFirstChild(element:GetChildren()[1].Name)
			if list:FindFirstChild("UIListLayout") then
				list = list.UIListLayout
			elseif list:FindFirstChild("UIGridLayout") then
				list = list.UIGridLayout
			end
			element.CanvasSize = UDim2.new(0, 0, 0, list.AbsoluteContentSize.Y)
			if list.AbsoluteContentSize.Y > element.AbsoluteSize.Y then
				element:FindFirstChild(element:GetChildren()[1].Name).UIPadding.PaddingRight = UDim.new(0, 10)
			else
				element:FindFirstChild(element:GetChildren()[1].Name).UIPadding.PaddingRight = UDim.new(0, 0)
			end
		end)

	end

	self:SetBaseGuiProperties(element)
	self:SetBaseGuiEvents(element)
	
	return element
end

return ScrollContainer
