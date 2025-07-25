local ConfigUtils = {}

function ConfigUtils:IfString(Value: any): string?
	if typeof(Value) == "string" then
		return Value
	else
		return nil
	end
end

function ConfigUtils:IfNumber(Value: any): number?
	if typeof(Value) == "number" then
		return Value
	else
		return nil
	end
end

function ConfigUtils:GetColor(Instance: Instance)
	local LevelRequirement = Instance:GetAttribute("LevelRequirement")
	return (LevelRequirement and Color3.fromRGB(68, 55, 68))
end

function ConfigUtils:GetCategory(Instance: Instance): string?
	local LevelRequirement = Instance:GetAttribute("LevelRequirement")
	local GamepassRequirement = Instance:GetAttribute("GamepassRequirement")
	local Category = self:IfString(Instance:GetAttribute("Category"))

	if Category then
		return Category
	elseif LevelRequirement then
		return "Unlockable"
	elseif GamepassRequirement then
		return "Robux"
	else
		return nil
	end
end

function ConfigUtils:AnimationToEmote(Animation: Animation)
	return {
		DisplayName = Animation.Name,
		Animation = Animation,
		Emoji = self:IfString(Animation:GetAttribute("Emoji")),
		LevelRequirement = self:IfNumber(Animation:GetAttribute("LevelRequirement")),
		GamepassRequirement = Animation:GetAttribute("GamepassRequirement"),
		LabelIcon = self:IfString(Animation:GetAttribute("LabelIcon")),
		LabelText = self:IfString(Animation:GetAttribute("LabelText")),
		Color = self:GetColor(Animation),
		Category = self:GetCategory(Animation),
		AllowMovement = Animation:GetAttribute("AllowMovement"),
	}
end

function ConfigUtils:ToolToItem(Tool: Tool)
	return {
		DisplayName = Tool.Name,
		Tool = Tool,
		LevelRequirement = Tool:GetAttribute("LevelRequirement"),
		GamepassRequirement = Tool:GetAttribute("GamepassRequirement"),
		LabelIcon = Tool:GetAttribute("LabelIcon"),
		LabelText = Tool:GetAttribute("LabelText"),
		Color = self:GetColor(Tool),
		Category = self:GetCategory(Tool),
	}
end

function ConfigUtils:ConfigurationToRole(Configuration: Configuration)
	return {
		Name = Configuration.Name,
		Color = Configuration:GetAttribute("Color"),
		LayoutOrder = Configuration:GetAttribute("LayoutOrder"),
		LevelRequirement = Configuration:GetAttribute("LevelRequirement"),
		GamepassRequirement = Configuration:GetAttribute("GamepassRequirement"),
	}
end

function ConfigUtils:CompileEmotes(Folder: Folder)
	local Emotes = {}

	for _, EmoteAnimation in ipairs(Folder:GetChildren()) do
		local EmoteId = EmoteAnimation:GetAttribute("EmoteId") or EmoteAnimation.Name
		if typeof(EmoteId) == "string" then
			assert(Emotes[EmoteId] == nil, `Duplicate EmoteId {EmoteId} detected. Please use unique Ids.`)

			Emotes[EmoteId] = self:AnimationToEmote(EmoteAnimation)
		else
			assert(false, "EmoteIds must be of type string.")
		end
	end

	return Emotes
end

function ConfigUtils:CompileItems(Folder: Folder)
	local Items = {}

	for _, ItemTool in ipairs(Folder:GetChildren()) do
		local ItemId = ItemTool:GetAttribute("ItemId") or ItemTool.Name
		if typeof(ItemId) == "string" then
			assert(Items[ItemId] == nil, `Duplicate ItemId {ItemId} detected. Please use unique Ids.`)

			Items[ItemId] = self:ToolToItem(ItemTool)
		else
			assert(false, "ItemIds must be of type string.")
		end
	end

	return Items
end

function ConfigUtils:CompileRoles(Folder: Folder)
	local Roles = {}

	for _, RoleConfiguration in ipairs(Folder:GetChildren()) do
		local RoleId = RoleConfiguration:GetAttribute("RoleId") or RoleConfiguration.Name
		if typeof(RoleId) == "string" then
			assert(Roles[RoleId] == nil, `Duplicate RoleId {RoleId} detected. Please use unique Ids.`)

			Roles[RoleId] = self:ConfigurationToRole(RoleConfiguration)
		else
			assert(false, "RoleId must be of type string.")
		end
	end

	return Roles
end

function ConfigUtils:EnsureSoundGroup(SoundGroup: Instance?): SoundGroup
	if SoundGroup == nil then
		return Instance.new("SoundGroup")
	end
	if not SoundGroup:IsA("SoundGroup") then
		return Instance.new("SoundGroup")
	end

	return SoundGroup
end

function ConfigUtils:EnsureFolder(Name: string, Parent: Instance): Folder
	local Folder = Parent:FindFirstChild(Name)

	if Folder == nil then
		Folder = Instance.new("Folder")
	end

	return Folder
end

function ConfigUtils:GetAvatarEditorCallback(Parent: Instance): (() -> ())?
	local CallbackModule = Parent:FindFirstChild("AvatarEditorCallback")
	if CallbackModule and CallbackModule:IsA("ModuleScript") then
		return require(CallbackModule)
	else
		return nil
	end
end

return ConfigUtils
