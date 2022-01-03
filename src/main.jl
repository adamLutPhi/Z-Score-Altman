# TODO: Altman's z score
using Missings;
using DataFrames;
global prompt = "Please enter "
global message = ""

##=#  program main

#totalAssets goes into: X1, X2, X3, & X5
function main()

print("hello World!\n")
print("welcome to Altman z-score - Julia Edition!\n")
totalAssets = passmissing(parse).(Float64, input("$prompt 'total Assets'\n"))
#totalCapital =  passmissing(parse).(Float64, input("$prompt 'total Capital'\n"))
totalLiabilities = passmissing(parse).(Float64, input("$prompt 'total Liabilities'\n"))

#TODO: complete program here ...
totalAssets = passmissing(parse).(Float64, input("$prompt 'total Assets'\n"))
#totalCapital =  passmissing(parse).(Float64, input("$prompt 'total Capital'\n"))
totalLiabilities = passmissing(parse).(Float64, input("$prompt 'total Liabilities'\n"))


z = calcCapital(totalAssets,totalLiabilities)
z_handling()
end

#--- Altman Coefficients a1, a2, ..., an


totalAssets = passmissing(parse).(Float64, input("$prompt 'total Assets'\n"))
totalCapital =  passmissing(parse).(Float64, input("$prompt 'total Capital'\n"))
totalLiabilities = passmissing(parse).(Float64, input("$prompt 'total Liabilities'\n"))

sales = passmissing(parse).(Float64, input("$prompt 'Sales'\n"))
earnings = passmissing(parse).(Float64, input("$prompt 'Earnings'\n"))
retainedEarnings = passmissing(parse).(Float64, input("$prompt 'Retained Earnings'\n"))

"""
Altman Coeffecient formula
changeable parameters
sums up Altman's z-score equation , as provided in the paper
"""
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


#---
#=
function altmanCoeffs(currentAssets,currentLiabilities,totalAssets,
    retainedEarnings,earnings,,totalLiabilities,sales )
=#
 #finished currentliabilities


# non-current liabilities

#current Assets prompt

# magical formula: Liabilities + Assets =

#total Assets prompt

#total Liabilities
#    return
#end

#---
#module findtheThird
#unused ##has potentialfor Extension
function calcCapital(totalAssets,totalLiabilities)
return totalAssets - totalLiabilities
end
#--- prompt for accounting trinity : Assets, liabilities, Capital
#capital Calculation
#TODO: #Done!
#"""user inserts  totalCapital"""
global capital = passmissing(parse).(Float64, input("$prompt 'capital'\n"))
global liability  = passmissing(parse).abs(Float64, input("$prompt 'liability'\n"))
global asset  = passmissing(parse).abs(input("$prompt 'asset'\n"))
#TODO: #Done!

function calcAssets(totalCapital, totalLiabilities)
capital = capital(totalCapital)
liability = liability(totalLiabilities) = abs(totalLiabilities)
#return max(capital, liability) - min(capital, liability)
return  capital - liability
end
#---
function calcLiabilities(totalAssets,totalCapital)
    #here, we do NOT Know which is larger; Utilize Min, max
    asset = abs(totalAssets); capital = abs(totalCapital);
    return max(asset, capital) - min(asset, capital)
end


#--- cliabilities cassets workingCapital = currentliabilities() +

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
    print("this function calculates different short-term liabilitues below 1 year:\n1. Notes Payable\n2. Accounts Payable\n3. Accrued Expense\n4. Unearned Revenue\n5. Long-term Debt\n")
# prompt = "Please enter "
    notesPayable =  passmissing(parse).(Float64, input("$prompt 'Notes Payable'\n"))
    accountsPayable = passmissing(parse).(Float64, input("$prompt 'Accounts Payable'\n"))
    accruedExpense = passmissing(parse).(Float64, input("$prompt 'Accrued Expense'\n"))
    unearnedRevenue = passmissing(parse).(Float64, input("$prompt 'Unearned Revenue'\n"))
    longtermDebt = passmissing(parse).(Float64, input("$prompt 'Long-term Debt'\n"))

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

    accountsReceivable  = passmissing(parse).(Float64, input("$prompt 'Accounts Receivable '\n"))
    inventory = passmissing(parse).(Float64, input("$prompt 'Inventory'\n"))
    securities= passmissing(parse).(Float64, input("$prompt 'Securities'\n"))
    commercialPaper = passmissing(parse).(Float64, input("$prompt 'Commercial Paper'\n"))
    treasuryNotes = passmissing(parse).(Float64, input("$prompt 'Treasury Notes'\n"))
    other = passmissing(parse).(Float64, input("$prompt 'Other'\n"))

    return  accountsReceivable + inventory + securities + commercialPaper +
            treasuryNotes + other
