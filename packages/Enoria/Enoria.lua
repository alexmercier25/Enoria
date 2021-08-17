local Enoria = {}
Enoria.__index = Enoria

function Enoria.new()
   local self = {}
   setmetatable(self, Enoria)

   error("Enoria is no longer at Enoria.packages.Enoria.Enoria. Use Enoria.src.Main instead.")

   return self
end

return Enoria
