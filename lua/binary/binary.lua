local function to_decimal(input)
	local value = 0

	for i=1,#input do
    if input:sub(i, i) ~= '0' and input:sub(i, i) ~= '1' then
			return 0
		end
    value = value * 2 + tonumber(input:sub(i, i))
	end

	return value
end

local function to_decimal_for_fun(input)
	local lookup = { ["0"] = 0, ["1"] = 1 }

	local value = 0
  local shift = #input - 1
	for c in input:gmatch(".") do
    if c ~= '0' and c ~= '1' then return 0 end

		value = value | (lookup[c] << shift)
		shift = shift - 1
	end

	return value
end

return {
  to_decimal = to_decimal
}
