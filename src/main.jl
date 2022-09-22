# credits :
#using Missings;
#using DataFrames;
global prompt = "Please enter "
global message = "ERROR, Please check input "
global decimalMsg =  "Input is Null , please insert a decimal value "
global msg = "ERROR: Unexpected Error - Please recheck input: "
"""

"""
##=#  program main

#totalAssets goes into: X1, X2, X3, & X5


# divide by


# Decimal value

""" rounds to the 2nd decimal digit
"""
function DecimalVal(_string,d=2)
    _decimal = nothing
    if isNULL(_string) == true
        println("_string value is NULL, please check input,& try again later")
    elseif isNULL(_string) == false
        _decimal = round(tryparse(Float64,_string)::Float64, d) #digits=d)
        return _decimal
    end
end



#--- string functions

function isEmpty(_string)
    try

        if _string == ""
            return true
        elseif _string !=""
            return false
        else
            @error msg + exception=(UnExpectedError, catch_backtrace())

        end

    catch UnExpectedError
        @error msg +  exception = (UnExpectedError, catch_backtrace())

    end
end

function isNULL(_string)
    try
        if isnull(_string) == true
            return true
        elseif isnull(_string) == false
            return false
        else
            #@error msg + exception=(UnExpectedError, catch_backtrace())
            throw(UnExpectedError)
        end
    catch UnExpectedError
        @error msg  , exception = (UnExpectedError, catch_backtrace())

     end
end


"""
returns the rational part of numerator & denominator

```
inputs:
    * **numerator**
    * **denominator**
```

```
outputs:
    * **result**: a rational result of dividing numerator, over denominator
```

"""
function divideBy(numerator, denominator)

    #check inputs not null
    result = nothing
    if isNULL(numerator) == false && isNULL(denominator) ==false #&&\
        if isEmpty(numerator) ==false && isEmpty(denominator) == false
            #result = numerator //
            result = numerator // denominator
        end
    end
    return result
    #end
end
#=
"""
reads input from user
"""
=#
#=
function readString(stringInput, decimalsAllowed=2)

    _decimal= 0.0
    try
        _decimal =tryparse(Float64, Input(" $prompt " + DecimalVal(stringInput,decimalsAllowed)+"\n"))

        if isnull(_decimal) == true
            println(" "+decimalMsg+" ")

        elseif isnull(_decimal) == false
            return _decimal
        else
            throw(UnExpectedError)
        end
    catch UnExpectedError
        @error "ERROR: Please recheck input: ", exception=(UnExpectedError, catch_backtrace())


     end

end
=#
#line doesn't Debug (whether with input or Input as a function name)
# use: readline -> SystemError: opening file "Please enter  ": No such file or directory
#input: input not defined
#import io.* # input not found
#Takeaway:
# Communication is `half-duplex`: i.e. one-way
# Either write, or read commands are possible (but not both)
"""
source:https://discourse.julialang.org/t/string-as-a-variable-name/2195/6
"""
#=
macro string_as_varname_macro(s::AbstractString, v::Any)
	s = Symbol(s) # <----
	esc(:($s = $v))
end
=#
#credits to: @NickNack on discourse
function string_as_varname(s::AbstractString,v::Any)
         s=Symbol(s)
         @eval (($s) = ($v))
end

function assignStingtoVal(_string)
    varvalue = tryparse(Float64,_string)
    var = string_as_varname(_string,varvalue)# now: _string = varvalue(_string here)

    return var #(var, varvalue)
end

function ReadLine(_string)
    # move to the outside scope
    #var = string_as_varname(_string) #1. make var as string
    #var = _string # 1. Assign string to this var
    println(" $prompt $var") # 3. concatenate with  var's value
    var = readline() # let user input
    var = assignStingtoVal(_string)

    return var # return the var

end

# redoing Readline here:
stringInput = "stringInput"
println(" $prompt $stringInput")
stringInput =  readline() #tryparse(Float64, input("$prompt " + DecimalVal(stringInput,2)+"\n"))
var1 =  assignStingtoVal(stringInput) #string_as_varname(stringInput)

