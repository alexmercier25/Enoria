local Widget = require(script.Parent.Widget)

local Viewport = {}
Viewport.__index = Viewport
setmetatable(Viewport, Widget)

function Viewport.new(options, context)
    local self = Widget.new(options, "ViewportTheme", context)
    setmetatable(self, Viewport)
    local Theme = self.Theme

    local element = Instance.new("ViewportFrame")

    if self.Options.Child ~= nil then
        self.Options.Child.Parent = element
    end

    self:SetBaseGuiProperties(element)
    self:SetBaseGuiEvents(element)
    self:SetViewportGuiProperties(element)

    return element
end

return Viewport
