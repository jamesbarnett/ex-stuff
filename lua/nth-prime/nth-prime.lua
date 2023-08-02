local function isprime(x)
	local factor = 2
	while factor * factor <= x do
		if x % factor == 0 then
			return false
		end
		factor = factor + 1
	end
	return true
end

return function(n)
	assert(n > 0, "n must be a positive integer")
	if n == 1 then return 2 end

	local count, num = 1, 1
	while count < n do
		num = num + 2
		if isprime(num) then
			count = count + 1
		end
	end

	return num
end