#_decimal = + DecimalVal(stringInput,2)
function readString(stringInput)
    _decimal= 0.0
    try
        _decimal =tryparse(Float64, input("$prompt " + DecimalVal(stringInput,2)+"\n")) #Input("$prompt " + DecimalVal(stringInput,2)+"\n"))

        if isnull(_decimal) == true
            println(" "+decimalMsg+" ")

        elseif isnull(_decimal) == false
            return _decimal
        else
            throw(UnExpectedError)
        end
    catch UnExpectedError
        @error "ERROR: Please recheck input: ", exception=(UnExpectedError, catch_backtrace())


     end
end
#----
#TODO: refactor complete program here ...
"""
totalAssets = passmissing(readString)
totalCapital =  passmissing(readString).
totalLiabilities = passmissing(readString).

sales, earnings, retainedEarnings = calcsales_earnings()
#TODO: calculate z
z = calcCapital(totalAssets,totalLiabilities)
score = z_handling(z)

#TODO: decision making (i.e. what to do about it )

result = z_result(score)

end
"""

#--- Result: Decision making: based on paper
"""
function z_result(score)

    comments on the score [based on the mentioned paper] (due to the following):
    1. z-score < 1.18 -then-> (Most likely to be ) Bankrupt!
    2. 1.81 < z-score < 2.99 -then-> "Stable #ok, (in between) #unsure Region!!
    3.  z-score > 2.99 -then-> "Safe Zone"

    me: note: however, how Sure is "Sure" [That is (the Real) Question!]
"""
function getZ_decision(score)
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

totalAssets =  readString("total Assets") #passmissing(parse).(Float64, input("$prompt 'total Assets'\n"))
#totalCapital =  passmissing(parse).(Float64, input("$prompt 'total Capital'\n"))
totalLiabilities = readString("total Liabilities")  #passmissing(parse).(Float64, input("$prompt 'total Liabilities'\n"))

    capital = totalAssets - totalLiabilities  # Capital
    return totalAssets, totalLiabilities, capital
end


"""
    Prompts user to enter: Sales,  Earnings  & Retained Earnings  (of a company)
"""
function calcsales_earnings()

    sales = readString("Sale") #passmissing(parse).(Float64, input("$prompt 'Sales'\n"))
    earnings = readString("Earnings") #passmissing(parse).(Float64, input("$prompt 'Earnings'\n"))
    retainedEarnings = readString("Retained Earnings") #passmissing(parse).(Float64, input("$prompt 'Retained Earnings'\n"))

        return  sales, earnings, retainedEarnings #(sales, earnings, retainedEarnings)

end

#--- Altman Coefficients a1, a2, ..., an

weightVariables = [1.2 , 1.4 , 3.3 , 0.6 , 0.999] #[a1=1.2 , a2=1.4 , a3=3.3 , a4=0.6 ,a5 = 0.999]
# requires more work
function altmanCoeffs(totalAssets,totalLiabilities, workingCapital,
    retainedEarnings, earnings, sales,
      a1=1.2 , a2=1.4 , a3=3.3 , a4=0.6 ,a5 = 0.999 )
"""
Altman Coeffecient formula
parameters: are changeable, as requeired
sums up Altman's z-score equation (as provided in the enclosed academic paper)
Requires:
1. totalAssets
2. totalLiabilities
3. workingCapital
4. retainedEarnings
5. earnings
6. sales

"""
    capital = copy(calcCapital(totalAssets,totalLiabilities))
    workingCapital

    z = a1 * X1(workingCapital,totalAssets) #req:working capiyal
    +a2 * X2(retainedEarnings,totalAssets)
    + a3 * X3(earnings,totalAssets)
    + a4 * X4(capital, totalLiabilities) # X4 = capital / totalLiabilities
    + a5 * X5(sales, totalAssets)

    return z

end

