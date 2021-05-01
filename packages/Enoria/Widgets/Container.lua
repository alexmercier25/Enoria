local Widget = require(script.Parent.Widget)

local Container = {}
Container.__index = Container
setmetatable(Container, Widget)

function Container.new(options, context)
    local self = Widget.new(options, "ContainerTheme", context)
    setmetatable(self, Container)
    local Theme = self.Theme

    local element = Instance.new("Frame")

    if self.Options.Child ~= nil then
        self.Options.Child.Parent = element
    end

    self:SetBaseGuiProperties(element)
    self:SetBaseGuiEvents(element)

    return element
end

return Container
