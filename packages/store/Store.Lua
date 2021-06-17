local Store = {}
Store.__index = Store

function Store.new(state)
   local self = {}
   setmetatable(self, Store)

   self.Name = "Store"
   self.Getters = {}
   self.Setters = {}
   self.Actions = {}
   self.State = state or {}
   self.Widgets = {}

   return self
end

function Store:SetStateVariable(name, value)
    self.State[name] = value
end

function Store:AddGetter(name, fnc)
    self.Getters[name] = fnc
end

function Store:AddSetter(name, fnc)
    self.Setters[name] = fnc
end

function Store:AddAction(name, fnc)
    self.Actions[name] = fnc
end

function Store:Commit(name, args)
    self.Actions[name](args)
    for i, v in next, self.Widgets[name] do
        v:Rebuild()
    end
end

function Store:Listen(widget, action)
    self.Widgets[action] = self.Widgets[action] or {}
    self.Widgets[action][widget.WidgetId] = widget
end

function Store:BeforeWidgetBuild(widget)
end

function Store:AfterWidgetBuild(widget)
end

function Store:BeforeSetState(widget)
end

return Store