#--- altoman Coefficients
# DONE  # me: ready to serve
"""
returns Altman's Coefficients

returns x1, x2, x3, x4, x5

"""
function altmanCoeffs(currentAssets,currentLiabilities,totalAssets,
    retainedEarnings, earnings,
    totalLiabilities,sales )

    capital = copy(calcCapital(totalAssets,totalLiabilities))
    workingCapital = calcWorkingCapital(currentAssets,currentLiabilities)
    x1 = X1(workingCapital,totalAssets)

    x2 = X2(retainedEarnings, totalAssets)
    x3 = X3(earnings, totalAssets)
    x4 = X4(capital,totalAssets)
    x5 = X5(sales,totalAssets)

    return x1, x2, x3,x4,x5

end

"""
calculates working capital from
1. Current Assets
2. Current Liabilities


1. workingCapital
2. sales & Earnings

1. workingCapital = currentAssets - currentLiabilities


"""
function calcCurrentCapital(currentAssets,currentLiabilities) #Crucial

    #treat those as dummy variables
    cAssets = abs(currentAssets)
    cLiabilities = abs(currentLiabilities)
    #need to review related functions

    #--- Capital function s

    workingCapital = max(cAssets , abs(cLiabilities) ) - min( cAssets, cLiabilities  )

    #captial  = calcCapital() #UncommentMe

    # sales , earnings , retained_earnings =  calcsales_earnings()

    # x1, x2, x3, x4, x5 = altmanCoeffs() # UncommentMe
    x1, x2, x3, x4, x5 = nothing#,nothing,nothing,nothing,nothing #altmanCoeffs()

# return x1, x2, x3, x4, x5
end

#--- prompt for accounting trinity : Assets, liabilities, &  Capital

"""
#=
prompts user to Directly enter the 3 accounts:
1. Capital
2. Assets
3. Liabilities

=#
function main_3Accounts()

capital = passmissing(parse).(Float64, input("$prompt 'capital'\n")))
liability  = passmissing(parse).abs(Float64, input("$prompt 'liability'\n")))
asset  = passmissing(parse).abs(input("$prompt 'asset'\n"))

return capital , liability,  asset
"""
#--- Asset functions

# Total Assets
"""

calculates Assets, from Total Capital  & Liabilties
    Assets =  Capital - Liabilities
```
input
```
1. totalCapital
2. totalLiabilities



Q. what if Capital is negative? #non-sense
Q. what if Liabilities value is negative (more ) # rare #doesn't make much #sense

```
output
```
-Returns capital & liability [As is]

"""
function calctotalAssets(totalCapital,totalLiabilities) # weird
# if someone can get totalCapital, totalLiabilities then:
# Assets = totalCapital - totalLiabilities

    #totalcapital = capital(totalCapital) #
    #liability = liability(totalLiabilities)
    totalAssets =  totalCapital - totalLiabilities
    return totalAssets

end

# calcAssets
"""
Calculates Assets (from totalCapital, & TotalLiabilties)

```
inputs:

Q. what if Capital is Negative? (below 0 ) ( doesn't make sense) #non-sense
Q. what if Liability is Negative? (more Accounts Recievables #busiess is Flourishing!)


"""

# gettotoalAssets
function gettotoalAssets()

# Equation : capital = Assets - totalLiabilities
    capital = capital(totalCapital)

    liability = liability(totalLiabilities)

    return capital , liability
end

#  calcAssets
function calcAssets(totalCapital, totalLiabilities)

    """
    Handling the accounts' values is  Crucial
    i.e. do not change the accounts' negative values
    (it is normal for accounts to have both negative & Positive values)
    (requires further handling)

    """
    capital = capital(totalCapital)  #  abs(capital)

    liability = liability(totalLiabilities)  # abs(totalLiabilities)

    return capital, liability
end

##----
#preferred

"""

reads Cash, accountsReceivable, inventory, Securities commercialPaper, treasuryNotes, other

source: Prepaid expenses
"""

