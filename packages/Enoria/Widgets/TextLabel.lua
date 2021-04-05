local Widget = require(script.Parent.Widget)

local TextLabel = {}
TextLabel.__index = TextLabel
setmetatable(TextLabel, Widget)

function TextLabel.new(text, options, context)
	local self = Widget.new(options, "TextLabelTheme", context)
	setmetatable(self, TextLabel)
	local Theme = self.Context.Theme
	local element = Instance.new("TextLabel")
	element.Text = text or ""

	if self.Options.Child ~= nil then
		self.Options.Child.Parent = element
	end

	self:SetBaseGuiProperties(element)
	self:SetBaseGuiEvents(element)
	self:SetTextGuiProperties(element)
	
	return element
end

return TextLabel
