local Store = {}
Store.__index = Store

function Store.new()
   local self = {}
   setmetatable(self, Store)

   self.Name = "Store"

   return self
end

function Store:BeforeBuild()
    
end

return Store
