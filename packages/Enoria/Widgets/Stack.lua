local Widget = require(script.Parent.Widget)

local Stack = {}
Stack.__index = Stack
setmetatable(Stack, Widget)

function Stack.new(options, context)
	local self = Widget.new(options, "StackTheme", context)
	setmetatable(self, Stack)
	local Theme = self.Theme
	
	local element = Instance.new("Frame")

	if options.Children ~= nil then
		for _, child in ipairs(options.Children) do
			child.Parent = element
		end
	end

	self:SetBaseGuiProperties(element)
	self:SetBaseGuiEvents(element)
	
	return element
end

return Stack
