local FONT = Enum.Font.GothamSemibold

local TEXTTHEME = {
	Font = FONT,
	TextColor3 = Color3.fromRGB(0, 0, 0)
}

local BACKGROUND_COLOR3 = Color3.new(0.270588, 0.815686, 0.4)

local Theme = {
	TextBoxTheme = {
		TextTheme = TEXTTHEME
	},
	TextButtonTheme = {
		BackgroundColor3 = Color3.fromRGB(0, 170, 0),
		TextTheme = TEXTTHEME
	},
	TextFormFieldTheme = {
		Size = UDim2.fromOffset(200, 25),
		TextTheme = TEXTTHEME
	},
	TextLabelTheme = {
		TextTheme = TEXTTHEME
	},
	ContainerTheme = {
		BackgroundColor3 = BACKGROUND_COLOR3
	}
}

return Theme