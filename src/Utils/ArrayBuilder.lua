local WidgetsBuilder = function(count, builder)
    local widgets = {}

    for i = 1, count do
        widgets[i] = builder(i)
    end

    return widgets
end

return WidgetsBuilder