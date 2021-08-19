local Widget = require(script.Parent.Widget)

local Nested = {}
Nested.__index = Nested
setmetatable(Nested, Widget)

function Nested.new(widgets, context)
    local self = Widget.new(nil, nil, context)
    setmetatable(self, Nested)

    local element = Instance.new("Folder")
    element.Name = "Nested"

    for i = #widgets, 1, -1 do
        if i > 1 then
            widgets[i].Parent = widgets[i - 1]
        else
            widgets[i].Parent = element
        end
    end

    return element
end

return Nested
