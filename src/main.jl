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
assets = abs(currentAssets)
liabilities = abs(currentLiabilities)
workingCapital = max(assets , abs(liabilities) - min( assets, liabilities )

captial  = calcCapital()

sales , earnings , retained_earnings =  calcsales_earnings()

x1, x2, x3, x4, x5 = altmanCoeffs()
return x1, x2, x3, x4, x5
end

#--- prompt for accounting trinity : Assets, liabilities, &  Capital
function main_3Accounts()
"""
prompts user to Directly enter the 3 accounts:
1. Capital
2. Assets
3. Liabilities

"""
capital = passmissing(parse).(Float64, input("$prompt 'capital'\n")))
liability  = passmissing(parse).abs(Float64, input("$prompt 'liability'\n")))
asset  = passmissing(parse).abs(input("$prompt 'asset'\n"))

return capital , liability,  asset

#--- (Total) Assets

function calcAssets()

"""
calculates Assets, from Total Capital  & Liabilties

Assets =  Capital - Liabilities

Q. what if Capital is negative? #non-sense
Q. what if Liabilities value is negative (more ) # rare #doesn't make much #sense

-Returns capital & liability [As is]
"""

capital = capital(totalCapital)
liability = liability(totalLiabilities)

return capital , liability

end

#---- calcAssets
function calcAssets(totalCapital, totalLiabilities)

"""
Calculates Assets from totalCapital, & TotalLiabilties
-takes their abstract values

Q. what if Capital is Negative? (below 0 ) ( doesn't make sense) #non-sense
Q. what if Liability is Negative? (more Accounts Recievables #busiess is Flourishing!)
#what makes sense?

"""

capital = capital(totalCapital) #TODO:check
    
liability = liability(totalLiabilities) #TODO: check

return capital , liability

#---- calcAssets
function calcAssets(totalCapital, totalLiabilities)

"""
Tampering with the accounts' values is  Crucial
i.e. do not change the accounts' negative values
(it is normal for accounts to have both negative & Positive values)
(requires further handling)

"""
capital = capital(totalCapital)  #  abs(capital)
      
liability = liability(totalLiabilities)  # abs(totalLiabilities)

return capital, liability
#----


# max(capital , liability)
#return max(capital, liability) - min(capital, liability)
return  capital - liability
end
#--- currentassets

currentAssets = currentassets() #input("please enter 'Current Assets' ")

function currentassets() # returns a (decimal) Number
    """
    Depreciation, nowadays, is 3 years, due to tech. Development
    Average Utilization in accounting books was 5 years
    but with Tech. Adcancement, it is safe to say it's more like 3 years on Average)
    thus a tech product (i.e. pc, workstation, server, ...)
    has a lifetime of 3 years, on Average

    Current Assets = Cash and Cash Equivalents
    1. Accounts Receivable [Ones owning you (in $ cash) ]
    2. Inventory [ (sellable) Product/ (marketable) Service]
    3. Marketable Securities
    4. Commercial Paper
    5. Treasury Notes
    6. Other Instruments

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

## --- calculates Working Capital (from currentLiabilities & current Capital)

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

#---workingCapital

function workingCapital(currentAssets,  currentLiabilities)
workingCapital =  calcCapital(currentAssets, currentLiabilities)
print("Working Capital is:  $workingCapital !")

return workingCapital
end

##  --- Accounting Ratios 
      
#= X1 = working Capital / total assets # Current Assets without current Liabilities / total Assets 
      
 TODO: [Working Capital needs to be shown]
      
- currentAssets: any asset that will
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

Reality:

TOTALAssets * (X1() +X2() +X3() +X4() +X5() )= workingCapital+ retainedEarnings + earnings
+ (Capital*totalAssets) /totalLiabilites + Sales

=# #Well-DONE! #<- double-check
      
#--- Altman
      
##current Assets

#function altman(totalAssets, sales )

function currentassets() #DONE
cassets= passmissing(parse).(Float64, input("please enter Current Assets "))
# null -double check 
return cassets
end

casset = currentassets()#can't cappen in real life - mak=yebe in a purple parallel Universe # user copys pastes from a company's brouchoure under inveestor-relations -  applicable 100%
end #correctly returns cAsserts ok

cliabilities = currentliabilities()

#--- current liabilities
function calcLiabilities(totalAssets,totalCapital)
"""
calculates Liabilities (from total Assets & total Capital)

      the Point: the company may Be 
