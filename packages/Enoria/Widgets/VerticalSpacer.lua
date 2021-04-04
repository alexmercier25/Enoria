local Widget = require(script.Parent.Widget)

local HorizontalSpacer = {}
HorizontalSpacer.__index = HorizontalSpacer
setmetatable(HorizontalSpacer, Widget)

function HorizontalSpacer.new(size, options, context)
	local self = Widget.new(options, "HorizontalSpacerTheme", context)
	setmetatable(self, HorizontalSpacer)
	local Theme = self.Theme
	
	local element = Instance.new("Frame")
	
	--if options.Child ~= nil then
	--	options.Child.Parent = element
	--end

	self:SetBaseGuiProperties(element)
	self:SetBaseGuiEvents(element)
	
	element.BackgroundTransparency = 1
	element.Size = UDim2.fromOffset(size, 0)
	
	return element
end

return HorizontalSpacer
