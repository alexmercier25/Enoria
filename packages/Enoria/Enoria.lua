local Enoria = {}
Enoria.__index = Enoria

function Enoria.new()
   local self = {}
   setmetatable(self, Enoria)

   print("[DEPRECATED] Enoria is no longer at Enoria.packages.Enoria.Enoria. Use Enoria.src.Main instead.")
   local e = require(script.Parent.Parent.Parent.src.Main)

   return e.new()
end

return Enoria
