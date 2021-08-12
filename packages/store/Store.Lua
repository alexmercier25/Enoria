local Store = {}
Store.__index = Store

function Store.new(state, name)
   local self = {}
   setmetatable(self, Store)

   self.Name = name or "Store"
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

function Store:Listen(widget, actions)
    for i, v in ipairs(actions) do
        self.Widgets[v] = self.Widgets[v] or {}
        self.Widgets[v][widget.WidgetId] = widget
    end
end

function Store:BeforeWidgetBuild(widget)
end

function Store:AfterWidgetBuild(widget)
end

function Store:BeforeSetState(widget)
end

return Store