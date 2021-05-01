local Widget = require(script.Parent.Widget)

local ListBuilder = {}
ListBuilder.__index = ListBuilder
setmetatable(ListBuilder, Widget)

function ListBuilder.new(itemCount, builder, options, context)
	local self = Widget.new(options or {}, "ListBuilderTheme", context)
	setmetatable(self, ListBuilder)
	local Theme = self.Context.Theme
	
	options = options or {}
	
	local element = Instance.new("Frame")
	
	for i = 1, itemCount, 1 do
		local content = builder(i)
		content.Parent = element
	end
	
	local list = Instance.new("UIListLayout", element)
	self:SetPropertyFromOptionsOrTheme(list, "Padding", options)
	self:SetPropertyFromOptionsOrTheme(list, "HorizontalAlignment", options)
	self:SetPropertyFromOptionsOrTheme(list, "VerticalAlignment", options)
	self:SetPropertyFromOptionsOrTheme(list, "SortOrder", options)

	self:SetBaseGuiProperties(element)
	self:SetBaseGuiEvents(element)
	
	return element
end

return ListBuilder
