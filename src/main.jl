# TODO: Altman's z score - WIP
global prompt = "Please enter "
global message = ""

##=#  program main
#CheatSheet:

#totalAssets goes into: X1, X2, X3, & X5
function main()

print("hello World!\n")
print("welcome to Altman z-score - Julia Edition!\n")

end

#--- Altman Coefficients a1, a2, ..., an
function altmanCoeffs(a1=1.2 , a2=1.4 , a3=3.3 , a4=0.6 ,a5 = 0.999 )
    return z = a1 * X1(totalAssets,workingCapital)
    +a2 * X2(totalAssets,retainedEarnings)
    + a3 * X3(totalAssets,earnings)
    + a4 * X4(capital, totalLiabilities) = capital / totalLiabilities
    + a5 * X5(sales, totalAssets)

#---
# TODO:
#=
function altmanCoeffs(currentAssets,currentLiabilities,totalAssets,
    retainedEarnings,earnings,capital,totalLiabilities,sales )
=#
 #finished currentliabilities


# non-current liabilities

#current Assets prompt

# magical formula: Liabilities + Assets =  Capital

#total Assets prompt

#total Liabilities
#    return

#end
## ---
module findtheThird

function calcCapital(totalAssets,totalLiabilities)
asset = abs(totalAssets) ; liability = abs(totalLiabilites)
#return max(asset, liability) - min(asset, liability)
return asset - liability
end
#---
#capital Calculation
#TODO: #Done!
#"""user inserts  totalCapital"""
global capital(totalCapital) = abs(totalCapital);
global liability(totalLiabilities) = abs(totalLiabilities)
#TODO: #Done!
function calcAssets(totalCapital, totalLiabilities)
capital = capital(totalCapital)
liability = liability(totalLiabilities) = abs(totalLiabilities)
#return max(capital, liability) - min(capital, liability)
return capital - liability
end
#---
function calcLiabilities(totalAssets,totalCapital)
    #here, we do NOT Know which is larger; Utilize Min, max
    asset = abs(totalAssets); capital = abs(totalCapital);
    return max(asset, capital) - min(asset, capital)
end


#---

#notesPayable, accountsPayable, accruedExpense,unearnedRevenue, longtermDebt
function currentliabilities()
    """
    calculates different short-term liabilitues below 1 year:
    1. Notes Payable
    2. Accounts Payable
    3. Accrued Expense
    4. Unearned Revenue
    5. Long-term Debt
    """
    print("this function calculates different short-term liabilitues below 1 year:\n1. Notes Payable\n
2. Accounts Payable\n3. Accrued Expense\n4. Unearned Revenue\n5. Long-term Debt\n")
# prompt = "Please enter "
    notesPayable = tryparse(Number, input("$prompt 'Notes Payable'\n"))
    accountsPayable = tryparse(Number, input("$prompt 'Accounts Payable'\n"))
    accruedExpense = tryparse(Number, input("$prompt 'Accrued Expense'\n"))
    unearnedRevenue = tryparse(Number, input("$prompt 'Unearned Revenue'\n"))
    longtermDebt = tryparse(Number, input("$prompt 'Long-term Debt'\n"))

    return  notesPayable + accountsPayable + accruedExpense + unearnedRevenue + longtermDebt
end # returns currentLiabilities :: Number

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

    accountsReceivable  = tryparse(Number, input("$prompt 'Accounts Receivable '\n"))
    inventory = tryparse(Number, input("$prompt 'Inventory'\n"))
    securities= tryparse(Number, input("$prompt 'Securities'\n"))
    commercialPaper = tryparse(Number, input("$prompt 'Commercial Paper'\n"))
    treasuryNotes = tryparse(Number, input("$prompt 'Treasury Notes'\n"))
    other = tryparse(Number, input("$prompt 'Other'\n"))
    return  accountsReceivable + inventory + securities + commercialPaper +
            treasuryNotes + other
end
#done currentAssets

## ---
# notespayable = input("please enter 'Notes Payable'")
# accountspayable = input("please enter 'Accounts Payable'")

#currentLiabs = currentliabilities(
 currentLiabs = currentliabilities()
currentAssets = input("please enter 'Current Assets' ")
workingCapital =  calcCapital(currentAssets, currentLiabs)   # currentAssets - currentLiabs #requires currentLiabs
print("Working Capital is:  $workingCapital !")

##  ---
#= X1 = working Capital / total assets
 TODO: working Capital needs to be shown
currentAssets: any asset that will
provide an economic value for or
 within one year
 =#
#=
X1 = workingCapital / totalAssets

# X2 = retained earnings / total assets

X2 = retainedEarnings / totalAssets

# X3 = earnings / total assets
X3 = earnings / totalAssets

# X4 = equity(capital) / total liabilities

X4 = capital / totalLiabilities

# X5 = sales / total assets

X5 = sales / totalAssets

return X1,X2,X3,X4,X5  - #wishful thinking
end

=# #Well-DONE! #<- double-checked
#--- Altman
##Unsure Block ...
#function altman(totalAssets, sales )
function currentassets() #on-demand working function
cassets   = typeparse(:Number, input("please enter Current Assets "))
# null - nill chg to double
return cassets

casset =  currentasset()

end #correctly returns cAsserts ok

cassets = currentassets() # q. from wher assets stem from (user input)
cliabilities = currentliabilities()

#function currentassets() = input()
#input() Well-done?! -- i'm nut sure
#--- #user
function currentWorkingCapital()
cassets > cliabilities ? workingCapital =
cassets - cliabilities  : workingCapital isa nothing
#returns working Capital
return workingCapital

end # returns workingCapital


#--- z handling #TODO:

function z_handling(z)

    if z > 2.99

        return
end

#--- Compact "assignment form":
#TODO:
X1(totalAssets,workingCapital) = workingCapital / totalAssets

# X2 = retained earnings / total assets

X2(totalAssets,retainedEarnings) = retainedEarnings / totalAssets

# X3 = earnings / total assets
X3(totalAssets,earnings) = earnings / totalAssets

# X4 = equity(capital) / total liabilities

X4(capital, totalLiabilities) = capital / totalLiabilities

# X5 = sales / total assets

X5(sales, totalAssets) = sales / totalAssets

####add here





##sanity check & test later
#= function parsing(message1, message2 ) #i.e. Number & string

if isnumeric(
     tryparse( typeof("$message1") , input("$message1 $message2 \n"))
)
else
    throw() #rethrow()

end
end
=#
#---Resear #TODO:Testing & Research
#done writing, needs testing

#function oneLinerParsing(message1, prompt2)
# if isstructtype(typeof("$message1")) ? : rethrow()
#end

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

# parsing()


function currentAssets() #hides lots of mini functions
accountsReceivable() = tryparse(Number , input( "$accountsReceivable" ) )
inventory(:Number) = tryparse(Number , input( " $inventory" ) )
Securities(:Number) = tryparse(Number , input( " $Securities" ) )
commercialPaper(:Number) = tryparse(Number , input( " $commercialPaper" ) )
treasuryNotes(:Number) = tryparse(Number , input( " $TreasuryNotes" ) )
treasuryNotes = tryparse(Number , input( " $TreasuryNotes" ) )
other = tryparse(Number , input( " $other " ) )
end



function parsing()
tryparse(Number, input("$promptvaue "))

end


function altmanCoeffs()

currentliabs = currentliabilities() #done
noncurrentliabs =  tryparse(:Number ,input("please input Current Liabilities") )
return
end

altmanCoeffs()


end
