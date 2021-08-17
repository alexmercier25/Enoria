local Render = function(templateName, templateFolder, builder)
    if templateFolder == nil then
        error("No template folder has been provided. Execute Enoria:SetTemplateFolder(TemplateFolderLocationHere) before rendering templates.")
        local error = Instance.new("TextLabel")
        error.Text = "No template folder has been provided. Execute Enoria:SetTemplateFolder(TemplateFolderLocationHere) before rendering templates."
        error.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        return error
    end

    local element = templateFolder:FindFirstChild(templateName)

    builder(element)

    return element
end

return Render