function getCurrentAssets() # includes many mini-functions
    #TODO : remove passmissing, and

    Cash =  readString("Cash") #passmissing(parse).(Float64, input("$Cash and cash equivalents" )) # 1. Accounts Receivable
    accountsReceivable= readString("accountsReceivable") #passmissing(parse).(Float64, input( "$accountsReceivable" ) ) # 1. Accounts Receivable
    inventory = readString("inventory") #passmissing(parse).(Float64, input( " $inventory" ) ) # 2. Inventory
    Securities = readString("Securities") #passmissing(parse).(Float64, input( " $Securities" ) ) # 3. Securities
    commercialPaper = readString("commercialPaper") #passmissing(parse).(Float64, input( " $commercialPaper" ) ) # 4. Commercial Paper
    treasuryNotes = readString("treasuryNotes") #passmissing(parse).(Float64, input( " $TreasuryNotes" ) ) # 5. TreasuryNotes
    other = readString("other") #passmissing(parse).(Float64, input( " $other " ) ) #5. other Current Assets
    #    return currentasserts,  accountsReceivable,  inventory, Securities, commercialPaper,treasuryNotes,other
    return
    (Cash, accountsReceivable,  inventory,  Securities,
     commercialPaper,treasuryNotes,other)

end

"""

!!!note: other is optional (some companies may include other  not mention objects,
 value is calculated into other, seperately, then passed into this function  )
"""
function calccurrentAssets(cash,accountsReceivable,inventory,Securities,commercialPaper,treasuryNotes,other=0) #args

    currentAssets = cash+accountsReceivable + inventory + Securities +commercialPaper+treasuryNotes+other
    return currentAssets
end

#preferred
function getnonCurrentAssets() # working

    return passmissing(parse).(Float64, input( " nonCurrentAssets" ) )
end

"""

Assets  = Current (less than the  bussiness's set timespan)+ non-current Asset (more he  bussiness's set timespan  )
"""
function calcAssets(cash, accountsReceivable,inventory,Securities,commercialPaper,treasuryNotes,other)
    currentAssets = calccurrentAssets(accountsReceivable,inventory,Securities,commercialPaper,treasuryNotes,other)

    nonCurrentAssets = calcNonCurrentAssets()
    return currentAssets, nonCurrentAssets
end

#----
"""
# max(capital , liability)
#return max(capital, liability) - min(capital, liability)

return  capital - liability
end
"""

# currentassets

currentAssets = getCurrentAssets() #input("please enter 'Current Assets' ")

#should debug
function currentassets() # returns a (decimal) Number
    """
    calculates currentAsset , from user prompt
    !!!note:
    Depreciation, nowadays, is 3 years, due to tech. Development
    Average Utilization in accounting books was 5 years
    but with Tech. Adcancement, it is safe to say it's more like 3 years on Average)
    thus a tech product (i.e. pc, workstation, server, ...)
    has a lifetime of 3 years, on Average

    Current Assets = Cash and Cash Equivalents
    1. Accounts Receivable [Ones owning you (in cash) ]
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

    currentAssets =   accountsReceivable + inventory + securities + commercialPaper +
            treasuryNotes + other

    return currentAssets
end

## --- calculates Working Capital (from currentLiabilities & current Capital)

#--- Liabilities

# currentLiabilities
"""
```
inputs
```

```
outputs:
    - CurrentLiabilities: returns a tuple
```
"""
function getCurrentLiabilities()
    #
end
function calcCurrentLiabilities(notesPayable,accountsPayable,accruedExpense,unearnedRevenue,longtermDebt)
    """
    Prompts the User to enter the following:
         1. notespayable

         2. accountspayable

         3. currentLiabs

    -returns
    """

    notesPayable , accountsPayable , accruedExpense , unearnedRevenue , longtermDebt = currentliabilities()
    #currentLiabilities = abs(notesPayable) + abs(accountsPayable) + abs(accruedExpense) + abs(unearnedRevenue) + abs(longtermDebt)

    currentLiabilities = notesPayable + accountsPayable +  accruedExpense + unearnedRevenue + alongtermDebt

    return currentLiabilities


#--- capital (Equity)

# workingCapital

"""
```
inputs:
    nothing
    !!!note: function prompts user, for string input
```


