local TextLabelTextTheme = {
	Font = Enum.Font.SourceSans,
	LineHeight = 1,
	RichText = false,
	TextColor3 = Color3.fromRGB(0, 0, 0),
	TextScaled = false,
	TextSize = 21,
	TextStrokeColor3 = Color3.fromRGB(0, 0, 0),
	TextStrokeTransparency = 1,
	TextTransparency = 0,
	TextTruncate = Enum.TextTruncate.None,
	TextWrapped = true,
	TextXAlignment = Enum.TextXAlignment.Center,
	TextYAlignment = Enum.TextYAlignment.Center
}

local TextButtonTextTheme = {
	Font = Enum.Font.SourceSans,
	LineHeight = 1,
	RichText = false,
	TextColor3 = Color3.fromRGB(0, 0, 0),
	TextScaled = false,
	TextSize = 21,
	TextStrokeColor3 = Color3.fromRGB(0, 0, 0),
	TextStrokeTransparency = 1,
	TextTransparency = 0,
	TextTruncate = Enum.TextTruncate.None,
	TextWrapped = true,
	TextXAlignment = Enum.TextXAlignment.Center,
	TextYAlignment = Enum.TextYAlignment.Center
}

local TextBoxTextTheme = {
	Font = Enum.Font.SourceSans,
	LineHeight = 1,
	RichText = false,
	TextColor3 = Color3.fromRGB(0, 0, 0),
	TextScaled = true,
	TextSize = 21,
	TextStrokeColor3 = Color3.fromRGB(0, 0, 0),
	TextStrokeTransparency = 1,
	TextTransparency = 0,
	TextTruncate = Enum.TextTruncate.None,
	TextWrapped = true,
	TextXAlignment = Enum.TextXAlignment.Center,
	TextYAlignment = Enum.TextYAlignment.Center
}

local TextFormFieldTextTheme = {
	Font = Enum.Font.SourceSans,
	LineHeight = 1,
	RichText = false,
	TextColor3 = Color3.fromRGB(0, 0, 0),
	TextScaled = true,
	TextSize = 21,
	TextStrokeColor3 = Color3.fromRGB(0, 0, 0),
	TextStrokeTransparency = 1,
	TextTransparency = 0,
	TextTruncate = Enum.TextTruncate.None,
	TextWrapped = true,
	TextXAlignment = Enum.TextXAlignment.Center,
	TextYAlignment = Enum.TextYAlignment.Center
}

local ErrorLabelTextTheme = {
	Font = Enum.Font.SourceSans,
	LineHeight = 1,
	RichText = false,
	TextColor3 = Color3.fromRGB(255, 0, 0),
	TextScaled = false,
	TextSize = 21,
	TextStrokeColor3 = Color3.fromRGB(0, 0, 0),
	TextStrokeTransparency = 1,
	TextTransparency = 0,
	TextTruncate = Enum.TextTruncate.None,
	TextWrapped = true,
	TextXAlignment = Enum.TextXAlignment.Center,
	TextYAlignment = Enum.TextYAlignment.Center
}

