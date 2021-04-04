local Widget = require(script.Parent.Widget)

local VerticalSpacer = {}
VerticalSpacer.__index = VerticalSpacer
setmetatable(VerticalSpacer, Widget)

function VerticalSpacer.new(size, options, context)
	local self = Widget.new(options, "VerticalSpacerTheme", context)
	setmetatable(self, VerticalSpacer)
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

return VerticalSpacer
