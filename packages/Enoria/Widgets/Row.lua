local Widget = require(script.Parent.Widget)

local Row = {}
Row.__index = Row
setmetatable(Row, Widget)

function Row.new(options, context)
	local self = Widget.new(options, "RowTheme", context)
	setmetatable(self, Row)
	local Theme = self.Theme
	
	local element = Instance.new("Frame")
	
	local layoutOrder = 0

	if options.Children ~= nil then
		for _, child in ipairs(options.Children) do
			child.Parent = element
			if child:IsA("GuiObject") then
				child.LayoutOrder = layoutOrder
				layoutOrder += 1
			end
		end
	end

	local list = Instance.new("UIListLayout", element)
	self:SetPropertyFromOptionsOrTheme(list, "Padding", options)
	self:SetPropertyFromOptionsOrTheme(list, "HorizontalAlignment", options)
	self:SetPropertyFromOptionsOrTheme(list, "VerticalAlignment", options)
	self:SetPropertyFromOptionsOrTheme(list, "SortOrder", options)
	list.FillDirection = Enum.FillDirection.Horizontal

	self:SetBaseGuiProperties(element)
	self:SetBaseGuiEvents(element)
	
	return element
end

return Row