```
outputs:
    - workingCapital: a tuple, of user capital object items
```
"""
function getworkingCapital()
    #TODO: handle user input string
    workingCapital = nothing

    return workingCapital
end

function calcworkingCapital(currentAssets,  currentLiabilities)
    workingCapital =  calcworkingCapital(currentAssets, currentLiabilities)
    print("Working Capital is:  $workingCapital !")

    return workingCapital
end

#--- Altman cutt-off z

X1 = workingCapital() / totalAssets #lambda:  = workingCapital() / totalAssets

# X2 = lambda: retainedEarnings, totalAssets  = retainedEarnings/ retainedEarnings

X2 =   retainedEarnings / totalAssets #lambda:  =  retainedEarnings / totalAssets

# X3 = earnings / total assets

X3 = earnings / totalAssets #lambda:  =  earnings / totalAssets

X4 = equity(capital) / totalAssets #lambda:  =  equity(capital) / totalAssets

# X5 =
##  --- Accounting Ratios

#= X1 = working Capital / total assets # Current Assets without current Liabilities / total Assets

 TODO: [Working Capital needs to be shown]

- currentAssets: any asset that will
provide an economic value for or
 within one year
 =#

#=

X1 = workingCapital / totalAssets

# X2 = retained earnings / totalAssets

X2 = retainedEarnings / totalAssets

# X3 = earnings / totalAssets

X3 = earnings / totalAssets

# X4 = totalequity(capital) / total liabilities

X4 = (Total)capital / totalLiabilities

# X5 = sales / total assets

X5 = sales / totalAssets

return X1,X2,X3,X4,X5  - #wishful thinking
end

Reality:

TOTALAssets * (X1() +X2() +X3() +X4() +X5() )= workingCapital+ retainedEarnings + earnings
+ (Capital*totalAssets) /totalLiabilites + Sales
=#
#--- z cutt-off Handling

function z_handling(z)
    if z < 1.18 # Below: Less `Assets` more `Liabilities`
        decision="Distress"
    elseif z> 1.81 && z < 2.99
        decision="Gray Zone"
    elseif z > 2.99 # Above: more `Assets`, less `Liabilities` -> more likely to be in the Safe Zone
        decision="Safe Zone"
    else end
 return z,decison
end
 #Well-DONE! #<- double-check



##current Assets

#function altman(totalAssets, sales )

function getCurrentAssets() #DONE
    #TODO:
# cassets= passmissing(parse).(Float64, input("please enter Current Assets "))
# null -double check
return cassets
end

function calcCurrentAssets(currentAssets)
    currentAssets =  currentAssets.cash+ currentAssets.accountsPayable +
    currentAssets.+ currentAssets.
    currentAssets.

    currentLiabilities
end
casset = currentassets()#can't cappen in real life - mak=yebe in a purple parallel Universe # user copys pastes from a company's brouchoure under inveestor-relations -  applicable 100%
end #correctly returns cAsserts ok


#--- current liabilities
function calcLiabilities(totalAssets,totalCapital)
"""
calculates Liabilities (from total Assets & total Capital)

      the Point: the company may have Liabilities above Capital
we do NOT Know which is larger, Assets or Capital (nor which is negative or positive) - [ use min & max]

Hint: Q.  what if sign is major, more important than abstract

asset = abs(totalAssets); capital = abs(totalCapital);
return max(Asset, Capital) - min(Asset, Capital)

