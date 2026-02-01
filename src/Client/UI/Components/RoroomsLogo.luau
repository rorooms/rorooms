local Rorooms = script.Parent.Parent.Parent.Parent.Parent
local OnyxUI = require(Rorooms.Parent.OnyxUI)
local Fusion = require(Rorooms.Parent.Fusion)
local Assets = require(Rorooms.SourceCode.Shared.Assets)

local Util = OnyxUI.Util
local Themer = OnyxUI.Themer

export type Props = {}

return function(Scope, Props: Props)
	local Scope = Fusion.innerScope(Scope, Fusion, OnyxUI.Components, Util)
	local Theme = Themer.Theme:now()

	return Scope:Image(Util.CombineProps(Props, {
		Name = "RoroomsLogo",
		BackgroundTransparency = 1,
		Image = Assets.Images.RoroomsLogo,
		Size = Scope:Computed(function(Use)
			return UDim2.fromOffset(0, Use(Theme.Spacing["1"]))
		end),
		AspectRatio = 1024 / 221,
		AspectType = Enum.AspectType.ScaleWithParentSize,
		DominantAxis = Enum.DominantAxis.Height,
	}))
end
