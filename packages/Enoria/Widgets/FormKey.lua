local FormKey = {}
FormKey.__index = FormKey

function FormKey.new()
	local self = {}
	setmetatable(self, FormKey)
	
	self.Fields = {}
	self.ErrorLabels = {}
	
	return self
end

function FormKey:Validate()
	local allValid = true
	
	for i, v in ipairs(self.ErrorLabels) do
		v:Destroy()
	end
	
	self.ErrorLabels = {}
	
	for i, v in next, self.Fields do
		local errorLabel
		if v.Validator(v.Element.Text) ~= nil then
			allValid = false
			errorLabel = v.BuildErrorLabel(v.Validator(v.Element.Text))
			table.insert(self.ErrorLabels, errorLabel)
			errorLabel.Name = "_ErrorLabel"
			errorLabel.Parent = v.Frame
		else
			if errorLabel ~= nil then
				errorLabel:Destroy()
			end
		end
	end
	return allValid
end

return FormKey
