#=
demo3.jl

Author = @adamwillisMastery ('Ahmad Lutfi')

Description:

- This file mainly checks the **functionality** of the following *functions*:

- checkYesOrNo(_string)

- isNull()
- isMissing()

- @macro Name

- setVariable


#--- responseHandling

!!!Note: function `warn` has been added (which is called, instead of  calling `throw(error(msg)))`
=#

#--------------
escapeSequence = ["by","bye","c","close","q","quit","e","end","exit", "k","kill","t","terminate","f", "finish", "escape"] # TODO: apply to lower
allowedNoStrings = ["n","N","no","No","nO"]
allowedYesStrings = ["y","Y","Yes","yes", "YES","yEs", "YeS","ya","YEAH","yeah"]

#@macro Name (to Invoke)
macro Name(arg)
    string(arg)
end
#helper functions

# isNull

""" A function checks  if input string is Null (user enters nothing, presses 'return')"""
function isNull(_string) # compiles #preferred

    condition =  _string === "" || _string == nothing

    if condition == true #|| typeof(_string) isa Missing  # Works
    #println("Null: passing by 1st if _string condition")
        _string = nothing
        return true

    elseif condition == false   #_string !== ""
        #println("Null: passing by 2nd if _string condition")
        return false

    else throw(error(UnExpectedError))
    end

end

""" checks if input is missing, returns `true`, otherwise, returns `false` """
function isMissing(_in=missing)

    condition = _in isa Missing || ismissing(_in) === true

    if condition == true  #_in isa Missing &&  ismissing(_in) === true  # correct
        return true    #println("try 3: ", true )

    elseif condition == false   #!(_in isa Missing) ||  ismissing(_in) === false
        return false

    else throw(error("UnExpectedError Occured"))
    end

end

#println("isNull("") " )  #  cannot juxtapose string literal

res = isNull(nothing) # it should be true # returns false [nothing is not yet included in Null]

# handleNull

## handleNull(_string,result="0.00") # WARNING: Context is **Inconclusive**
#  (replace it with either handleNullName or handleNullValue)
#review2 : a rough sketch, of a general form, of a null handling & compiling & is used - no need to depreciate

""" Handles null input, by replacing string variable with designated result value """
function handleNull(_string,result="0.00") #Context is **Inconclusive** ( depends entirely on the context: either a variable name or value )

    condition = isNull(_string)

    #1. if string was `null`, assign result to it
    if condition  == true
        _string = result

    #elseif condition == false   -> do nothing
    end

    #2. return `_string` whether null or not
     return _string

end


## handleNull(_string, result="0.00")

""" Handles input if it was null or equal to `""`
writes empty string of "" as "0.00", by default (user-changeable ) """ # adds meaning to the void
function handleNullValue(_stringVariable, _stringDecimal="0.00") # ok


    #1. let the user understand that variable value haven't been filled, yet
    println("You haven't provided the variable with a value, yet, could you please do that for variable ", @Name(_string) ) #  the amicability skyrocketed :)
    _string = handleNull( _stringVariable , _stringDecimal)
    #!!!Note: handleNull should return the resultant string

    #!!!Note: not required in `this scope` - Reason: `float conversion` already occurs in the upper level, outside the function
    #_decimal = convertToFloat(_string)

    println("NullValue: Nothing was Found & been handeled")
        println("DEBUG: function handleNullValue(_string, result='0.00'): Nothing was Found & been handeled")
    return _string
    #return _decimal
end

println("DEBUG: handleNullValue(''): Handling a Null Value: ",handleNullValue("") )


#=
""" Handles input if it was null or equal to `""`
writes empty string of "" as "0.00", by default (user-changeable ) """ # adds meaning to the void


function handleNullValue(_string, result="0.00")

    #Introduce an extra step (before it, in the upper scope )
    #if _string is Null , assign result to it (as a decimalString)
        #_string =  string(result ) # ensure result is still a string
        _string = handleNull(_string,result)
        _decimal = convertToFloat(_string)

    println("DEBUG: function handleNullValue(_string, result='0.00'): Nothing was Found & been handeled")
    #return _string
    return _decimal
end
=#

#println("DEBUG: PROMPTVAR() = ")
#promptVarName()
#println("DEBUG: END ")
#promptRewind = "previous input is invalid! Rewind program? [ (Y)es/(N)o ]"

function returnEmptyString()
    return ""
end
function checkYesOrNo(_string)

    conditionNo = _string in allowedNoStrings #uppercase( _string) =="N" || lowercase(_string) == "no" #"No" || lowercase
    conditionYes = string in allowedYesStrings #  uppercase(_string) == "Y" || lowercase( _string) ==  "yes" #"Yes"

    if conditionYes == true
        return true
    elseif conditionNo == true
        return false
    else
        # A Good Alternatve

        #=
        println("Please enter a Valid Response: Yes, Y , No , N, Thank you!")
        println("Previous input is invalid! Rewind program? [ (Y)es/(N)o ]") #promptRewind )
        #println("previous input is invalid! Rewind program? [ (Y)es/(N)o ]")
        println(" would you like to Rewind ? Please enter Yes or no ")
        _string = readline()
        response = checkYesOrNo(_string )
        var = handleNullValue("")
        var = handleResponse(response, var)
        return var #response # var
        =#

        throw(error("ERROR: UnExpectedError Occured ")) # Idea: maybe it's too much
        returnEmptyString()
    end
end
""" Warn user about wrong input, without exiting the REPL """

#New - if it's called, warn compiles
function warn(msg = "ERROR: UnExpectedError Occured: please check input then try again, later  ")
    throw(error(msg))
end

""" handles the [Y]es/ [N]o Question
checks the user's answer if `[Y]es`, then return the kernel selected, with the corresponding variable `var` , otherwise, warn user and throw an error
"""
function handleResponse(boolFlag,var, kernel = promptVarName ) #updated functon

    # If user wants to repeat the question, call the kernel function again
    if boolFlag ==  true
        println("DEBUG:   BoolFlag = ",boolFlag,"\n User Prefers to rewind input; use the function:",kernel, " with input argument var:  ",var)
        return kernel(var)

    # if user does not want to input further, warn the user about his faulty input
    elseif boolFlag == false
        println("DEBUG: BoolFlag = ",boolFlag,"\n Something went wrong; warn user...")
        # warn user about faulty input (User stays executing in the REPL)
        return warn() #exit()
    else
        #throw(error("UnExpectedError Occured"))
        return warn()

    end
end

# handleNullName

## handleNullName(stringInput,result="variable")
""" handle the given input , as a string , for the next variable
it is checked against `null` and `missing`
handles nullability: if input variable is null, or equal to `""`
writes empty variable as `variable`, by default (user-changeable )
```
Output:
```
-   `varName`: the variable name

"""

function handleNullName(stringInput,result="variable")
    # A name should be
    #varName = "" #<-----
    isFaulty = isNullOrMissing(stringInput)

    if isFaulty == true
        # assign the result(by default it is a variable ) to `varName`
        #!!!Note: transfrom `result` to string , whatever value it may have
    	stringInput = string(result) # already assigned

    elseif isFaulty == false

        # Assign `stringInput` to `varName` = stringInput # return stringInput as varName
        #varName = stringInput
        #  extra: trimSpaces, (as variable name has no spaces)
        #!!!Note: adding other string ops is possible, below:
        stringInput =  string(stringInput) #trimSpaces( string(stringInput) ) #<-------
        stringInput = trimSpaces(stringInput)

    end

    return stringInput #varName
end

function handleNullName(stringInput,result="variable")
    # A name should be
    #varName = "" #<-----
    isFaulty = isNullOrMissing(stringInput)

    if isFaulty == true
        # assign the result(by default it is a variable ) to `varName`
        #!!!Note: transfrom `result` to string , whatever value it may have
    	stringInput = string(result) # already assigned

    elseif isFaulty == false

        # Assign `stringInput` to `varName` = stringInput # return stringInput as varName
        #varName = stringInput
        #  extra: trimSpaces, (as variable name has no spaces)
        #!!!Note: adding other string ops is possible, below:
        stringInput =  string(stringInput) #trimSpaces( string(stringInput) ) #<-------
        stringInput = trimSpaces(stringInput)

    end

    return stringInput #varName
end
# getConditions(stringInput)
function getConditions(stringInput) # <--------

    conditionNull = isNull(stringInput) # returns bool (true or false )
    conditionMissing = isMissing(stringInput)
    conditionNull, conditionMissing
    # isNull(stringInput) ,  isMissing(stringInput) # conditionMissing
end

# checkConditions(conditionNull::Bool, conditionMissing::Bool)

function checkConditions(conditionNull::Bool, conditionMissing::Bool)
    # Only one of the conditions is triggered

    # 1 . If Either One(1) of the conditons are `true`
    if conditionNull == true || conditionMissing == true
        return true

    # 2. OR If both of these conditions is false
    elseif conditionNull == false && conditionMissing == false
        return  false

    else throw(UnExpectedError(msg))
    end
end


#------
# isNullOrMissing(stringInput)
""" checks if string is null or missing

# a mutually exclusicve stuation , either a malfunctioning string can be:
1. missing
2. null (i.e. "")
but crucial to learn that a string cannot be both of the situations above,
at the same time

```
input:
```

*   stringInput: a given arbitrary string


```
Output: Bool : either true when it's null (or missing), or false if input is valid, otherwise: throws an error
```

"""
function isNullOrMissing(stringInput)

    #conditionNull = isNull(stringInput) #WARNING: conditionNull : could return a `String` not `Bool`
    #conditionMissing = isMissing(stringInput)

    conditionNull, conditionMissing = getConditions(stringInput)

    #UncommentMe: if everything works out
    # condition: at least One of the conditions is triggered (or both)
    condition = checkConditions(conditionNull, conditionMissing) # <-- (::String, ::Bool)

    if condition == true    #conditionNull == true || conditionMissing == true #condition == true  #
        return true

    elseif condition == false   #conditionNull == false && conditionMissing == false # condition == false  #
        return  false
    else
        #warn(msg)
        throw(error(msg)) # <----

    end
    return condition
end

## isNullOrMissing(conditionNull:: Bool, conditionMissing:: Bool)

function isNullOrMissing(conditionNull:: Bool, conditionMissing:: Bool) # WARNING:unused

    condition = checkConditions(conditionNull, conditionMissing)

    if condition == true
        return true
    elseif condition == false
        return false
    else
        throw(error(msg))

    end
    #return condition
end

"""To prevent an unncessary Infinite loop, Kindly Ask User if They want to Rewind with Options: [Y, yes , OR N, no ] """
function handleYesNo(var , kernel = promptVarName ) #TODO: to be debugged

    isNull = handleNullName(var) # !!!note: all spaces are trimmed, automatically

    varName = processEmptyVariableName(isNull) #done

    #handle a valid [Y]es / [N]o Question
    response = checkYesOrNo(varName)

    # handle the user-given response for Rewinding ([Y]es / [N]o), passing-in the handeled `var` value
    response = handleResponse(response, var, kernel)

    response

end

# promptVarName

#promptVarName(var="varName" , escapeSequence=escapeSequence)

""" prompts & handles user's entered `varName`
for a given `varName`, check for null or missing
""" # preferred
function promptVarName(var="varName" , escapeSequence=escapeSequence) # rechecked #TODO: trimSpaces()

    # take care of the Floating Number:
    # 1. If string was nothing(""), missing, or input was NOT a string Name
    if isNullOrMissing(var) == true #<--- var was null"" or missing
        # Handle it:
        #var = checkHandleDecimalInput(var) #WARNING: `var` can be `nothing ` #<------

        #2. Retry: Automatically (rewind Program): display input's invalid, check if user wants to rewind the function
        #stackOverFlow counter-mechanism, do something different, i.e.

        return " "
        #println("previous input is invalid! Rewind the function? [ (Y)es/(N)o ]")

    #2. if it's valid
    elseif isNullOrMissing(var) == false #|| isaAlphaString(var) == true
            # do nothing

            #var = trimSpaces(var)
            println("Not NULL or Missing <Input is Valid>: varName  = ",var) # var = totalAssets
            return var

    # Otherwise, if  it's an escape sequence, User wants to Exit...
    elseif var in escapeSequence
        var = exit() # Program exits the REPL
        return var
    # Otherwise, it's an error
    else
        throw(error(msg)) # warn user
    end

    #return var
end

#--------
#DEMO:
#println(promptVarName("")) #  BUG: trimSpaces() (taken-out), handeled return user: if faulty -> warn(), if

## promptValue()
#--------

""" Prompt user for input, then it's checked for being `null` or `missing` , if so, function rewinds"""
function promptValue() # rechecked

    _string = ""
    var = 0.0

    # 1. Let User Input for a value
    println("Variable's value isn't provided: Please enter a valid `float` for the given variable ")
    _string= readline()

    condition = isNullOrMissing(_string)
    # 2. If stirng was nothing(""), missing or input was a string Name
    if  condition == true #||  isaAlphaString(var) == true
        # Rewind for user input [restart function], as it cannot be missing
        #set string to default
        _string = "variable"
        _string = assignVariableToValue(_string,var)
        return _string
    # 3. otherwise, `_string` is neither nothing(""), missing or a string Name
    elseif condition  == false #&& isaAlphaString(var) == false  # if input is valid

        # 4. Convert `_string` to a `Float64`

        var = convertToFloat(_string)
        _string = assignVariableToValue("variableName",var)
        return _string
    # Otherwise, at anytime, if user felt stuck, entered  one of the exit strings  to exit
    elseif lowercase(_string) in escapeSequence
        exit() #   program exits the REPL....

    else
        throw(error(msg))
    end

#    return var
end

#--------

# Checked
function promptValue( var="0.0", _string="varName", escapeSequence = escapeSequence) # rechecked

    #_string = ""
    #var = 0.0
    println("Please enter the $_string's decimal value, or input an escapeSequence to quit program ")

    # 1. Let User Input a value
    _string= readline()

    # 2. If stirng was nothing(""), missing or input was a string Name
    condition = isNullOrMissing( var) # == true # ||  isaAlphaString(var) == true
    if condition == true
        #Do not rewind  Rewind for user input [restart function], as it cannot be missing
        return  0.0#promptValue() # reprompt input , from command line
    # 3. otherwise, `_string` is neither nothing(""), missing or a string Name
    elseif condition == false  #isNullOrMissing(var ) == false && isaAlphaString(var) == false  # if input is valid

        # 4. Convert `_string` to a `Float64`
    #    var = convertToFloat(var)
    #    return var

        var = convertToFloat(var)
        _string = assignVariableToValue(_string,var)
        return _string #var
    # Otherwise, at anytime, if user felt stuck, entered  one of the exit strings  to exit
    elseif lowercase(_string) in escapeSequence
        return exit() #   program exits the REPL....

    else
        throw(error(msg))
    end

    return var
end


println("#------ mini-DEMO start :")
#mini-DEMO:
println(promptValue("sth") )  # as string is given, tehre is no need for a readline()

println("#------ mini-DEMO ends!")


println(promptValue(100) )
#--------

# convertToFloat

""" converts a string Input to its corresponding float64 represenation"""
function convertToFloat(stringInput)
    decimalValue = tryparse(Float64, string(stringInput) ) #<-------
    return decimalValue
end

#--- trim & remove spaces

## removeSpaces1
"""
credits: @isbarn
stackOverFlow: Julia trinm string whitespace and check length
"""#lvl1

function removeSpaces1(inputString)

    _string = inputString #copy(inputString)

    result = join(map(character -> !isspace(_string[character]) ? "" : _string[character], 1:length(_string)  ) )
    return result
end


function removeSpaces2(inputString) #useful

    _string = inputString #copy(inputString)
    #@credits: "Fengyang Wang"
    result = filter(character -> !isspace(character), _string)
    return result
end


# trimSpaces
function trimSpaces(inputString)

    if isNullOrMissing( inputString) == true
        #Return a  " space " string! [`space` isa character ]
        return " "

    elseif isNullOrMissing( inputString) == true

         inputString = removeSpaces2(inputString) #removeSpaces2(inputString)
         inputString = Base.lstrip(inputString) #it does exit
         inputString = Base.rstrip(inputString) # it does exit
    end

    return inputString

end

println("DEBUG: trimSpaces: ",trimSpaces(" spac ey "))

println(handleNullName("str","var"))

#DEMO #1:
resName = handleNullName("var")
println("var is= ", resName)

# Demo #2:
#varName = readVariableName()
varName = "test"
varName = handleNullName(varName)


#varValue  = readVariableValue() # 1
varValue  = handleNullValue(varName) # 2


#checkNullOrMissing(varName )

#varName = handleNullOrMissing(varName)

#3. Assign to a variable
#TODO: Assign them to each other [turn a string & decimal into a variable called $string ]
varName = assignVariableToValue(varName,varValue) # now varName is a variable #TODO: return it

# DEMO: isa($variable, Number)
println("isa: debug#1: ",isa(440, Number))
println("isa: debug#2: ",isa(440.20, Number))
println("isa: debug#3: ",isa(440.201, Number)) # true  # fine
println("isa: debug#4: ",isa(string(440.20), Number)) # false
println("isa: debug#5: ",isa(string(440.20)*"a", Number)) # false value

# DEMO: isNullOrMissing
if isNullOrMissing("sth") == false # string was given
    print("isNullOrMissing == false")
end

if isNullOrMissing("sth") == true
    print("isNullOrMissing == true")
end

#---------

#lvl1
#=
macro string_as_varname(s::AbstractString, v::Any)  #::Any) # does not perform what is expected
	s = Core.Symbol(s) # <---- `Symbol`: from Core module (automatically imported)
	esc(:($s = $v))
end

varName = string_as_varname(stringName1, 100)

println("string_as_varname = "  @Name(varName)," with value = ", varName)
=#
#orignial macro - demo
# @string_as_varname(s::AbstractString,v::Any)

# lvl1:

""" creates a `Symbol`, assign the `varValue` to `stringVariable`, then returns the newly created variable  """
function string_as_varname(stringVariable::String , varValue::Any) #TODO: functions properly

        #1. create Symbol
        stringVariable = Core.Symbol(stringVariable )
        #2. Assign to the `Symbol` the value `v`
        stringVariable = varValue
        # 3. return newly created symbol
        stringVariable
end

function promptName(_string)

    println("Please enter $_string's name ")
    _stringName = readline()

    _stringName
end
println("Important Debug :  string_as_varname:",@Name(string_as_varname("newVar",100)) , string_as_varname("newVar",100) )

# setVariable
##  setVariable(_string="varName")

""" creates a new variable from `_string` , and prompts user to input a  `varValue` to `_string` variable
"""
function setVariable(_string="varName") #updated


    #variable= promptVarName(_string) #"$_string")# prompt variable using the string's value

    # println("Please enter $_string's name ")
    # _stringName = readline()
    _stringName = promptName(_string)

    variable = handleNullName(_stringName)
    variable = trimSpaces(variable) #corrected


    _value = promptValue(variable )
    _value = handleNullValue(_value)
    _value = convertToFloat(_value)

    variable = assignVariableToValue(variable, _value )

    variable

end


## setVariable(_string="varName", varValue = "50")

""" creates a new variable from `_string` , and assigns `varValue` to `_string`
"""
function setVariable(_string , varValue)  #_string="varName", varValue = "50") #updated #TODO:


    #variable= promptVarName(_string) #"$_string")# prompt variable using the string's value
    variableName = handleNullName(_string)
    variableName = trimSpaces(variableName) #corrected

    _value = handleNullValue(varValue)

    _value = convertToFloat(_value)

    variableName = assignVariableToValue(variableName, _value )

    variableName

end


# helper functions

## Sum(_vector)

function Sum(_vector)

    if isNull(_vector)
        throw(error(msg))
    end
    return sum([i for i in _vector]) #1:length(_vector)])
end


## Mul(_vector)

""" multiply each items of a vector """
function Mul(_vector)

    if isNull(_vector)
        throw(error(msg))
    end
    _mul=1
     for i in _vector #foreach element
        println("DEBUG - priority: item = ", i)
         _mul = _mul * i
     end
     _mul
end


## calcWorkingCapital

### calcWorkingCapital(cAssets, cLiabilities)

"""
WorkingCapital(cAssets, cLiabilities):
calculates the difference `current Assets - current Liabilites`

!!!Note:  `workingCapital` could be:
1. Positive (`assets` > `liabilities`), or it could be
2. Negative (liabilities > assets )

"""
function calcWorkingCapital(cAssets, cLiabilities)

    workingCapital = cAssets  - cLiabilities #@currentAssets() - currentLiabilities()

    workingCapital
end


## getMarketCapital(stockPrice, outstandingShares, outstandingSharesName="outstandingShares", stockPriceName = "stockPrice")
function getMarketCapital(stockPrice, outstandingShares, outstandingSharesName="outstandingShares", stockPriceName = "stockPrice")

        # 1. set `marketCapital` variables
        outstandingShares = setVariable(outstandingSharesName) #createVariable(outstandingShares)
        stockPrice =  setVariable(stockPriceName) # createVariable(stockPrice)
        # 2. concatenate them into a vector
        _vector = [outstandingShares, stockPrice ]

        # 3. return result
        _vector

end


function calcMarketCapital(_marketVector)

    #multiply all its elements, the get back  the total figure
    Mul(_marketVector)
end


#DEMO  - getMarketCapital(stockPrice, sharesOutstanding)
marketCapital = getMarketCapital( 3, 3000)  #stockPrice, sharesOutstanding)  = Mul(3, 3000) = 9000

totalMarketCapital = calcMarketCapital(marketCapital) # 3 * 3000 = 9000
println("DEBUG: totalMarketCapital = ", totalMarketCapital)


#--- Altman functions

function calcAltmanRatios(currentAssets, currentLiabilities, totalAssets, retainedEarnings, EBIT, stockPrice, sharesOutstanding, totalDebt, sales) # Compiles

    #calcAltmanRatios() : from `currentAssets`, `currentLiabilities` figures
    workingCapital = calcWorkingCapital(currentAssets,currentLiabilities)

    x1 = workingCapital / totalAssets

    x2 = retainedEarnings /  totalAssets

    x3 = EBIT / totalAssets

    #getMarketCapital(stockPrice, sharesOutstanding)

    #getMarketCapital(): from `stockPrice` & `sharesOutstanding`

    marketCapital = getMarketCapital(stockPrice, sharesOutstanding) # < ------
    totalMarketCapital = calcMarketCapital(marketCapital)


    x4 = totalMarketCapital / totalDebt

    x5 =  sales / totalAssets

    #concatenate ratios , reducing input into an `X` vector
    vectorRatios = [x1,x2,x3,x4,x5]

    vectorRatios
end


# helper function

# calcAltmanRatios()
""" Processing II:
    takes a vector of xs (of Altman's Z), along with another vector
weights are placeholders (only)
"""


function areDimsEqual(v1,v2)
    _len1 = length(v1)
    _len2 = length(v2)

    if _len1==_len2 # length(v2)
        return true
    elseif _len1 == _len2 #length(v1) != length(v2)
        return false
    end
end


#DEMO - processAltman

println("DEBUG: areDimsEqual =",areDimsEqual([0.3, 0.4 , 0.2, 0.1, 0.5],  [1.2 , 1.4 , 3.3 , 0.6 , 0.999 ] ) )

""" A traditional , but a surely non-Optimal way of element-wise vector multiplication """
function multiplyVectorNonOptimal()

    #!!!Note: It's good result  (but not optimally fast)
    # 1. define `mul` vector
    mul = zeros(length(_in))

    # 2. loop and multiply ecach element, accordingly
    for i in length(_in)

        # multiply each element by its corresponding weight
        mul[i] = _in[i]' .* _weights[i]
    end
    # 3. return mul
    mul
end


"""" Processing III: get input _in , _weights , perform Algebriac Vector multiplication
i.e.  _in' * _weights , & return  the Output"""
function processAltman(_in = [0.3, 0.4 , 0.2, 0.1, 0.5], _weights = [1.2 , 1.4 , 3.3 , 0.6 , 0.999 ]) # [x1, x2,x3,x4,x5]

    try
        #1. Check whether both vectors are of same length
        condition  = areDimsEqual(_in, _weights)

        #condition =  copy( length(_in) == length(_weights)) # or try `deepcopy`
        #2. Pre-set the `result` vector, with zeros
        result = zeros(length(_in))

        if !condition  # if lengths are NOT Equal
            println("Input Dimensions are not equal, please check input, then try again later  ")
            #zeros vector is expected

        elseif condition # if lengths are Equal

            # Element-wise Multiplication
            #!!!Note: julia follows vector logic, thus a transpose must be applied (on vector )

            #One-Liner:  point-wise vector element multiplication
            result = _in' .* _weights # _in(transpose) * _weights [valid input ] #!!! ensure transpose of one of input vectors

            return result

        else
            throw(error("UnExpectedError Occured "))

        end

        return result

    catch UnExpectedError
        @error msg +  exception = (UnExpectedError, catch_backtrace())
    end

end

""" uses the `9 input`  of application-level variables   """
function calcAltman(currentAssets, currentLiabilities, totalAssets, retainedEarnings, EBIT, stockPrice, sharesOutstanding,  totalDebt, sales )
    # this function expects final terminal values to be entered

    #1. currentAssets
    #2. currentLiabilities
    #3. retainedEarnings
    #4. EBIT

    # marketCapital ((market) stockPrice , sharesOutstanding )
    # 5.stockPrice
    #6. sharesOutstanding
    #7. totalDebt
    #8. sales
    #9. totalAssets

    #that makes up the financial ratios of interest :
    #x1 = working capital (currentAssets - currentLiabilities) / totalAssets
    #x2 =

    #calcWorkingCapital()

    #calcAltmanRatios()
    vectorRatios = calcAltmanRatios(currentAssets, currentLiabilities, totalAssets, retainedEarnings, EBIT, stockPrice, sharesOutstanding, totalDebt, sales)
    println("DEBUG: vectorRatios = ", vectorRatios)

    #=
    workingCapital = calcWorkingCapital(currentAssets,currentLiabilities)

    x1 = workingCapital / totalAssets

    x2 = retainedEarnings /  totalAssets

    x3 = EBIT / totalAssets

    #getMarketCapital(stockPrice, sharesOutstanding)

    #getMarketCapital()
    marketCapital = getMarketCapital(stockPrice, sharesOutstanding)

    x4 = marketCapital / totalDebt

    x5 =  sales / totalAssets

    #return X = [x1,x2,x3,x4,x5]
    =#

    # _inVector = vectorRatios # [x1,x2,x3,x4,x5]

    vectorAltmanZ = processAltman(vectorRatios)

    totalAltmanZScore = Sum(vectorAltmanZ)


end

#DEMO  - calcAltman

#(currentAssets, currentLiabilities, totalAssets, retainedEarnings, EBIT, stockPrice, sharesOutstanding, totalDebt, sales)
altmanVectorRatios = calcAltman(10000, 2000, 20000, 1000, 2000, 3, 3000, 2000, 1000) #compiles

println("Altman Vector Ratios: ",altmanVectorRatios)

totalZScore = Sum(altmanVectorRatios)
println("totalZScore = ", totalZScore)

#DEMO: `setVariable`

var1  =  setVariable("var1",100) # compiles
var2 =  setVariable("var2",75)
println("DEBUG: setVariable('var1',100) = ",var1  )
println("DEBUG: setVariable('var2',75) = ", var2 )


z, decision = evaluateZ(totalZScore) #compile Succeeded
#Output:
#>>
# z is z =38.24490000000001
# Interpretation: Safe Zone
println("\nz is z = ",z , "\nInterpretation: ",decision)  # 38.24490000000001 [Safe Zone]

#-----------------------
#Q. now, It's safe, how much Is It safe?

# Dipping a bit deeper:
# the difference
grayZone_distress = 1.81 - 1.18  # 0.63
safeZone_gray = 2.99 - 1.81  #   1.18

# The Division ratio ( of two (2) zones )
# Ratio(safeZone_gray/grayZone_distress) 38.24490000000001 [Safe Zone]
zoneGrayDistressRatio = safeZone_gray / grayZone_distress # 1.18 / 0.63 1.873015873015873 [progression Increment] (of a zone)

zRatioZoneRatio  = 38.24490000000001 / 1.81 # 21.12977900552487 #[more by 21.21 times  ] (of a zone)
println("It is safer more that $zRatioZoneRatio times of a normal zone !")
# Q. are there another  ways( that maybe another viewing angel ?  )

# --- Extra

function promptSalesEarnings(sales = "sales",ebit = "ebit", retainedEarnings = "retainedEarnings")
    sales =  setVariable(sales)
    ebit = setVariable(ebit)
    retainedEarnings = setVariable(retainedEarnings)

    vSales= [sales, ebit, retainedEarnings] #(sales, earnings, retainedEarnings)
    vSales
end

function getSalesEarnings(sales="sales", ebit="ebit", retainedEarnings="retainedEarnings") #_string="SalesEarnings")  #sales,ebit retainedEarnings)

    vSales = promptSalesEarnings()

    vSales #[ sales, ebit, retainedEarnings ] #vSales

end

""" Calculates total sales """
function calcSalesEarnings(vEarnings)

    totalSales = Sum(vEarnings)

    return totalSales

end

earnings = getSalesEarnings()
calcSalesEarnings(earnings)
