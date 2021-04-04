local Widget = require(script.Parent.Widget)

local TextButton = {}
TextButton.__index = TextButton
setmetatable(TextButton, Widget)

function TextButton.new(text, options, context)
	local self = Widget.new(options, "TextButtonTheme", context)
	setmetatable(self, TextButton)
	local Theme = self.Context.Theme
	
	local element = Instance.new("TextButton")
	element.Text = text or ""

	self:SetBaseGuiProperties(element)
	self:SetBaseGuiEvents(element)
	self:SetButtonGuiEvents(element)
	self:SetTextGuiProperties(element)
	
	return element
end

return TextButton
