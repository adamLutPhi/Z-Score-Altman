# TODO: Altman's z score - WIP

global message = "Please enter "

function altmanCoeffs(currentAssets,currentLiabilities,totalAssets,
    retainedEarnings,earnings,capital,totalLiabilities,sales )
 #finished currentliabilities

#=
non-current liabilities

current Assets prompt

magical Liabilities + Assets =  Capital

#total Assets prompt

#total Liabilities

=#

    return

end

#=
CheatSheet:

totalAssets goes into: X1, X2, X3, & X5
=#

print("welcome to Altman z-score Julia Edition!\n")
notespayable = input("please enter 'Notes Payable'")
accountspayable = input("please enter 'Accounts Payable'")

#currentLiabs = currentliabilities(
currentAssets = input("please enter 'Current Assets' ")
workingCapital = currentAssets - currentLiabs #requires currentLiabs
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
    """
    calculates different short-term liabilitues below 1 year
    """
# message = "Please enter "
    notesPayable = tryparse(Number, input("$message 'Notes Payable'\n"))
    accountsPayable = tryparse(Number, input("$message 'Accounts Payable'\n"))
    accruedExpense = tryparse(Number, input("$message 'Accrued Expense'\n"))
    unearnedRevenue = tryparse(Number, input("$message 'Unearned Revenue'\n"))
    longtermDebt = tryparse(Number, input("$message 'Long-term Debt'\n"))

    return  notesPayable + accountsPayable + accruedExpense + unearnedRevenue + longtermDebt
end


function currentassets() # returns Number
    """
    calculates short-term assets, below 1 year
    Current assets = Cash and Cash Equivalents +
    1. Accounts Receivable +
    2. Inventory +
    3. Marketable Securities
    4.  Commercial Paper,
    5.  Treasury Notes,
    6.  Other Instruments

    """

    accountsReceivable  = tryparse(Number, input("$message 'Accounts Receivable '\n"))
    inventory = tryparse(Number, input("$message 'Inventory'\n"))
    securities= tryparse(Number, input("$message 'Securities'\n"))
    commercialPaper = tryparse(Number, input("$message 'Commercial Paper'\n"))
    treasuryNotes = tryparse(Number, input("$message 'Treasury Notes'\n"))
    other = tryparse(Number, input("$message 'Other'\n"))
    return  accountsReceivable + inventory + securities + commercialPaper +
    treasuryNotes + other
end
#done currentAssets

workingCapital = curr



##sanity check & test later
function parsing(message1, message2 ) #i.e. Number & string

tryparse( typeof("$message1") , input("$message1 $message2 \n"))

else
    rethrow()

end

function oneLinerParsing(message1, message2)

 if isstructtype(typeof("$message1")) ? : rethrow()
end

#=

either

A:


liabilities =
current #done

-noncurrent
#prompt


TODO: Assets

current Assets =

Current assets = Cash and Cash Equivalents +
1. Accounts Receivable +
2. Inventory +
3. Marketable Securities
4.  Commercial Paper,
5.  Treasury notes,
6.  Other Instruments


=#


end

parsing()
function currentAssets ()
accountsReceivable = tryparse(Number , input( "$accountsReceivable  " ) )
inventory = tryparse(Number , input( "$inventory  " ) )
Securities = tryparse(Number , input( "$Securities  " ) )
commercialPaper = tryparse(Number , input( "$commercialPaper  " ) )
treasuryNotes = tryparse(Number , input( "$TreasuryNotes  " ) )
other = tryparse(Number , input( "$other " ) )
end



function parsing()
tryparse(Number, input("$messagevaue "))

end




function altmanCoeffs()

currentliabs = currentliabilities() #done
noncurrentliabs =  tryparse(input("please input ") )
return
end

altmanCoeffs()