local Theme = {
	PageLayoutTheme = {
		Name = "PageLayout",
		Active = false,
		AnchorPoint = Vector2.new(0, 0),
		AutomaticSize = Enum.AutomaticSize.None,
		BackgroundColor3 = Color3.new(0.905882, 0.905882, 0.905882),
		BackgroundTransparency = 0,
		BorderColor3 = Color3.fromRGB(27, 42, 53),
		BorderMode = Enum.BorderMode.Outline,
		BorderSizePixel = 1,
		LayoutOrder = 0,
		Selectable = false,
		Size = UDim2.new(1, 0, 1, 0),
		SizeConstraint = Enum.SizeConstraint.RelativeXY,
		ClipsDescendants = true,
		Position = UDim2.new(0, 0, 0, 0),
		Rotation = 0,
		ZIndex = 1,
		AutoLocalize = true,
		Visible = true,

		Animated = true,
		Circular = false,
		EasingDirection = Enum.EasingDirection.Out,
		EasingStyle = Enum.EasingStyle.Back,
		Padding = UDim.new(0, 0),
		TweenTime = 1,
		FillDirection = Enum.FillDirection.Horizontal,
		HorizontalAlignment = Enum.HorizontalAlignment.Left,
		SortOrder = Enum.SortOrder.LayoutOrder,
		VerticalAlignment = Enum.VerticalAlignment.Top,
		GamepadInputEnabled = true,
		ScrollWheelInputEnabled = true,
		TouchInputEnabled = true
	},

	ContainerTheme = {
		Name = "Container",
		Active = false,
		AnchorPoint = Vector2.new(0, 0),
		AutomaticSize = Enum.AutomaticSize.None,
		BackgroundColor3 = Color3.new(0.905882, 0.905882, 0.905882),
		BackgroundTransparency = 0,
		BorderColor3 = Color3.fromRGB(27, 42, 53),
		BorderMode = Enum.BorderMode.Outline,
		BorderSizePixel = 1,
		LayoutOrder = 0,
		Selectable = false,
		Size = UDim2.new(1, 0, 1, 0),
		SizeConstraint = Enum.SizeConstraint.RelativeXY,
		ClipsDescendants = false,
		Position = UDim2.new(0, 0, 0, 0),
		Rotation = 0,
		ZIndex = 1,
		AutoLocalize = true,
		Visible = true,
	},

	ViewportTheme = {
		Name = "Viewport",
		Ambient = Color3.new(200, 200, 200),
		LightColor = Color3.new(140, 140, 140),
		LightDirection = Vector3.new(-1, -1, -1),
		CurrentCamera = null,
		ImageColor3 = Color3.new(255, 255, 255),
		ImageTransparency = 0,
		Active = false,
		AnchorPoint = Vector2.new(0, 0),
		AutomaticSize = Enum.AutomaticSize.None,
		BackgroundColor3 = Color3.new(0.905882, 0.905882, 0.905882),
		BackgroundTransparency = 0,
		BorderColor3 = Color3.fromRGB(27, 42, 53),
		BorderMode = Enum.BorderMode.Outline,
		BorderSizePixel = 1,
		LayoutOrder = 0,
		Selectable = false,
		Size = UDim2.new(1, 0, 1, 0),
		SizeConstraint = Enum.SizeConstraint.RelativeXY,
		ClipsDescendants = false,
		Position = UDim2.new(0, 0, 0, 0),
		Rotation = 0,
		ZIndex = 1,
		AutoLocalize = true,
		Visible = true,
	},

	FormTheme = {
		Name = "Form",
		Active = false,
		AnchorPoint = Vector2.new(0, 0),
		AutomaticSize = Enum.AutomaticSize.None,
		BackgroundColor3 = Color3.new(0.905882, 0.905882, 0.905882),
		BackgroundTransparency = 1,
		BorderColor3 = Color3.fromRGB(27, 42, 53),
		BorderMode = Enum.BorderMode.Outline,
		BorderSizePixel = 1,
		LayoutOrder = 0,
		Selectable = false,
		Size = UDim2.new(1, 0, 1, 0),
		SizeConstraint = Enum.SizeConstraint.RelativeXY,
		ClipsDescendants = false,
		Position = UDim2.new(0, 0, 0, 0),
		Rotation = 0,
		ZIndex = 1,
		AutoLocalize = true,
		Visible = true,
	},

	ScrollContainerTheme = {
		Name = "ScrollContainer",
		Active = false,
		AnchorPoint = Vector2.new(0, 0),
		AutomaticSize = Enum.AutomaticSize.None,
		BackgroundColor3 = Color3.new(0.905882, 0.905882, 0.905882),
		BackgroundTransparency = 0,
		BorderColor3 = Color3.fromRGB(27, 42, 53),
		BorderMode = Enum.BorderMode.Outline,
		BorderSizePixel = 1,
		LayoutOrder = 0,
		Selectable = false,
		Size = UDim2.new(1, 0, 1, 0),
		SizeConstraint = Enum.SizeConstraint.RelativeXY,
		ClipsDescendants = true,
		Position = UDim2.new(0, 0, 0, 0),
		Rotation = 0,
		ZIndex = 1,
		AutoLocalize = true,
		Visible = true,

		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		BottomImage = "rbxasset://textures/ui/Scroll/scroll-bottom.png",
		CanvasPosition = Vector2.new(0, 0),
		CanvasSize = UDim2.new(0, 0, 0, 0),
		ElasticBehavior = Enum.ElasticBehavior.WhenScrollable,
		HorizontalScrollBarInset = Enum.ScrollBarInset.None,
		MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png",
		ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0),
		ScrollBarImageTransparency = 0,
		ScrollBarThickness = 12,
		ScrollingDirection = Enum.ScrollingDirection.XY,
		ScrollingEnabled = true,
		TopImage = "rbxasset://textures/ui/Scroll/scroll-top.png",
		VerticalScrollBarInset = Enum.ScrollBarInset.None,
		VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right
	},

	TextButtonTheme = {
		Name = "TextButton",
		Active = false,
		AnchorPoint = Vector2.new(0, 0),
		AutomaticSize = Enum.AutomaticSize.None,
		BackgroundColor3 = Color3.new(0.905882, 0.905882, 0.905882),
		BackgroundTransparency = 0,
		BorderColor3 = Color3.fromRGB(27, 42, 53),
		BorderMode = Enum.BorderMode.Outline,
		BorderSizePixel = 1,
		LayoutOrder = 0,
		Selectable = false,
		Size = UDim2.new(0, 100, 0, 25),
		SizeConstraint = Enum.SizeConstraint.RelativeXY,
		ClipsDescendants = false,
		Position = UDim2.new(0, 0, 0, 0),
		Rotation = 0,
		ZIndex = 1,
		AutoLocalize = true,
		TextTheme = TextButtonTextTheme,
		Visible = true,
	},

	ImageButtonTheme = {
		name = "ImageButton",
		Active = false,
		AnchorPoint = Vector2.new(0, 0),
		AutomaticSize = Enum.AutomaticSize.None,
		BackgroundColor3 = Color3.new(0.905882, 0.905882, 0.905882),
		BackgroundTransparency = 0,
		BorderColor3 = Color3.fromRGB(27, 42, 53),
		BorderMode = Enum.BorderMode.Outline,
		BorderSizePixel = 1,
		LayoutOrder = 0,
		Selectable = false,
		Size = UDim2.new(0, 50, 0, 50),
		SizeConstraint = Enum.SizeConstraint.RelativeXY,
		ClipsDescendants = false,
		Position = UDim2.new(0, 0, 0, 0),
		Rotation = 0,
		ZIndex = 1,
		AutoLocalize = true,
		Visible = true,

		HoverImage = "",
		Image = "rbxasset://textures/ui/GuiImagePlaceholder.png",
		ImageColor3 = Color3.fromRGB(255, 255, 255),
		ImageRectOffset = Vector2.new(0, 0),
		ImageRectSize = Vector2.new(0, 0),
		ImageTransparency = 0,
		PressedImage = "",
		ScaleType = Enum.ScaleType.Stretch,
		SliceScale = 1,
		SliceCenter = Rect.new(0, 0, 0, 0)
	},

	ImageLabelTheme = {
		Name = "ImageLabel",
		Active = false,
		AnchorPoint = Vector2.new(0, 0),
		AutomaticSize = Enum.AutomaticSize.None,
		BackgroundColor3 = Color3.new(0.905882, 0.905882, 0.905882),
		BackgroundTransparency = 0,
		BorderColor3 = Color3.fromRGB(27, 42, 53),
		BorderMode = Enum.BorderMode.Outline,
		BorderSizePixel = 1,
		LayoutOrder = 0,
		Selectable = false,
		Size = UDim2.new(0, 50, 0, 50),
		SizeConstraint = Enum.SizeConstraint.RelativeXY,
		ClipsDescendants = false,
		Position = UDim2.new(0, 0, 0, 0),
		Rotation = 0,
		ZIndex = 1,
		AutoLocalize = true,
		Visible = true,

		Image = "rbxasset://textures/ui/GuiImagePlaceholder.png",
		ImageColor3 = Color3.fromRGB(255, 255, 255),
		ImageRectOffset = Vector2.new(0, 0),
		ImageRectSize = Vector2.new(0, 0),
		ImageTransparency = 0,
		ScaleType = Enum.ScaleType.Stretch,
		SliceScale = 1,
		SliceCenter = Rect.new(0, 0, 0, 0)
	},

	TextLabelTheme = {
		Name = "TextLabel",
		Active = false,
		AnchorPoint = Vector2.new(0, 0),
		AutomaticSize = Enum.AutomaticSize.XY,
		BackgroundColor3 = Color3.new(0.905882, 0.905882, 0.905882),
		BackgroundTransparency = 1,
		BorderColor3 = Color3.fromRGB(27, 42, 53),
		BorderMode = Enum.BorderMode.Outline,
		BorderSizePixel = 1,
		LayoutOrder = 0,
		Selectable = false,
		Size = UDim2.new(0, 0, 0, 0),
		SizeConstraint = Enum.SizeConstraint.RelativeXY,
		ClipsDescendants = false,
		Position = UDim2.new(0, 0, 0, 0),
		Rotation = 0,
		ZIndex = 1,
		AutoLocalize = true,
		Visible = true,
		TextTheme = TextLabelTextTheme
	},

	TextBoxTheme = {
		Name = "TextBox",
		Active = false,
		AnchorPoint = Vector2.new(0, 0),
		AutomaticSize = Enum.AutomaticSize.None,
		BackgroundColor3 = Color3.new(0.905882, 0.905882, 0.905882),
		BackgroundTransparency = 0,
		BorderColor3 = Color3.fromRGB(27, 42, 53),
		BorderMode = Enum.BorderMode.Outline,
		BorderSizePixel = 1,
		LayoutOrder = 0,
		Selectable = false,
		Size = UDim2.new(0, 100, 0, 25),
		SizeConstraint = Enum.SizeConstraint.RelativeXY,
		ClipsDescendants = false,
		Position = UDim2.new(0, 0, 0, 0),
		Rotation = 0,
		ZIndex = 1,
		AutoLocalize = true,
		TextTheme = TextBoxTextTheme,
		Visible = true,

		PlaceholderColor3 = Color3.fromRGB(178, 178, 178),
		PlaceholderText = "",
		ClearTextOnFocus = false,
		CursorPosition = 1,
		MultiLine = false,
		SelectionStart = -1,
		ShowNativeInput = true,
		TextEditable = true
	},

	TextFormFieldTheme = {
		Name = "TextFormField",
		Active = false,
		AnchorPoint = Vector2.new(0, 0),
		AutomaticSize = Enum.AutomaticSize.None,
		BackgroundColor3 = Color3.new(0.905882, 0.905882, 0.905882),
		BackgroundTransparency = 0,
		BorderColor3 = Color3.fromRGB(27, 42, 53),
		BorderMode = Enum.BorderMode.Outline,
		BorderSizePixel = 1,
		LayoutOrder = 0,
		Selectable = false,
		Size = UDim2.new(0, 100, 0, 25),
		SizeConstraint = Enum.SizeConstraint.RelativeXY,
		ClipsDescendants = false,
		Position = UDim2.new(0, 0, 0, 0),
		Rotation = 0,
		ZIndex = 1,
		AutoLocalize = true,
		TextTheme = TextFormFieldTextTheme,
		Visible = true,

		PlaceholderColor3 = Color3.fromRGB(178, 178, 178),
		PlaceholderText = "",
		ClearTextOnFocus = false,
		CursorPosition = 1,
		MultiLine = false,
		SelectionStart = -1,
		ShowNativeInput = true,
		TextEditable = true,
		ErrorLabelTextTheme = ErrorLabelTextTheme
	},

	ColumnTheme = {
		Name = "Column",
		Active = false,
		AnchorPoint = Vector2.new(0, 0),
		AutomaticSize = Enum.AutomaticSize.None,
		BackgroundColor3 = Color3.new(0.905882, 0.905882, 0.905882),
		BackgroundTransparency = 1,
		BorderColor3 = Color3.fromRGB(27, 42, 53),
		BorderMode = Enum.BorderMode.Outline,
		BorderSizePixel = 1,
		LayoutOrder = 0,
		Selectable = false,
		Size = UDim2.new(1, 0, 1, 0),
		SizeConstraint = Enum.SizeConstraint.RelativeXY,
		ClipsDescendants = false,
		Position = UDim2.new(0, 0, 0, 0),
		Rotation = 0,
		ZIndex = 1,
		AutoLocalize = true,
		Visible = true,

		Padding = UDim.new(0, 0),
		HorizontalAlignment = Enum.HorizontalAlignment.Left,
		VerticalAlignment = Enum.VerticalAlignment.Top,
		SortOrder = Enum.SortOrder.LayoutOrder
	},

	StackTheme = {
		Name = "Stack",
		Active = false,
		AnchorPoint = Vector2.new(0, 0),
		AutomaticSize = Enum.AutomaticSize.None,
		BackgroundColor3 = Color3.new(0.905882, 0.905882, 0.905882),
		BackgroundTransparency = 1,
		BorderColor3 = Color3.fromRGB(27, 42, 53),
		BorderMode = Enum.BorderMode.Outline,
		BorderSizePixel = 1,
		LayoutOrder = 0,
		Selectable = false,
		Size = UDim2.new(1, 0, 1, 0),
		SizeConstraint = Enum.SizeConstraint.RelativeXY,
		ClipsDescendants = false,
		Position = UDim2.new(0, 0, 0, 0),
		Rotation = 0,
		ZIndex = 1,
		AutoLocalize = true,
		Visible = true,
	},

	RowTheme = {
		Name = "Row",
		Active = false,
		AnchorPoint = Vector2.new(0, 0),
		AutomaticSize = Enum.AutomaticSize.None,
		BackgroundColor3 = Color3.new(0.905882, 0.905882, 0.905882),
		BackgroundTransparency = 1,
		BorderColor3 = Color3.fromRGB(27, 42, 53),
		BorderMode = Enum.BorderMode.Outline,
		BorderSizePixel = 1,
		LayoutOrder = 0,
		Selectable = false,
		Size = UDim2.new(1, 0, 1, 0),
		SizeConstraint = Enum.SizeConstraint.RelativeXY,
		ClipsDescendants = false,
		Position = UDim2.new(0, 0, 0, 0),
		Rotation = 0,
		ZIndex = 1,
		AutoLocalize = true,
		Visible = true,

		Padding = UDim.new(0, 0),
		HorizontalAlignment = Enum.HorizontalAlignment.Left,
		VerticalAlignment = Enum.VerticalAlignment.Top,
		SortOrder = Enum.SortOrder.LayoutOrder
	},

	ListBuilderTheme = {
		Name = "ListBuilder",
		Active = false,
		AnchorPoint = Vector2.new(0, 0),
		AutomaticSize = Enum.AutomaticSize.XY,
		BackgroundColor3 = Color3.new(0.905882, 0.905882, 0.905882),
		BackgroundTransparency = 1,
		BorderColor3 = Color3.fromRGB(27, 42, 53),
		BorderMode = Enum.BorderMode.Outline,
		BorderSizePixel = 1,
		LayoutOrder = 0,
		Selectable = false,
		Size = UDim2.new(0, 0, 0, 0),
		SizeConstraint = Enum.SizeConstraint.RelativeXY,
		ClipsDescendants = false,
		Position = UDim2.new(0, 0, 0, 0),
		Rotation = 0,
		ZIndex = 1,
		AutoLocalize = true,
		Visible = true,

		Padding = UDim.new(0, 0),
		HorizontalAlignment = Enum.HorizontalAlignment.Left,
		VerticalAlignment = Enum.VerticalAlignment.Top,
		SortOrder = Enum.SortOrder.LayoutOrder,
		FillDirection = Enum.FillDirection.Vertical
	},

	GridBuilderTheme = {
		Name = "GridBuilder",
		Active = false,
		AnchorPoint = Vector2.new(0, 0),
		AutomaticSize = Enum.AutomaticSize.None,
		BackgroundColor3 = Color3.new(0.905882, 0.905882, 0.905882),
		BackgroundTransparency = 1,
		BorderColor3 = Color3.fromRGB(27, 42, 53),
		BorderMode = Enum.BorderMode.Outline,
		BorderSizePixel = 1,
		LayoutOrder = 0,
		Selectable = false,
		Size = UDim2.new(1, 0, 1, 0),
		SizeConstraint = Enum.SizeConstraint.RelativeXY,
		ClipsDescendants = false,
		Position = UDim2.new(0, 0, 0, 0),
		Rotation = 0,
		ZIndex = 1,
		AutoLocalize = true,
		Visible = true,

		CellPadding = UDim2.new(0, 5, 0, 5),
		CellSize = UDim2.new(0, 50, 0, 50),
		HorizontalAlignment = Enum.HorizontalAlignment.Left,
		VerticalAlignment = Enum.VerticalAlignment.Top,
		SortOrder = Enum.SortOrder.LayoutOrder,
		StartCorner = Enum.StartCorner.TopLeft,
		FillDirection = Enum.FillDirection.Horizontal,
		FillDirectionMaxCells = 0
	},

	BaseTheme = {
		Active = false,
		AnchorPoint = Vector2.new(0, 0),
		AutomaticSize = Enum.AutomaticSize.None,
		BackgroundColor3 = Color3.new(0.905882, 0.905882, 0.905882),
		BackgroundTransparency = 1,
		BorderColor3 = Color3.fromRGB(27, 42, 53),
		BorderMode = Enum.BorderMode.Outline,
		BorderSizePixel = 1,
		LayoutOrder = 0,
		Selectable = false,
		Size = UDim2.new(0, 0, 0, 0),
		SizeConstraint = Enum.SizeConstraint.RelativeXY,
		ClipsDescendants = false,
		Position = UDim2.new(0, 0, 0, 0),
		Rotation = 0,
		ZIndex = 1,
		AutoLocalize = true,
		Visible = true
	},
	
	VerticalSpacerTheme = {
		Name = "VerticalSpacer",
		Active = false,
		AnchorPoint = Vector2.new(0, 0),
		AutomaticSize = Enum.AutomaticSize.None,
		BackgroundColor3 = Color3.new(0.905882, 0.905882, 0.905882),
		BackgroundTransparency = 1,
		BorderColor3 = Color3.fromRGB(27, 42, 53),
		BorderMode = Enum.BorderMode.Outline,
		BorderSizePixel = 1,
		LayoutOrder = 0,
		Selectable = false,
		Size = UDim2.new(0, 0, 0, 0),
		SizeConstraint = Enum.SizeConstraint.RelativeXY,
		ClipsDescendants = false,
		Position = UDim2.new(0, 0, 0, 0),
		Rotation = 0,
		ZIndex = 1,
		AutoLocalize = true,
		Visible = true
	},
	
	HorizontalSpacerTheme = {
		Name = "HorizontalSpacer",
		Active = false,
		AnchorPoint = Vector2.new(0, 0),
		AutomaticSize = Enum.AutomaticSize.None,
		BackgroundColor3 = Color3.new(0.905882, 0.905882, 0.905882),
		BackgroundTransparency = 1,
		BorderColor3 = Color3.fromRGB(27, 42, 53),
		BorderMode = Enum.BorderMode.Outline,
		BorderSizePixel = 1,
		LayoutOrder = 0,
		Selectable = false,
		Size = UDim2.new(0, 0, 0, 0),
		SizeConstraint = Enum.SizeConstraint.RelativeXY,
		ClipsDescendants = false,
		Position = UDim2.new(0, 0, 0, 0),
		Rotation = 0,
		ZIndex = 1,
		AutoLocalize = true,
		Visible = true
	}
}
Theme.__index = Theme

function Theme.new()
	local self = {}
	setmetatable(self, Theme)
	
	
	
	return self
end

return Theme
