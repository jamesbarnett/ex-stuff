return function(s)
  local used = {}

  for c in s:lower():gmatch('%a') do
    if used[c] ~= nil then
      return false
    else
      used[c] = true
    end
  end

  return true
end
