# TODO: Altman's z score


function altmanCoeffs(currentAssets,currentLiabilities,totalAssets,
    retainedEarnings,earnings,capital,totalLiabilities,sales )

#=
CheatSheet:

totalAssets goes into: X1, X2, X3
=#
print("welcome to Altman z-score Julia Edition!\n")
notespayable = input("please enter 'Notes Payable'")
accountspayable = input("please enter 'Accounts Payable'")

currentLiabs = currentliabilities(notespayable,accountspayable,)
currentAssets = input("please enter 'Current Assets' ")
workingCapital = currentAssets - currentLiabs
print("Working Capital is: $ $workingCapital !")


#= X1 = working Capital / total assets
needs to be shown
currentAssets: any asset that will
provide an economic value for or
 within one year
 =#

X1 = workingCapital / totalAssets

# X2 = retained earnings / total assets

X2 = retainedEarnings / totalAssets

# X3 = earnings / total assets
X3 = earnings / totalAssets

# X4 = equity(capital) / total liabilities

X4 = capital / totalLiabilities

# X5 = sales / total assets

X5 = sales / totalAssets

return X1,X2,X3,X4,X5
end

#notesPayable, accountsPayable, accruedExpense,unearnedRevenue, longtermDebt
function currentliabilities()
message = "please enter "
    notesPayable =  input("$message 'Notes Payable'\n")
    accountsPayable = input("$message 'accounts Payable'\n")
    accruedExpense = input("$message 'Accrued Expense'\n")
    unearnedRevenue = input("$message 'Unearned Revenue'\n")
    longtermDebt = input("$message 'Long-term Debt'\n")
    return  notesPayable + accountsPayable + accruedExpense + unearnedRevenue + longtermDebt
end

currentliabs = currentliabilities()
altmanCoeffs()
