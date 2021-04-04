local Widget = require(script.Parent.Widget)
local Theme = require(script.Parent.Parent.DefaultTheme)
local FormKeyModel = require(script.Parent.FormKey)

local Form = {}
Form.__index = Form
setmetatable(Form, Widget)

function Form.new(formKey, options, context)
	local self = Widget.new(options, "FormTheme", context)
	setmetatable(self, Form)
	local Theme = self.Theme
	self.FormKey = formKey
	
	local element = Instance.new("Frame")

	if options.Child ~= nil then
		options.Child.Parent = element
	end

	self:SetBaseGuiProperties(element)
	self:SetBaseGuiEvents(element)
	
	return element
end

return Form
