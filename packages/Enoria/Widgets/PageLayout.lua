local Widget = require(script.Parent.Widget)

local PageLayout = {}
PageLayout.__index = PageLayout
setmetatable(PageLayout, Widget)

function PageLayout.new(options, context)
	local self = Widget.new(options, "PageLayoutTheme", context)
	setmetatable(self, PageLayout)
	local Theme = self.Theme
	
	local element = Instance.new("Frame")
	local layoutOrder = 0

	if options.Children ~= nil then
		for _, child in ipairs(options.Children) do
			child.Parent = element
			child.LayoutOrder = layoutOrder
			layoutOrder = layoutOrder + 1
		end
	end

	local pageLayout = Instance.new("UIPageLayout")
	self:SetPropertyFromOptionsOrTheme(pageLayout, "Animated", options)
	self:SetPropertyFromOptionsOrTheme(pageLayout, "Circular", options)
	self:SetPropertyFromOptionsOrTheme(pageLayout, "EasingDirection", options)
	self:SetPropertyFromOptionsOrTheme(pageLayout, "EasingStyle", options)
	self:SetPropertyFromOptionsOrTheme(pageLayout, "Padding", options)
	self:SetPropertyFromOptionsOrTheme(pageLayout, "TweenTime", options)
	self:SetPropertyFromOptionsOrTheme(pageLayout, "FillDirection", options)
	self:SetPropertyFromOptionsOrTheme(pageLayout, "HorizontalAlignment", options)
	self:SetPropertyFromOptionsOrTheme(pageLayout, "SortOrder", options)
	self:SetPropertyFromOptionsOrTheme(pageLayout, "VerticalAlignment", options)
	self:SetPropertyFromOptionsOrTheme(pageLayout, "GamepadInputEnabled", options)
	self:SetPropertyFromOptionsOrTheme(pageLayout, "ScrollWheelInputEnabled", options)
	self:SetPropertyFromOptionsOrTheme(pageLayout, "TouchInputEnabled", options)
	
	pageLayout.Parent = element
	
	self:SetBaseGuiProperties(element)
	self:SetBaseGuiEvents(element)
	
	pageLayout.PageEnter:Connect(options.PageEnter or function()end)
	pageLayout.PageLeave:Connect(options.PageLeave or function()end)
	pageLayout.Stopped:Connect(options.Stopped or function()end)
	
	return element
end

return PageLayout
