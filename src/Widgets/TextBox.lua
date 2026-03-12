local Widget = require(script.Parent.Widget)

local TextBox = {}
TextBox.__index = TextBox
setmetatable(TextBox, Widget)

function TextBox.new(options, context)
	local self = Widget.new(options, "TextBoxTheme", context)
	setmetatable(self, TextBox)
	local Theme = self.Theme
	
	local element = Instance.new("TextBox")

	if self.Options.Child ~= nil then
		self.Options.Child.Parent = element
	end

	self:SetBaseGuiProperties(element)
	self:SetBaseGuiEvents(element)
	self:SetTextGuiProperties(element)
	
	element.Text = options.Text or ""
	
	self:SetPropertyFromOptionsOrTheme(element, "PlaceholderColor3", options)
	self:SetPropertyFromOptionsOrTheme(element, "PlaceholderText", options)
	self:SetPropertyFromOptionsOrTheme(element, "ClearTextOnFocus", options)
	self:SetPropertyFromOptionsOrTheme(element, "CursorPosition", options)
	self:SetPropertyFromOptionsOrTheme(element, "MultiLine", options)
	self:SetPropertyFromOptionsOrTheme(element, "SelectionStart", options)
	self:SetPropertyFromOptionsOrTheme(element, "ShowNativeInput", options)
	self:SetPropertyFromOptionsOrTheme(element, "TextEditable", options)
	
	if options.FocusLost then element.FocusLost:Connect(options.FocusLost) end
	if options.Focused then element.Focused:Connect(options.Focused) end
	if options.ReturnPressedForOnScreenKeyboard then element.ReturnPressedFromOnScreenKeyboard:Connect(options.ReturnPressedForOnScreenKeyboard) end
	
	return element
end

return TextBox
