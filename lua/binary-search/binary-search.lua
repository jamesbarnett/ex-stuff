local function binsearchhelper(low, high, array, target)
	if high < low then
		return -1
	end

	local index = math.floor((high + low) / 2)

	if array[index] == target then
		return index
	else
		if array[index] > target then
			high = index - 1
		end

		if array[index] < target then
			low = index + 1
		end
  end

	return binsearchhelper(low, high, array, target)
end

return function(array, target)
	if #array == 1 then
		if array[1] ~= target then
		  return -1
		else
			return 1
		end
	end

	if #array == 0 then
		return -1
	end
	local index = math.floor(#array / 2)
	local low, high = 1, #array

	if array[index] == target then
		return index - 1
  elseif array[index] > target then
		return binsearchhelper(low, index - 1, array, target)
	elseif array[index] < target then
		return binsearchhelper(index + 1, high, array, target)
	end

	return -1
end

