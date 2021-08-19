local Widget = require(script.Parent.Widget)

local Observer = {}
Observer.__index = Observer
setmetatable(Observer, Widget)

function Observer.new(context, store, child, actions)
    local self = Widget.new(nil, nil, context)
    setmetatable(self, Observer)

    store:Listen(self, actions)
    self.Child = child

    return self
end

function Observer:Build()
    local element = Instance.new("Folder")

    element.Name = "Observer"
    self.Child().Parent = element

    return self:BuildTree(element)
end

return Observer
