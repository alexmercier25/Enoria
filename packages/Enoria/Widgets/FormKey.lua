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
	
	for i, v in ipairs(self.Fields) do
		local errorLabel
		if v[1](v[3].Text) ~= nil then
			allValid = false
			errorLabel = v[4](v[1](v[3].Text))
			table.insert(self.ErrorLabels, errorLabel)
			errorLabel.Parent = v[2]
		else
			if errorLabel ~= nil then
				errorLabel:Destroy()
			end
		end
	end
	return allValid
end

return FormKey
