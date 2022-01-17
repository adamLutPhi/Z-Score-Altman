#= #an oop mentality was to tackle the object!
function Account()

end



=#

module Account
    """
    the 4 main equations in Accounting:

    #Debit account operations (either Bullish up or (Dr a DrAccount)

    Dr DrAccount newBalance -means-> DrAccount = DrAccount + newBalance [DrAccount Accumulated]

    Cr DrAccount newBalance -means->   DrAccount = DrAccount - newBalance [DrAccount Utilized]

    Credit account operations (either Bullish (Up) or (Cr a CrAccount) ; or Bearish(Dn) (Dr a CrAccount)


    """
Enum accountOperation = "Debit(Dr)","Credit(Cr)"

function DrAccount(drAccount,accountOperation)
"""
like in electronics:
if different -> repulsive relationship (-)
if same (direction) -> amicable relationshipe (+)
Debit-Specific account operations
specifically:

Debit(Dr) DrAccount <==> DrAccount = DrAccount + Debit

Credit(Cr) DrAccount <==> DrAccount = DrAccount - Credit

"""

    if accountOperation isa "Debit"
        drAccount= drAccount + accountOperation
    end

    elseif accountOperation isa "Credit"

        crAccount = crAccount + accountOperation
    end

end

mutable struct drAccount(balance=bal, accountOperation="Debit")
    balance=bal
end

function increment(account, amount)
account =  account + amount

return account
end

function decrement(account, amount)
account = account - amount
end

function DebitAccount(date,drAccount , amount)
    """
    Debiting a DrAccount -> DrAccount is incremented

    """
drAccount
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
