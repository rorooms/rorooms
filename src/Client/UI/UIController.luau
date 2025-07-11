local Players = game:GetService("Players")

local Rorooms = script.Parent.Parent.Parent.Parent
local Fusion = require(Rorooms.Parent.Fusion)
local States = require(Rorooms.SourceCode.Client.UI.States)
local OnyxUI = require(Rorooms.Parent.OnyxUI)
local OnyxUITheme = require(script.Parent.OnyxUITheme)
local Config = require(Rorooms.Config).Config

local Themer = OnyxUI.Themer

local DEFAULT_UIS = { "TopbarHUD", "PromptHUD" }

local function DeepCopyTable(Table)
	local Copy = {}
	for Key, Value in pairs(Table) do
		if type(Value) == "table" then
			Copy[Key] = DeepCopyTable(Value)
		else
			Copy[Key] = Value
		end
	end
	return Copy
end

local function ReconcileTable(Target, Template)
	for Key, Value in pairs(Template) do
		if type(Target[Key]) == "table" and type(Value) == "table" then
			ReconcileTable(Target[Key], Value)
		else
			if type(Value) == "table" then
				Target[Key] = DeepCopyTable(Value)
			else
				Target[Key] = Value
			end
		end
	end
end

local UIController = {
	Name = "UIController",

	Scope = Fusion.scoped(Fusion),
	XPMultiplierDropdownIcons = {},
}

function UIController:MountUI(Component)
	local PreferredTheme = OnyxUITheme

	ReconcileTable(OnyxUITheme, Config.Systems.UI.OnyxUITheme)

	PreferredTheme = OnyxUI.Themer.NewTheme(self.Scope, PreferredTheme)

	return Themer.Theme:is(PreferredTheme):during(function()
		local UIObject = Component(self.Scope, {
			Parent = self.RoroomsUI,
		})

		return UIObject
	end)
end

function UIController:KnitStart()
	States:Start()

	for _, GuiName in ipairs(DEFAULT_UIS) do
		local GuiModule = Rorooms.SourceCode.Client.UI.ScreenGuis:FindFirstChild(GuiName)
		if GuiModule then
			local Gui = require(GuiModule)
			self:MountUI(Gui)
		end
	end
end

UIController.RoroomsUI = UIController.Scope:New "ScreenGui" {
	Name = "RoroomsUI",
	Parent = Players.LocalPlayer:WaitForChild("PlayerGui"),
	ResetOnSpawn = false,
}

return UIController
