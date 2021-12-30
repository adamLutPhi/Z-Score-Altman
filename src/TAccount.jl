
abstract function Account()

end
function DebitAccount(date , amount)

end

function CreditAccount(date, amount)




end
"""
transaction Module

each Transation Ideally must get written in 3 locations (at least ):
forming the 
Accounting Triad
1. A Journal (daily journal of transactions) -of the self (entity)
2. A Debit Dr. Book
3. A Credit Cr. Book

Books can increase + or decrease in value -

but each increment in a book has a

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
