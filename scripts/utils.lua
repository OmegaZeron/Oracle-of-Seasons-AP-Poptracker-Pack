---return a prettified string of the table
---@param depth? integer
---@return string
function DumpTable(obj, depth)
	if type(obj) == "table" then
		depth = depth or 0

		local tabs = ('    '):rep(depth)
		local tabs2 = ('    '):rep(depth + 1)
		local s = '{\n'
		for k, v in pairs(obj) do
			if type(k) ~= 'number' then
				k = '"' .. k .. '"'
			end
			s = s .. tabs2 .. '[' .. k .. '] = ' .. DumpTable(v, depth + 1) .. ',\n'
		end
		return s .. tabs .. '}'
	end
	return tostring(obj)
end

---checks if an array contains the given value
---@param tbl table
function TableContains(tbl, value)
	if type(tbl) ~= "table" then return false end

	for i = 1, #tbl do
		if tbl[i] == value then
			return true
		end
	end
	return false
end

---counts and returns the length of a table
---@param tbl table
---@return integer
function TableLen(tbl)
	if type(tbl) ~= "table" then return 0 end

	local num = 0
	for _, _ in pairs(tbl) do
		num = num + 1
	end
	return num
end

---split a string using the given separator, returning the split strings
---@param seperator? string %s
---@return string[]
function string--[[@as string]]:split(seperator)
	seperator = seperator or "%s"

	local t = {}
	for str in string.gmatch(self, "([^"..seperator.."]+)") do
		table.insert(t, str)
	end
	return t
end
