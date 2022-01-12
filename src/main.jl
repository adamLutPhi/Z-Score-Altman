# TODO: add paper credits...
using Missings;
using DataFrames;
global prompt = "Please enter "
global message = ""

"""

"""
##=#  program main

#totalAssets goes into: X1, X2, X3, & X5
function main()
"""
General notes:

Business timespan = 3 years in some books-due to rapid technological (change) factor
                  = 5 years in other older books
- the effective time Of Utilizing a particular Asset
Whereaas each Asset could be used
In other words, every asset has its own Utility Function (based on 'Economic Factors')

"""
print("hello World!\n")
print("welcome to Altman z-score - Julia Edition!\n")

#TODO: refactor complete program here ...
totalAssets = passmissing(parse).(Float64, input("$prompt 'total Assets'\n"))
totalCapital =  passmissing(parse).(Float64, input("$prompt 'total Capital'\n"))
totalLiabilities = passmissing(parse).(Float64, input("$prompt 'total Liabilities'\n"))

sales, earnings, retainedEarnings = calcsales_earnings()
#TODO: calculate z
z = calcCapital(totalAssets,totalLiabilities)
score = z_handling(z)

#TODO: decision making (i.e. what to do about it )

resutlt = z_result(score)

end

#--- Result: Decision making: based on paper
"""
function z_result(score)

    comments on the score [based on the mentioned paper] (due to the following):
    1. z-score < 1.18 -then-> (Most likely to be ) Bankrupt!
    2. 1.81 < z-score < 2.99 -then-> "Stable #ok, (in between) #unsure Region!!
    3.  z-score > 2.99 -then-> "Safe Zone"

    me: note: however, how Sure is "Sure" [That is (the Real) Question!]
"""
function z_result(score)
    decision = ""

        if score < 1.18
            decision= "likely to be bankrupt"
        elseif 1.81< score < 2.99
            decision="Stable"
        elseif score > 2.99
            decision="Safe Zone"
        else end
     return score,decison #(score,decison)

end
#--- Altman Coefficients a1, a2, ..., an
#assets : read assets
function calcCapital()

totalAssets = passmissing(parse).(Float64, input("$prompt 'total Assets'\n"))
#totalCapital =  passmissing(parse).(Float64, input("$prompt 'total Capital'\n"))
totalLiabilities = passmissing(parse).(Float64, input("$prompt 'total Liabilities'\n"))

    return totalAssets - TotalLiabilities  # Capital
end

function calcsales_earnings()
"""
    Prompts user to enter: Sales,  Earnings  & Retained Earnings  (of a company)
"""
sales = passmissing(parse).(Float64, input("$prompt 'Sales'\n"))
earnings = passmissing(parse).(Float64, input("$prompt 'Earnings'\n"))
retainedEarnings = passmissing(parse).(Float64, input("$prompt 'Retained Earnings'\n"))

    return  (sales, earnings, retainedEarnings) #(sales, earnings, retainedEarnings)
end

#--- Altman Coefficients a1, a2, ..., an

function altmanCoeffs(a1=1.2 , a2=1.4 , a3=3.3 , a4=0.6 ,a5 = 0.999 )
"""
Altman Coeffecient formula
parameters: are changeable, as requeired
sums up Altman's z-score equation (as provided in the enclosed academic paper)
"""
    return z = a1 * X1(totalAssets,workingCapital) #req:working capiyal
    +a2 * X2(totalAssets,retainedEarnings)
    + a3 * X3(totalAssets,earnings)
    + a4 * X4(capital, totalLiabilities) # X4 = capital / totalLiabilities
    + a5 * X5(sales, totalAssets)

end

#--- altoman Coefficients
# DONE  # me: ready to serve (on a sliver platter )
function altmanCoeffs(currentAssets,currentLiabilities,totalAssets,
    retainedEarnings,earnings,totalLiabilities,sales )
#...
workingCapital = calcWorkingCapital()
captial  = calcCapital()

sales , earnings , retained_earnings =  calcsales_earnings()