"""
# cliabilities = currentliabilities()

asset = abs(totalAssets); capital = abs(totalCapital)

totalLiabilities = max(asset, capital) - min(asset, capital)

return totalLabilties

end

#---  Liabilities
#notesPayable, accountsPayable, accruedExpense,unearnedRevenue, longtermDebt

##--- totalLiabilites

##--- currentLiabilities

# useful (funtion declaration )
"""
```
inputs:
reads user input
```
Assumptions:
prompts user for input
 -calculates current liabilities (it's the same for companies or personal accounts )
 -calculates different short-term liabilitues below 1 year through:

    1. Notes Payable
    2. Accounts Payable
    3. Accrued Expense
    4. Unearned Revenue
    5. Long-term Debt

```
output:
```
- Returns:
(notesPayable , accountsPayable , accruedExpense ,
unearnedRevenue , longtermDebt)

"""
function getCurrentLiabilities()
    #TODO:
    notesPayable =  passmissing(parse).(Float64, input("$prompt 'Notes Payable'\n"))
    accountsPayable = passmissing(parse).(Float64, input("$prompt 'Accounts Payable'\n"))
    accruedExpense = passmissing(parse).(Float64, input("$prompt 'Accrued Expense'\n"))
    unearnedRevenue = passmissing(parse).(Float64, input("$prompt 'Unearned Revenue'\n"))
    longtermDebt = passmissing(parse).(Float64, input("$prompt 'Long-term Debt'\n"))

    return
    (notesPayable , accountsPayable , accruedExpense,
    unearnedRevenue , longtermDebt)
end
function calcCurrentLiabilities(
    notesPayable,accountsPayable,accruedExpense,unearnedRevenue,longtermDebt)
    currentLiabilities = notesPayable+accountsPayable + accruedExpense + unearnedRevenue + longtermDebt
    return currentLiabilities
end

function calcCurrentLiabilities(currentLiabilities)
    currentLiabilities =  currentLiabilities.notesPayable+ currentLiabilities.accountsPayable +
    currentLiabilities.accruedExpense+ currentLiabilities.unearnedRevenue
    currentLiabilities.longtermDebt

    currentLiabilities
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






#--- functions



function getLiabilities()
    """
    calculates current, non-current liabilities
    Accounts
    ```
    inputs:
    Nothing
    !!! note: prompts user for input 2 values:
        -currentliabs
        -noncurrentliabs
    ```

    """
    currentliabs = currentliabilities() #done
    noncurrentliabs = tryparse(Float64,( Input("Enter non current liabilities: ")))
    #tryparse(Float64, input("$prompt ' non Current Liabilities'"))
    return currentliabs , noncurrentliabs

end

#end  of Assets -----
# Depreciate
"""
function parsing()
    return passmissing(parse).(Float64, input("$prompt ' a numeric variable '\n"))
    #return variable = passmissing(parse).(Float64, input('$prompt'))
end

#uses functions (depreciated):
calcLiabilities
2. calAssets
"""

function altmanCoeffs()

    currentAssets , non_CurrentAssets = calAssets() # 1. get current, non-Current Assets

    Assets = currentAssets + non_CurrentAssets # 2. sum them up, into Assets

    currentliabs , non_CurrentLiabs = calcLiabilities() # get Current, non-Current Liabilities

    Liabilities = currentliabs + noncurrentLiabs # sum them up, into Liabilities

    #z_handling(z)

    #return     #altmanCoeffs()
end


function main()
    print("welcome to Altman z-score - Julia Edition!\n")

# Assets
totalAssets = getTotalAssets(TotalLiabilities,totalCapital)

#currentAsset
CurrentAssets = getCurrentAssets() #read input & returns a tuple
calcCurrentAssets(CurrentAssets) # detuple inside

nonCurrentAssets = getnonCurrentAssets()

calcnonCurrentAssets(nonCurrentAssets)

# currentLiabs demo
# getLiabilities() #no such thing should exist

# liabilities

CurrentLiabilities =getCurrentLiabilities() # returns tuple
calcCurrentLiabilities(CurrentLiabilities) #
#noncurrenLiabs demo
NonCurrentLiabilities = getNonCurrentLiabilities()
calcNonCurrentLiabilities(NonCurrentLiabilities)

totalLiabilities = getTotalLiabilities(totalAssets,totalCapital)

getCurrentLiabilities()
getnonCurrentLiabilities()

end
