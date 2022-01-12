#= #an oop mentality was to tackle the object!
function Account()

end
=#

module Account

Enum accountType = "Debit","Credit"

end

function increment(account, amount)
account =  account + amount

return account
end

function decrement(account, amount)
account = account - amount
end

function DebitAccount(date,account , amount)

end

function CreditAccount(date, account ,amount)


end





end
"""
transaction Module

each Transation Ideally must get written in 3 locations (at least ):
forming the
Accounting Triad
1. A Journal (daily journal of transactions) -of the self (entity)
2. A Debit Dr. Book
3. A Credit Cr. Book

Books can increase (+) or decrease (-) in value

But each increment in a book has another corresponding decrement

(each action has a reaction )

"""
module transaction
Id:: Int # Auto-Increments

function run()
DebitAmount(date, amount )
CreditAmount(date, amount)
end

function DebitAccount(date, amount)
#TODO: add data row of CreditAccount here
 #date Float64 amount
end

function CreditAccount(date,amount)
#TODO: add data row of DebitAccount here
# Date Float64 amount
end

function BalanceAccount()
#TODO: check if today is last day in month
bal_cd # @end of month Only - balance carried douwnd

end
function bal_cd()

end

end

transaction()
