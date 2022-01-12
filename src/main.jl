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

    return totalAssets - totalLiabilities  # Capital
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

function altmanCoeffs(totalAssets,totalLiabilities, workingCapital,
    retainedEarnings, earnings, sales,
      a1=1.2 , a2=1.4 , a3=3.3 , a4=0.6 ,a5 = 0.999 )
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

"""
returns Altman's Coefficients

returns x1, x2, x3, x4, x5

"""
workingCapital = calcWorkingCapital()

"""
calculates working capital from
1. Current Assets
2. Current Liabilities

"""
assets = abs(currentAssets); liabilities = abs(currentLiabilities)
workingCapital = max(assets , abs(liabilities) - min( assets, liabilities )

captial  = calcCapital()

sales , earnings , retained_earnings =  calcsales_earnings()

x1, x2, x3, x4, x5 = altmanCoeffs()
return x1, x2, x3, x4, x5
end

#--- prompt for accounting trinity : Assets, liabilities, &  Capital
function main_3Accounts()
"""
prompts user to Directly enter 3 accounts: Capital+ Assets+ Liabilities
"""
capital = passmissing(parse).(Float64, input("$prompt 'capital'\n")))
liability  = passmissing(parse).abs(Float64, input("$prompt 'liability'\n")))
asset  = passmissing(parse).abs(input("$prompt 'asset'\n"))

return capital , liability,  asset

#--- Assets
function calcAssets()

"""
calculates Total Capital & Liabilties

"""
capital = abs(capital(totalCapital))
liability = abs(liability(totalLiabilities))

return capital , liability

end

function calcAssets(totalCapital, totalLiabilities)

"""
Calculates Assets from totalCapital, & TotalLiabilties
-takes their abstract values

Q. what if Liability is Negative? (more liabilities incurred )
"""
capital = abs(capital(totalCapital))
liability = abs(liability(totalLiabilities))

capital = capital(totalCapital) = abs(capital)
liability = liability(totalLiabilities) abs(totalLiabilities)

# max(capital , liability)
#return max(capital, liability) - min(capital, liability)
return  capital - liability
end
#--- currentassets

currentAssets = currentassets() #input("please enter 'Current Assets' ")

function currentassets() # returns Number
    """
    Depreciation, nowadays, is 3 years, due to tech. Development, &
    major Quantum advancement (especially Quant Physics)
    Average Utilization in accounting books was 5 years
    but with Tech. Adcancement, it is safe to say it's more like 3 years on Average)
    thus a tech product (i.e. pc, workstation, server, ...)
    has a lifetime of 3 years, on Average

    Current Assets = Cash and Cash Equivalents
    1. Accounts Receivable [Ones owning you (in $ cash) ]
    2. Inventory [ (sellable) Product/ (marketable) Service]
    3. Marketable Securities
    4.  Commercial Paper
    5.  Treasury Notes
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

#--- currentLiabilities
function currentliabilities()
"""
Prompts the User to enter the following:
     1. notespayable

     2. accountspayable

     3. currentLiabs

-returns
"""

notesPayable , accountsPayable , accruedExpense , unearnedRevenue , longtermDebt = currentliabilities()
currentLiabilities = abs(notesPayable) + abs(accountsPayable) + abs(accruedExpense) + abs(unearnedRevenue) + abs(longtermDebt)

#---workingCapital Capital Capital

function workingCapital(currentAssets,  currentLiabilities) 
workingCapital =  calcCapital(currentAssets, currentLiabilities)
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
##current Assets

#function altman(totalAssets, sales )
function currentassets() #DONE
cassets= passmissing(parse).(Float64, input("please enter Current Assets "))
# null - nill chg to double
return cassets
end

casset = currentassets()#can't cappen in real life - mak=yebe in a purple parallel Universe # user copys pastes from a company's brouchoure under inveestor-relations -  applicable 100%
end #correctly returns cAsserts ok

cliabilities = currentliabilities()

#--- current liabilities
function calcLiabilities(totalAssets,totalCapital)
"""
here, we do NOT Know which is larger; Utilize Min, max
asset = abs(totalAssets); capital = abs(totalCapital);
return max(asset, capital) - min(asset, capital)

"""
asset = abs(totalAssets); capital = abs(totalCapital);
totalLiabilities = max(asset, capital) - min(asset, capital)
return totalLabilties

end

#--- current Liabilities
#notesPayable, accountsPayable, accruedExpense,unearnedRevenue, longtermDebt

function currentliabilities()
"""
Assumptions:
 -calculates current liabilities (it's the same for companies or personal accounts )
 - calculates different short-term liabilitues below 1 year through:

    1. Notes Payable
    2. Accounts Payable
    3. Accrued Expense
    4. Unearned Revenue
    5. Long-term Debt

- Returns: notesPayable , accountsPayable , accruedExpense , unearnedRevenue , longtermDebt

"""
#    print("this function calculates different short-term liabilitues below 1 year:\n1. Notes Payable\n2. Accounts Payable\n3. Accrued Expense\n4. Unearned Revenue\n5. Long-term Debt\n")
# prompt = "Please enter "
    notesPayable =  passmissing(parse).(Float64, input("$prompt 'Notes Payable'\n"))
    accountsPayable = passmissing(parse).(Float64, input("$prompt 'Accounts Payable'\n"))
    accruedExpense = passmissing(parse).(Float64, input("$prompt 'Accrued Expense'\n"))
    unearnedRevenue = passmissing(parse).(Float64, input("$prompt 'Unearned Revenue'\n"))
    longtermDebt = passmissing(parse).(Float64, input("$prompt 'Long-term Debt'\n"))

    return  notesPayable , accountsPayable , accruedExpense , unearnedRevenue , longtermDebt
end

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


#--- function
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
    return calccurrentAssets() , nonCurrentAssets()
end

function calcLiabilities()
"""
Acco
"""
currentliabs = currentliabilities() #done # omg my fave guitar : golden silver , soft & tender.. yes & no my true love s eye autumns comming  -- ive got to sing write my heart -focus
noncurrentliabs = passmissing(parse).(Float64, input("$prompt ' non Current Liabilities'"))
return currentliabs , noncurrentliabs

end
#end  of Assets -----
function parsing()#working
    return passmissing(parse).(Float64, input("$prompt ' a numeric variable '\n"))
    #return variable = passmissing(parse).(Float64, input('$prompt'))
end

function altmanCoeffs()
currentAssets, , non_CurrentAssets = calAssets()
Assets = currentAssets + non_CurrentAssets
currentliabs , non_CurrentLiabs = calcLiabilities()
Liabilities = currentliabs + noncurrentLiabs
z_handling(z)
return altmanCoeffs() # continue singing: round & round...  the burning circels , and then , the winter ....  # dislike please - golden sliver , all too soon - milk n honey, word & honeyyy# word * feels the cold weather]*

end
