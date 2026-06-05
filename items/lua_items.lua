---@class CustomItemState
---@field reset fun(item: LuaItem)

---@class CustomItemStateConsumable: CustomItemState
---@field count integer
---@field increment fun(self: LuaItem, amt: integer)
---@field minCount integer
---@field maxCount integer
---@field mult integer
---@field multIndex? integer An array index used to map the multiplier value to an image

---@class CustomSaveData
---@field Name string
---@field Icon string
---@field ItemState CustomItemState

---@param self LuaItem
---@param code string
local function CanProvideCodeFunc(self, code)
	return code == self.Name
end
---@param self LuaItem
---@param code string
local function ProvidesCodeFunc(self, code)
	if CanProvideCodeFunc(self, code) then
		return 1
	end
	return 0
end
---@param self LuaItem
---@param code string
local function ProvidesConsumableFunc(self, code)
	return CanProvideCodeFunc(self, code) and self.ItemState.count or 0
end

---@param item LuaItem
local function UpdateConsumableOverlay(item)
	---@type CustomItemStateConsumable
	local itemState = item.ItemState
	item:SetOverlay(itemState.count ~= 0 and tostring(itemState.count) or "")
	item.IconMods = itemState.count == 0 and "@disabled" or ""
	item:SetOverlayColor(itemState.count == itemState.maxCount and "#0F0" or "#FFF")
end

---@param item LuaItem
local function ResetConsumable(item)
	(item.ItemState --[[@as CustomItemStateConsumable]]).count = 0
	UpdateConsumableOverlay(item)
end
---@param item LuaItem
---@param amt integer
local function IncrementConsumable(item, amt)
	---@type CustomItemStateConsumable
	local itemState = item.ItemState
	itemState.count = itemState.count + amt
	UpdateConsumableOverlay(item)
end
---@param self LuaItem
local function LeftClickConsumable(self)
	---@type CustomItemStateConsumable
	local itemState = self.ItemState
	local newCount = itemState.count + itemState.mult -- update count
	-- constrain to bounds
	if newCount > itemState.maxCount then newCount = itemState.maxCount
	elseif newCount < itemState.minCount then newCount = itemState.minCount end
	itemState.count = newCount
	UpdateConsumableOverlay(self)
end
---@param self LuaItem
local function RightClickConsumable(self)
	---@type CustomItemStateConsumable
	local itemState = self.ItemState
	local newCount = itemState.count - itemState.mult -- update count
	-- constrain to bounds
	if newCount > itemState.maxCount then newCount = itemState.maxCount
	elseif newCount < itemState.minCount then newCount = itemState.minCount end
	itemState.count = newCount
	UpdateConsumableOverlay(self)
end

---@param self LuaItem
---@return CustomSaveData
local function SaveFunc(self)
	return {
		Name = self.Name,
		Icon = self.Icon,
		ItemState = self.ItemState
	}
end

---@param self LuaItem
---@param data CustomSaveData
local function LoadFunc(self, data)
	if data ~= nil and self.Name == data.Name then
		self.Icon = ImageReference:FromPackRelativePath(data.Icon)
		self.ItemState = data.ItemState
		UpdateConsumableOverlay(self)
	end
end

---@type table<string, fun(self: LuaItem, code: string):integer>
local providesCodeFuncs = {
	consumable = ProvidesConsumableFunc
}

---@param name string
---@param type string
---@param img string
---@param state CustomItemState
---@param lClick? fun(self: LuaItem)
---@param rClick? fun(self: LuaItem)
---@param mClick? fun(self: LuaItem)
function CreateLuaItem(name, type, img, state, lClick, rClick, mClick)
	local self = ScriptHost:CreateLuaItem()
	self.Name = name
	self.Icon = ImageReference:FromPackRelativePath(img)
	self.ItemState = state or {}

	self.CanProvideCodeFunc = CanProvideCodeFunc
	self.OnLeftClickFunc = lClick --[[@as fun(self: LuaItem)]]
	self.OnRightClickFunc = rClick --[[@as fun(self: LuaItem)]]
	self.OnMiddleClickFunc = mClick --[[@as fun(self: LuaItem)]]
	self.ProvidesCodeFunc = providesCodeFuncs[type]
	self.SaveFunc = SaveFunc
	self.LoadFunc = LoadFunc
	return self
end

CreateLuaItem(
	RupeeCount,
	"images/items/rupee5.png",
	"consumable",
	{reset = ResetConsumable, count = 0, increment = IncrementConsumable, minCount = 0, maxCount = 999, mult = 5, multIndex = 2} --[[@as CustomItemStateConsumable]],
	LeftClickConsumable,
	RightClickConsumable,
	function(self)
		local values = {
			{val = 1, img = "images/items/rupee1.png"},
			{val = 5, img = "images/items/rupee5.png"},
			{val = 10, img = "images/items/rupee10.png"},
			{val = 20, img = "images/items/rupee20.png"},
			{val = 50, img = "images/items/rupee50.png"},
			{val = 100, img = "images/items/rupee100.png"},
			{val = 200, img = "images/items/rupee200.png"}
		}
		---@type CustomItemStateConsumable
		local itemState = self.ItemState
		local multIndex = itemState.multIndex + 1
		if multIndex > #values then multIndex = 1 end -- constrain to values array
		itemState.multIndex = multIndex
		itemState.mult = values[multIndex].val
		self.Icon = ImageReference:FromPackRelativePath(values[multIndex].img)
	end
)
