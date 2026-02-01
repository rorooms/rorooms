local Rorooms = script.Parent.Parent.Parent.Parent.Parent
local OnyxUI = require(Rorooms.Parent.OnyxUI)
local Fusion = require(Rorooms.Parent.Fusion)
local Assets = require(Rorooms.SourceCode.Shared.Assets)

local Children = Fusion.Children

export type Props = {
	Level: Fusion.UsedAs<number>?,
}

return function(Scope: Fusion.Scope<any>, Props: Props)
	local Scope = Fusion.innerScope(Scope, Fusion, OnyxUI.Components, OnyxUI.Util)
	local Theme = OnyxUI.Themer.Theme:now()

	local Level = OnyxUI.Util.Fallback(Props.Level, 0)

	return Scope:Frame(OnyxUI.Util.CombineProps(Props, {
		Name = "LevelBadge",
		ListEnabled = true,
		ListFillDirection = Enum.FillDirection.Horizontal,
		ListPadding = Scope:Computed(function(Use)
			return UDim.new(0, Use(Theme.Spacing["0"]))
		end),
		ListVerticalAlignment = Enum.VerticalAlignment.Center,

		[Children] = {
			Scope:IconText {
				Content = Scope:Computed(function(Use)
					return { Assets.Icons.UserBadges.Level, Use(Level) }
				end),
				ContentSize = Theme.TextSize["1.25"],
				ListPadding = Scope:Computed(function(Use)
					return UDim.new(0, Use(Theme.Spacing["0.25"]))
				end),
			},
		},
	}))
end
