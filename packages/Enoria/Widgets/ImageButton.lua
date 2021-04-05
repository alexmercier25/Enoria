local Widget = require(script.Parent.Widget)

local ImageButton = {}
ImageButton.__index = ImageButton
setmetatable(ImageButton, Widget)

function ImageButton.new(image, options, context)
	local self = Widget.new(options, "ImageButtonTheme", context)
	setmetatable(self, ImageButton)
	local Theme = self.Context.Theme
	
	local element = Instance.new("ImageButton")

	if self.Options.Child ~= nil then
		self.Options.Child.Parent = element
	end

	self:SetBaseGuiProperties(element)
	self:SetBaseGuiEvents(element)
	self:SetButtonGuiEvents(element)
	self:SetImageButtonGuiProperties(element)
	
	element.Image = image or options.Image
	
	return element
end

return ImageButton