end
#done currentAssets

## --- calculates working capital from currentLiabilities & current
# notespayable = input("please enter 'Notes Payable'")
# accountspayable = input("please enter 'Accounts Payable'")

#currentLiabs = currentliabilities(
function calcWorkingCapital()

currentLiabs = currentliabilities()
currentAssets = currentassets() #input("please enter 'Current Assets' ")
workingCapital =  calcCapital(currentAssets, currentLiabs)   # currentAssets - currentLiabs #requires currentLiabs
print("Working Capital is:  $workingCapital !")

return workingCapital
end
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

Reality;

TOTALAssets * (X1+X2()+X3()+X4()+X5())= workingCapital+ retainedEarnings+ earnings
+Capital*totalAssets /totalLiabilites + Sales

=# #Well-DONE! #<- double-checked
#--- Altman
##currentAssets Block
#function altman(totalAssets, sales )
function currentassets() #on-demand working function
cassets   = typeparse(Number, input("please enter Current Assets "))#hard to believe sb knows current Assets #so fishy
# null - nill chg to double
return cassets
end
casset =  currentassets()#can't cappen in real life - mak=yebe in a purple parallel Universe

end #correctly returns cAsserts ok

cassets = currentassets() # q. from wher assets stem from (user input)
cliabilities = currentliabilities()

#function currentassets() = input()
#input() Well-done?! -- i'm nut sure

#=
#---
function WorkingCapital()
    """
    WorkingCapital() cadlag (continue a droite limite a gauche) -i.e. en: contine to right, limit on the left --i.e. non-negative process definition
    current Assets - current Liabilites

    workingCapital could be positive (assets > liabilities)
    or it could be Negative (liabilities > assets )

    """
#cassets > cliabilities ?
workingCapital = currentAssets() - currentLiabilities()
return workingCapital


end # returns workingCapital
=#

#--- z handling  finish the z

function z_handling(z) # when will you do? - YO like right NOW??? -- lemme check wikipedia first
    if z<1.1
        decision="Bankrupt";break;
    elseif z>1.1 & z<=2.6
        decision="Gray Zone";break;
    elseif z > 2.6 # CHECK num
        decision="good";break;
    elseif z > 2.99 # CHECK num
        decision="safe Zone";break;
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


module currentAssets() #hides lots of mini functions
accountsReceivable() = passmissing(parse).(Float64, input( "$accountsReceivable" ) )
inventory() = passmissing(parse).(Float64, input( " $inventory" ) )
Securities() =passmissing(parse).(Float64, input( " $Securities" ) )
commercialPaper() = passmissing(parse).(Float64, input( " $commercialPaper" ) )
treasuryNotes() = passmissing(parse).(Float64, input( " $TreasuryNotes" ) )
treasuryNotes() = passmissing(parse).(Float64, input( " $TreasuryNotes" ) )
other() = passmissing(parse).(Float64, input( " $other " ) )

function calccurrentAssets() #args)
 return    accountsReceivable() + inventory() + Securities()
+commercialPaper()+treasuryNotes() + other()
end
end


function nonCurrentAssets() # working #"nonCurrentAssets")

    return passmissing(parse).(Float64, input( " nonCurrentAssets" ) )
end

function calAssets()
calccurrentAssets() + nonCurrentAssets()
end

#end Assets -----




function parsing()#working
passmissing(parse).(Float64, input("$prompt "))

end


function altmanCoeffs()

    """
currentliabilities: liabilities (Debts) shorter than 1 Year
noncurrentliabs: LIABILITIES on the Long-term ; more than 1 Year
    """

currentliabs = currentliabilities() #done # omg my fave guitar : golden silver , soft & tender.. yes & no my true love s eye autumns comming  -- ive got to sing write my heart -focus
noncurrentliabs =  tryparse(:Number ,input("please input Current Liabilities") )
return # continue singing: round & round...  the burning circels , and then , the winter ....  # dislike please - golden sliver , all too soon - milk n honey, word & honeyyy# word * feels the cold weather]*
altmanCoeffs()


end
