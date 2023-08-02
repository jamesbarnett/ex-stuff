local BankAccount = {}

function BankAccount:new()
	local object = { _balance = 0, _isclosed = false, }
	return setmetatable(object, { __index = self })
end

function BankAccount:deposit(amount)
	assert(not self._isclosed, "Cannot deposit to closed account")
	assert(amount > 0, "Cannot deposit negative amounts")
	self._balance = self._balance + amount
end

function BankAccount:withdraw(amount)
	assert(not self._isclosed, "Cannot withdraw from closed account")
	assert(amount > 0, "Cannot withdraw negative amounts")
	assert(amount <= self._balance)
	self._balance = self._balance - amount
end

function BankAccount:balance()
	return self._balance
end

function BankAccount:close()
	self._isclosed = true
end

return BankAccount