we do NOT Know which is larger, assets or capital (nor which is negative or positive) - [ use min & max]

Hint: Q.  what if sign is major, more important than abstract

asset = abs(totalAssets); capital = abs(totalCapital);
return max(asset, capital) - min(asset, capital)

"""
asset = abs(totalAssets); capital = abs(totalCapital)
      
totalLiabilities = max(asset, capital) - min(asset, capital)

return totalLabilties

end

#--- current Liabilities
#notesPayable, accountsPayable, accruedExpense,unearnedRevenue, longtermDebt

function currentliabilities()
"""
Assumptions:
 -calculates current liabilities (it's the same for companies or personal accounts )
 -calculates different short-term liabilitues below 1 year through:

    1. Notes Payable
    2. Accounts Payable
    3. Accrued Expense
    4. Unearned Revenue
    5. Long-term Debt

- Returns: notesPayable , accountsPayable , accruedExpense , unearnedRevenue , longtermDebt

"""

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
    WorkingCapital():
    current Assets - current Liabilites

    workingCapital could be positive (assets > liabilities)
    or it could be Negative (liabilities > assets )

    """
#cassets > cliabilities ?
workingCapital = currentAssets() - currentLiabilities()
return workingCapital

end # returns workingCapital
=#

#--- z Handling
function z_handling(z) 
    if z < 1.18 # Below: Less `Assets` more `Liabilities` 
        decision="Distress"
    elseif z> 1.81 && z < 2.99
        decision="Gray Zone" 
    elseif z > 2.99 # Above: more `Assets`, less `Liabilities` -> more likely to be in the Safe Zone 
        decision="Safe Zone"
    else end
 return (z,decison)
end





#--- functions
 
    
function currentAssets() # includes many mini-functions
accountsReceivable() = passmissing(parse).(Float64, input( "$accountsReceivable" ) ) # 1. Accounts Receivable
inventory() = passmissing(parse).(Float64, input( " $inventory" ) ) # 2. Inventory 
Securities() =passmissing(parse).(Float64, input( " $Securities" ) ) # 3. Securities 
commercialPaper() = passmissing(parse).(Float64, input( " $commercialPaper" ) ) # 4. Commercial Paper 
treasuryNotes() = passmissing(parse).(Float64, input( " $TreasuryNotes" ) ) # 5. TreasuryNotes
other() = passmissing(parse).(Float64, input( " $other " ) ) #5. other Current Assets 
return currentasserts =  accountsReceivable,  inventory, Securities, commercialPaper,treasuryNotes,other
end

    
function calccurrentAssets() #args
 return    accountsReceivable() + inventory() + Securities() + commercialPaper() + treasuryNotes() + other()
end

    
function nonCurrentAssets() # working

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
Accounts
"""
currentliabs = currentliabilities() #done
noncurrentliabs = passmissing(parse).(Float64, input("$prompt ' non Current Liabilities'"))
return currentliabs , noncurrentliabs

end
    
#end  of Assets -----
function parsing() 
    return passmissing(parse).(Float64, input("$prompt ' a numeric variable '\n"))
    #return variable = passmissing(parse).(Float64, input('$prompt'))
end

function altmanCoeffs()
     
currentAssets, , non_CurrentAssets = calAssets() # 1. get current, non-Current Assets 
      
Assets = currentAssets + non_CurrentAssets # 2. sum them up, into Assets 
      
currentliabs , non_CurrentLiabs = calcLiabilities() # get Current, non-Current Liabilities 
      
Liabilities = currentliabs + noncurrentLiabs # sum them up, into Liabilities
      
z_handling(z)
      
return altmanCoeffs() 

end
