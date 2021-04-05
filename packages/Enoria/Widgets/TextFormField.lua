local Widget = require(script.Parent.Widget)

local TextFormField = {}
TextFormField.__index = TextFormField
setmetatable(TextFormField, Widget)

function TextFormField.new(formKey, options, context)
	local self = Widget.new(options, "TextFormFieldTheme", context)
	setmetatable(self, TextFormField)
	local Theme = self.Theme

	local element = Instance.new("TextBox")
	element.Text = options.Text or ""

	if self.Options.Child ~= nil then
		self.Options.Child.Parent = element
	end
	
	self:SetPropertyFromOptionsOrTheme(element, "PlaceholderColor3", options)
	self:SetPropertyFromOptionsOrTheme(element, "PlaceholderText", options)
	self:SetPropertyFromOptionsOrTheme(element, "ClearTextOnFocus", options)
	self:SetPropertyFromOptionsOrTheme(element, "CursorPosition", options)
	self:SetPropertyFromOptionsOrTheme(element, "MultiLine", options)
	self:SetPropertyFromOptionsOrTheme(element, "SelectionStart", options)
	self:SetPropertyFromOptionsOrTheme(element, "ShowNativeInput", options)
	self:SetPropertyFromOptionsOrTheme(element, "TextEditable", options)

	self:SetBaseGuiProperties(element)
	self:SetBaseGuiEvents(element)
	self:SetTextGuiProperties(element)
	
	element.FocusLost:Connect(options.FocusLost or function()end)
	element.Focused:Connect(options.Focused or function()end)
	element.ReturnPressedFromOnScreenKeyboard:Connect(options.ReturnPressedForOnScreenKeyboard or function()end)
	element.FocusLost:Connect(options.FocusLost or function()end)
	
	local frame = Instance.new("Frame")
	frame.Name = "_TextFormFieldContainer"
	element.Parent = frame
	
	--local errorLabel
	--if options.BuildErrorLabel ~= nil then
	--	errorLabel = options.BuildErrorLabel()
	--	errorLabel.Parent = frame
	--end
	
	local list = Instance.new("UIListLayout", frame)
	list.HorizontalAlignment = Enum.HorizontalAlignment.Center
	frame.AutomaticSize = Enum.AutomaticSize.XY
	frame.BackgroundTransparency = 1
	
	table.insert(formKey.Fields, {options.Validator or function()end, frame, element, options.BuildErrorLabel or function()end})
	
	return frame
end

return TextFormField
