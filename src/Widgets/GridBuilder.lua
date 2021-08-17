local Widget = require(script.Parent.Widget)

local GridBuilder = {}
GridBuilder.__index = GridBuilder
setmetatable(GridBuilder, Widget)



function GridBuilder.new(itemCount, builder, options, context)
	local self = Widget.new(options or {}, "GridBuilderTheme", context)
	setmetatable(self, GridBuilder)
	local Theme = self.Context.Theme
	
	options = options or {}
	
	local element = Instance.new("Frame")
	
	for i = 1, itemCount, 1 do
		local content = builder(i)
		content.Parent = element
	end
	
	local grid = Instance.new("UIGridLayout", element)
	self:SetPropertyFromOptionsOrTheme(grid, "CellPadding", options)
	self:SetPropertyFromOptionsOrTheme(grid, "CellSize", options)
	self:SetPropertyFromOptionsOrTheme(grid, "HorizontalAlignment", options)
	self:SetPropertyFromOptionsOrTheme(grid, "VerticalAlignment", options)
	self:SetPropertyFromOptionsOrTheme(grid, "SortOrder", options)
	self:SetPropertyFromOptionsOrTheme(grid, "FillDirection", options)
	self:SetPropertyFromOptionsOrTheme(grid, "StartCorner", options)
	self:SetPropertyFromOptionsOrTheme(grid, "FillDirectionMaxCells", options)

	self:SetBaseGuiProperties(element)
	self:SetBaseGuiEvents(element)
	
	return element
end

return GridBuilder
