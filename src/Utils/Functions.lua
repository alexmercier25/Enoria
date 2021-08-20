local Functions = {
    FindInGui = function(name, gui)
        local descendants = gui:GetDescendants()
        
        for index, descendant in pairs(descendants) do
            if descendant.Name == name then
                return descendant
            end
        end
        
        return nil
    end
}

return Functions