x1, x2, x3, x4, x5 = altmanCoeffs()
end
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
capital = capital(totalCapital) = abs(capital)
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
#    print("this function calculates different short-term liabilitues below 1 year:\n1. Notes Payable\n2. Accounts Payable\n3. Accrued Expense\n4. Unearned Revenue\n5. Long-term Debt\n")
# prompt = "Please enter "
    notesPayable =  passmissing(parse).(Float64, input("$prompt 'Notes Payable'\n"))
    accountsPayable = passmissing(parse).(Float64, input("$prompt 'Accounts Payable'\n"))
    accruedExpense = passmissing(parse).(Float64, input("$prompt 'Accrued Expense'\n"))
    unearnedRevenue = passmissing(parse).(Float64, input("$prompt 'Unearned Revenue'\n"))
    longtermDebt = passmissing(parse).(Float64, input("$prompt 'Long-term Debt'\n"))

    return  notesPayable + accountsPayable + accruedExpense + unearnedRevenue + longtermDebt
end

function currentassets() # returns Number
    """
    , for Tech. products)
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

## --- calculates working capital (from currentLiabilities & current Capital)
function calcWorkingCapital()
"""
Prompts the User to enter the following:
     1. notespayable

     2. accountspayable

     3. currentLiabs

"""
currentLiabs = currentliabilities()
currentAssets = currentassets() #input("please enter 'Current Assets' ")
workingCapital =  calcCapital(currentAssets, currentLiabs)   # currentAssets - currentLiabs #requires currentLiabs
print("Working Capital is:  $workingCapital !")

return workingCapital
end

# ---

#function A## sanity checked!

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
function currentassets() #DONE
cassets= passmissing(parse).(Float64, input("please enter Current Assets "))
# null - nill chg to double
return cassets
end

casset = currentassets()#can't cappen in real life - mak=yebe in a purple parallel Universe # user copys pastes from a company's brouchoure under inveestor-relations -  applicable 100%
end #correctly returns cAsserts ok
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

#--- z handling  finish the z --#Done!
function z_handling(z) # when will you do? - YO like right NOW??? -- lemme check wikipedia first

    if z < 1.18
        decision="Distress"
    elseif z> 1.81 && z < 2.99
        decision="Gray Zone"
    elseif z > 2.99
        decision="Safe Zone"
    else end
 return (z,decison)
end


#--- Altman Coefficients  Compact "assignment form": X1...X5
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

#--- module
function currentAssets() #hides lots of mini functions
accountsReceivable() = passmissing(parse).(Float64, input( "$accountsReceivable" ) )
inventory() = passmissing(parse).(Float64, input( " $inventory" ) )
Securities() =passmissing(parse).(Float64, input( " $Securities" ) )
commercialPaper() = passmissing(parse).(Float64, input( " $commercialPaper" ) )
treasuryNotes() = passmissing(parse).(Float64, input( " $TreasuryNotes" ) )
other() = passmissing(parse).(Float64, input( " $other " ) )
return currentasserts =  accountsReceivable,  inventory, Securities, commercialPaper,treasuryNotes,other
end

function calccurrentAssets() #args)
 return    accountsReceivable() + inventory() + Securities() +commercialPaper()+treasuryNotes() + other()
end
#end
function nonCurrentAssets() # working #"nonCurrentAssets")

    return passmissing(parse).(Float64, input( " nonCurrentAssets" ) )
end

function calAssets()
    """
    Assets  = Current (less than the  bussiness's set timespan)+ non-current Asset (more he  bussiness's set timespan  )
    """
    return calccurrentAssets() + nonCurrentAssets()
end

#end  of Assets -----
function parsing()#working
    return passmissing(parse).(Float64, input("$prompt ' a numeric variable '\n"))
    #return variable = passmissing(parse).(Float64, input('$prompt'))
end

function altmanCoeffs()
"""
currentliabilities: liabilities (Debts) shorter than 1 Year
noncurrentliabs: LIABILITIES on the Long-term ; more than 1 Year
"""
currentliabs = currentliabilities() #done # omg my fave guitar : golden silver , soft & tender.. yes & no my true love s eye autumns comming  -- ive got to sing write my heart -focus
noncurrentliabs =   tryparse(:Number ,input("please input Current Liabilities") )
    return altmanCoeffs() # continue singing: round & round...  the burning circels , and then , the winter ....  # dislike please - golden sliver , all too soon - milk n honey, word & honeyyy# word * feels the cold weather]*

end
