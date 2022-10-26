# credits :
#using Missings;
#using DataFrames;
#using deepcopy #  deepcopy
#using Base
#using Core.Symbol #Base.Symbol
"""
1. the Null & the missing

While stucturing things , we have to seperate between a `null` and `missing`
though both may mean the same thing, but in Julia, they are not equal, and refer to different entities
Functions Proposed:
*   isNull(_in="") # when input is empty i.e. when user enters nothning, then presses 'enter 'to apply hence the `""` input
*   isMissing(_in = missing ) : when string equals to a `missing` object

"""
global _first = 1
global prompt = "Please enter "
global decimalMsg =  "Input is Null , please insert a decimal value "
global message = "ERROR, Please check input "
global msg = "ERROR: Unexpected Error - Please recheck input: "
escapeSequence = ["by","bye","c","close","q","quit","e","end","exit", "k","kill","t","terminate","f", "finish", "escape"] # TODO: apply to lower
reservedKeywords = ["baremodule","begin","break","catch", "const","continue", "do","else","elseif",
"end","export","false","finally","for","function","global","if","import","let","local",
"macro", "module", "quote", "return","struct","true","try","using","while"]

"""
####  program main
# the program is about implementation of (1) Formula implemented in (1) function : processAltman

#to call the formula, we need 5 variable  : X1, X2, X3, x4, & X5, hence, input would better be as a vector
# But first, we need (9) `Appliction Domain` variables:
# Hence, for each items in the vector above, we require the user to `Punch-in`
# A tuple of variable name, then a variable value [ or  for berivty: user only enters variable value ]

# Both name & value is checked for: null or missing : 2 functions: `isNull` & `isMissing`, respectively

# !!!note: although it does not make sense, under the context of user input ), `isMissing` is handled, nonetheless [not reading from `DataFrames` ]
"""
#=
# retired Code

println("please enter `by`")

var = readline()
boolFlag = nothing # a placeholder , for Debug purposes

# if user-input matches the escapeSequence
if  lowercase(var) == "by"  &&  "by" in  escapeSequence #or in ? # in compiles
    boolFlag = true
    println("True user input was in escape sequence flag = " )#,$boolFlag)
elseif lowercase(var) != "by" ||  "by" in escapeSequence == false
    boolFlag = false # replace with exit ..
    println("False, user did not write an escapeSequence! , flag = ")#, $boolFlag)
else
    throw(error("something Unexpected occured "))
end
=#

#=
!!!End Notes:
*   - In handling the `escapeSequences`'s condition': `in` works while  `isa` do not
as `isa` is expecting a `Type` but found a `Vector`
=#

#---- string functions

##--- helper functions

# isNull

""" A function checks  if input string is Null (user enters nothing, presses 'return')"""

function isNull(_string) # compiles #preferred

    #try
    condition =  _string === "" || _string == nothing
        if condition #|| typeof(_string) isa Missing  # Works
            #println("Null: passing by 1st if _string condition")
            _string = nothing
            return true
        elseif !condition  #_string !== ""
            #println("Null: passing by 2nd if _string condition")
            return false
        else throw(error(UnExpectedError))
        end
        #return response
#    catch UnExpectedError
#    end
end


#println("isNull("") " )  #  cannot juxtapose string literal

res = isNull(nothing) # it should be true # returns false [nothing is not yet included in Null]

println(res)
res2 = isNull("")
println(res2)
println("isNull(sth) = ", isNull("sth"))



# isMissing

""" checks if a given input is `missing`

```
Output:
-   `Bool` flag: true if missing, false if not missing, otherwise throws an error
```
 """
function isMissing(_in=missing)
    condition = _in isa Missing || ismissing(_in) === true

    if condition == true  #_in isa Missing &&  ismissing(_in) === true  # correct
        return true    #println("try 3: ", true )

    elseif condition == false   #!(_in isa Missing) ||  ismissing(_in) === false
        return false

    else throw(error("UnExpectedError Occured"))
    end

end

# handleMissing

""" handles input if it was `missing` """
function handleMissing(_string,result="0.00")

    _string = result
    println(" Missing was Found")
    return _string
end

#--------------
#helper functions

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

    if conditionNull == true || conditionMissing == true
        return true

    elseif conditionNull == false && conditionMissing == false
        return  false
    else throw(UnExpectedError(msg))
    end
end

# DEMO :

conditionNull = isNull("") #
println("conditionNull", conditionNull)
#conditionMissing = isMissing(missing)

#=
getConditions(false,false)
getConditions(true, true)
getConditions(nothing,true)
getConditions(true, nothing)

getConditions(nothing, nothing)
=#

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

# ---User Prompt

# readVariableName()
""" Reads a user-given variable name """
function readVariableName()
    println("readVariableName: Please enter a variable Name ")
    variableName = readline()
    return variableName
end

#=
function readVariableName(_string)

    variableName = readline()
    return variableName
end=#

# readVariableValue [2]

## readVariableValue()
""" returns user-inputString """
function readVariableValue()
    println("readVariableValue: Please enter a variable Value: a Decimal, up to 2 points of precison  ")
    variableValue = readline()
    return variableValue
end

## readVariableValue(_string)
"""reads a user given value, for a specific name
- user is prompted to enter the designated string name
- input is read from the user

!!!note: the variable value is only read, but not checked, yet
# Example

#Input:
readVariableValue(cash)

#Output:
>>> please enter the cash's value:
>>> <User Input goes here>

"""
function readVariableValue(_string)
    println("please enter the $_string's value:\n ")
    variableValue = readline()

end

# convertToFloat(stringInput)

""" converts a string Input to its corresponding float64 represenation"""
function convertToFloat(stringInput)
    decimalValue = tryparse(Float64, string(stringInput) ) #<-------
    decimalValue
end

# Sum(_vector)

function Sum(_vector)
    if isNull(_vector)
        throw(error(msg))
    end
    return sum([i for i in _vector]) #1:length(_vector)])
end


# Mul [2]

## Mul(_vector)

""" Multiply each item of a vector """
function Mul(_vector)

    _mul=1
     for i in _vector
        println("DEBUG - priority: item = ", i)
         _mul = _mul * i
     end
     _mul
end


## Mul(vector1, vector2)
""" perform an element-wise vector multiplication """
function Mul(vector1, vector2)

    listVectorMul = []

     for i in _vector1, j in vector2 # 1:length(_vector1) #<---------

        #1. multiply items
        varMul =  i * j  #vector1[i] * vector2[i]

        #2. appendd to a `listVectorMul`
        append!(listVectorMul , varMul)

     end

     return listVectorMul

end


#lvl1
macro Name(arg)
    string(arg)
end


#lvl1
""" takes a string name , & a float value
assigns input string to a variable
Assumes string is not null nor missing """

function assignVariableToValue(stringName::AbstractString, varValue)

    #1. Get the decimal value # done
    decimalValue = convertToFloat(varValue)
    # !!!note: string cannot be assigned unless both name & value are present ( & not Null)

    #2. create a symbol variable from the stringName
    stringName = Core.Symbol(stringName)

    #3. Assign the value to the generated variable
    stringName = decimalValue #@Name(stringName)  #@macro_string_as_varname(stringName,decimalValue) #:($decimalValue)   # macro_string_as_varname(stringName,varValue) #string_as_varname(stringName,varValue)


    stringName # eval(_variable) # or esc(:($_variable = $decimalValue))
end


function trimSpaces(inputString)

    if isNullOrMissing( inputString) == true
        # Replace input, with  a  " space " string! [ isa character, i.e. a `space` " " ]
        return " "

    elseif isNullOrMissing( inputString) == true

         inputString = removeSpaces2(inputString) #removeSpaces2(inputString)
         #using julia built-in's for stripping the right, so do the left part of a string
         inputString = Base.lstrip(inputString)
         inputString = Base.rstrip(inputString)
    end

    return inputString

end


# lvl3:
#=
## assignVariableToValue(stringName, stringValue)
""" assigns input string to a variable
Assumes string is not null nor missing """
function assignVariableToValue(stringName, stringValue) # ready to be used

    stringValue = handleNullValue(stringValue)# Optional (but recommended)
    decimalValue = convertToFloat(stringValue) #tryparse(Float64,stringValue) # decimal value [non-isNullOrMissing]
    # !!!note: string cannot be assigned unless both name & value are present
    #_variable = #string_as_varname(string(stringName),decimalValue ) # now: _string = varValue(_string here)
    #TODO: call macro function
    #_variable = assignVariableToValue(stringName, decimalValue)
    _variable = macro_string_as_varname(stringName, decimalValue)

    return _variable #(stringName, decimalValue)
end


=#

# handleNull

## handleNull(_string,result="0.00") # WARNING: Context is **Inconclusive**
#  (replace it with either handleNullName or handleNullValue)
#review2 : a rough sketch, of a general form, of a null handling & compiling & is used - no need to depreciate

""" handles null input, by replacing string variable with designated result value """
function handleNull(_string,result="0.00") #Context is **Inconclusive** ( depends entirely on the context: either a variable name or value )

    #1. if string was null, assign result to it
    if isNull(_string) == true
        _string = result
    end

    #2. return `_string` whether null or not
     return _string

end


## handleNull(_string, result="0.00")

""" Handles input if it was null or equal to `""`
writes empty string of "" as "0.00", by default (user-changeable ) """ # adds meaning to the void
function handleNullValue(_string, result="0.00")

    #Introduce an extra step (before it, in the upper scope )
    #if _string is Null , assign result to it (as a decimalString)
        #_string =  string(result ) # ensure result is still a string
        _string = handleNull(_string,result)
        _decimal = convertToFloat(_string)

    println("NullValue: Nothing was Found & been handeled")
    #return _string
    return _decimal
end

#-----
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

    # string name should be not `null`("") or missing
        isFaulty = isNullOrMissing(stringInput)

    if isFaulty == true
        # assign the result(by default it is a variable ) to `varName`
        #!!!Note: transfrom `result` to string , whatever value it may have been
    	stringInput = string(result) # already assigned

    elseif isFaulty == false

        # Assign `stringInput` to `varName` = stringInput # return stringInput as varName
        #varName = stringInput
        #  extra: trimSpaces, (as variable name has no spaces)
        #!!!Note: adding other string ops is possible, below:
        stringInput =  string(stringInput) #trimSpaces( string(stringInput) ) #<-------
        #stringInput = trimSpaces(stringInput)

    end

    return stringInput #varName
end

## handleNullName(_string, result="variable")
#=
"""handles nullability: if input variable is null, or equal to `""`
writes empty variable as `variable`, by default (user-changeable )
"""#lvl2
function handleNullName(_string, result="variable")

    #_string = string(result)  #emsure result is a string

    _string = handleNull(string(_string), string(result) )
    println("NullName: Nothing was Found & been handeled ")
    return _string

end
=#

#=
# createVariable

"""reads variable name, reads a variable value from user prompt, checks both inputs
against being `nothing` ("") or `missing`. If both are valid, assigns them to a variable & return it

```
Output:
- a `variable`: has a name of a `varName` & a value of a `varValue`
```
"""
function createVariable()

    print("Debug: Enter create Variable")

    #1 read input  input
    varName = readVariableName()
    #varValue = readVariableValue() also this function compiles
    varValue = readVariableValue(varName) # !!!note: varName as input, to be displayed, is Optional

    #2. checking (& Handling)

    varName = handleNullName(varName)
    varValue = handleNullValue(varName)

    #3. Assign to a variable
    #- Assign them to each other [turns a string and decimal into a variable called $string ]
    varName = assignVariableToValue(varName,varValue) # now `varValue` is assigned to `varName`

    return varName

end
=#

println("handleNullName('') = ", handleNullName("" )) #works
println("handleNullName(nothing) = ", handleNullName(nothing ))

function processEmptyVariableName(isNullOrMissing)

    varname=""
    if isNullOrMissing == true
        println("Input was Null or Missing: please Insert a name for ",@Name(_string))
        varName = readVariableName(_string) # _string added as arg (new)

    elseif isNullOrMissing == false
    varName = _string
    end
    return varname
end

function processEmptyVariableValue(isNullOrMissing,_stringDecimal)

    #isNull = handleNullName(varName)
    # !!!note: all spaces are trimmed, automatically

    # return handle nullValue
    handleNullValue(isNullOrMissing, _stringDecimal)
    #= Do not repeat self

end


# readVariableName(varValue) # function takes 0 input argumentts
#readVariableName()


# checkNull

## checkNull(_string)
"""checks if input string is null (or not) """
function checkNull(_string)
    if isNull(_string) == true
        println("_string value is NULL, please check input,& try again later")
    elseif isNull(_string) == false
        return _string
    end
end

# isaAlphaString

## isaAlphaString(inputResult)

"""

"""
function isaAlphaString(inputResult) #Done

    condition = isNotNumeric(inputResult) #isatoz(inputResult) # in the form "a-z,A-Z" #WARNING: non-Numeric does not mean #isNotNumeric
    if condition == false
        return false
    elseif condition == true
        return true
    end
end
=#

# String Operations


#--------------
# Space detection & Handling
function removeSpaces2(inputString) #useful

    _string = inputString #copy(inputString)
    #@credits: "Fengyang Wang"
    result = filter(character -> !isspace(character), _string)
    return result
end

## removeSpaces2
"""
@credits: Fenyyang Wang
!!!Note: the use of the `filter` as a function of mapping
"""#lvl1
function removeSpaces2(inputString) #useful

     #copy(inputString)
    #1. filter out characters, which are not spaces
    #@credits: "Fengyang Wang"
    result = filter(character -> !isspace(character), inputString)
    #2. return results
    return result
end

# trimSpaces
#Refactored function [lvl2]
""" removes spaces in function input [lvl2]
Remove spaces in function input
trims both left & right spaces
it's ok if string was null i.e ""
but string should not be misasing
"""
function trimSpaces(inputString)

if isNullOrMissing( inputString) == false
    inputString = removeSpaces2(inputString) #removeSpaces2(inputString)
    inputString = Base.lstrip(inputString)
    inputString = Base.rstrip(inputString)
end

    return inputString

end

#=
""" Remove spaces in function input [lvl2]
trims both left & right spaces
it's ok if string was null i.e ""
but string should not be misasing
"""
function trimSpaces(_string)

    if isNullOrMissing( _string) == false #!== Missing  #missing # non-Bool (Missing) used in Bool context
        result = removeSpaces2(_string)
        _string = Base.lstrip(_string)
        _string = Base.rstrip(_string)

    end
    return _string
end
=#
#=

# isNumber
""" checks if input is of type `Number` """ #lvl1
function isNumber(valor)
    conditionIsNumber = isa(valor, Number)
    if conditionIsNumber == true
        return true

    elseif conditionIsNumber == false
        return false
    else

        throw(UnExpectedError(msg))
    end
end

# checkIsNumber

""" if input is of type `Number` return true, if not return false, otherwise
throw an `UnExpectedError` """ #lvl2
function checkIsNumber(valor)

    if isNumber(valor)
        return true
    elseif !isNumber(valor) # if not a Number
        return false
    else
        throw(UnExpectedError(msg))
    end
end

""" checks if a number is of type AbstractFloat
```
Output:

* true:  if valor is an AbstractFloat
* false:  if vaslor is not an AbstractFloat
* Nothing: if UnExpectedError Occured (whether it occurs at input arguments or at
the function's body)
```
""" # lvl1
function isNumber2(valor) # recommended
    return isa(valor, AbstractFloat) # takes true or false # or nothing if input isnot as expected
end
#-------
# handleNullAndMissing

## handleNullAndMissing(stringInput, kernelNullFunction=handleNullName)
""" returns the proper result, for missing or null string input  """
function handleNullAndMissing(stringInput, kernelNullFunction=handleNullName)
    #WARNING: doesn't handle exceptions
    #WARNING: unused
    result = 0.0 # decimal return
    condition = kernelNullFunction

    result  = kernelNullFunction(stringInput)

    return  result
end

#-----

# handleNullValue

## handleNullValue(stringInput,result=0.00)
#lvl1:
"""
handles the null input string as a floating decimal

```
Output:
```
-   `varValue`: a float represenation  of input

"""
function handleNullValue(stringInput,result=0.00)

	varValue = 0.00
	isFaulty = isNullOrMissing(stringInput)

	if isFaulty == true # the Given Input is Not Valid
	   # Assign the default result (0.00) to `varValue`
	   varValue = result

   elseif isFaulty  == false # the Given Input is valid
	   varValue = convertToFloat(stringInput)
	end

	return varValue
end

# handleNullOrMissing

## handleNullOrMissing(stringInput,result="0.0", kernelNullFunction=handleNullValue)

#lvl2:
""" handles null or missing, by passing a null-handling function """
function handleNullOrMissing(stringInput,result="0.0", kernelNullFunction=handleNullValue) # Practical

    # check condition :
    conditionNull, conditionMissing = getConditions(stringInput)
    condition = conditionNull || conditionMissing

    #Check if String is Null
    # Only one of the conditions is triggered
    if condition == true  #isMissing(stringInput) # a stopping condition

        # Pass-in the appropriate function that handles the Null
        stringInput = kernelNullFunction(stringInput, result )

    # Else: niether of conditions are tirggered
    # thus, string Input is valid ( and safe to get assigned  & used by functions)
    # Hence, assign `stringInput` to result

    elseif  condition == false #!conditionNull && !conditionMissing # if it's neither
        #do nothing
        #result = stringInput # REALIZE : it depends on result & its type
        #(howevcer we have 2 inputs, thus we got to have 2 different functions ,then 2 outputs)

    end
    result = stringInput
    return result
end

## handleNullOrMissingName(stringInput, result="variable")

#lvl3:
""" Handle null or missing name """
function handleNullOrMissingName(stringInput, result="variable")

    conditionNull, conditionMissing = getConditions(stringInput)
    resultingCondition = conditionNull || conditionMissing

    #1. If Only one of the conditions is triggered
    if  resultingCondition == true  #if Input is Invalid   # # a stopping condition

        #Handle a NullName

        #pass in the default `result` value
        result =  handleNullName(stringInput, result)

    # 2. otherwise, `stringInput` is valid
    elseif resultingCondition == false #if input is valid #!conditionNull && !conditionMissing # if it's neither [then, stringInput is fine]

        # Assign stringInput to result
        result = stringInput # !!!note : `stringInput` depends on result & its type [String]

    else
        throw(error(msg))
    end

    return result
end

## handleNullOrMissingValue(stringInput,result=0.00)

#lvl3:
""" Handle null or missing Value """
function handleNullOrMissingValue(stringInput,result=0.00)

    conditionNull, conditionMissing = getConditions(stringInput)
    resultingCondition = conditionNull || conditionMissing

    # If either one of the conditions is triggered
    if  resultingCondition == true    #  conditionNull || conditionMissing #isMissing(stringInput) # a stopping condition

        #Checks if String is Null

        #pass in the default `result` value
        result =  handleNullValue(stringInput, result)

    elseif resultingCondition == false # [hence, `stringInput` is OK]

        # Assign stringInput to result
        result = stringInput # !!!note : it depends on result & its type [String]

    else
        throw(error(msg))
    end

    return result
end


#--- Decimal functions

# toDecimalVal

## toDecimalVal(_string,d=2)
""" converts string  to a float64, after checking for being nothing("") or missing
~rounds to the 2nd decimal digit~

```
Output:
*   a Bool
"""

function toDecimalVal(_string,d=2) #  WARNING: d is unused

    _decimal = 0.0 #setting a deimal to 0.0  #nothing #nullable - not recommended
    if  isNullOrMissing(_string) # || _string == "" # isNullOrMissing cannot capture `Nothing` properly

        return _decimal

    elseif !isNullOrMissing(_string) # && _string != ""

            _decimal = convertToFloat(_string) # tryparse(Float64,_string) #digits=d)

    else
        throw( error("UnExpectedError Occured"))
    end
        return _decimal
end

""" converts a string to a decimal val  """
function toDecimalVal(_string) #  compiles

    _decimal = 0.00 #set default value, for a deimal to 0.0  #nothing #nullable - not recommended

    condition = isNullOrMissing(_string) || isaAlphaString(_string)

    if condition == true    #isNullOrMissing(_string) #|| _string == "" # isNullOrMissing cannot capture `Nothing` properly

        return _decimal

    elseif condition == false  #!isNullOrMissing(_string) #&& _string != ""

            _decimal = convertToFloat(_string) # tryparse(Float64,_string) #digits=d)

    else
        throw( error("UnExpectedError Occured"))
    end
        return _decimal
end

# checkInputIsValidOrRewind

# promptValue()
=#

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
    #println("Please enter the variable's decimal value, or input an escapeSequence to quit program ")

    # 1. Let User Input a value
    #_string= readline()

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

#--------


#checkInputIsValidOrRewind()

#lvl3
""" checks if inputString (by the user) is null or empty: if so,  then  it rewinds input  , otherwise if user wants to exit : enters one of the escapeSequences  """
function checkInputIsValidOrRewind(escapeSequence = escapeSequence) #inputString) #vital,  compiles

    # whenever inputString is null, or is Empty
    response = nothing
    println("checkInputIsValidOrRewind - welcome please enter a valid string, if null (``) function repeats,to escape use one of  escapeSequence words: bye,close,exit, kill, quit, terminate,...  ")
    inputResult = readline()    #readString2(inputString) #Rule: if nullable do not copy
    condition =  inputResult in escapeSequence
    #1. Check in is null, or missing  , or string is valid
    if  isNullOrMissing(inputResult)  &&  isaAlphaString(inputResult) == false        # isMissing(inputResult) || isNull(inputResult)  #|| isaAlphaString(inputResult) # string is valid
        response = checkInputIsValidOrRewind()
        #return checkInputIsValidOrRewind() # rewind this program

    #elseif isaAlphaString(inputResult) == true

    # If user wants to exit the program: then, if user-input matches one of an escapeSequence keyword:
    elseif condition # f inputResult in escapeSequence # lowercase(inputResult) in  escapeSequence #  compiles # if it's an escapeSequence


        println("BoolFlag = ", boolFlag ," user input was in escape sequence ... exiting Julia REPL ... ")#,$boolFlag)
        #exit()
        # return false
        response = false
    elseif !condition  #lowercase(inputResult) in escapeSequence == false #&& isaAlphaString(inputResult)  # if it's not an escapeSequence

        # replace with exit ..
        println("boolFlag = ", boolFlag, " NOT an escapeSequence. Input is a valid!  " )
         # return the valid  String - Plug-In Any function of Choice

        # return true
        response = true
    else
        throw(error(" Unexpected Input Occured "))
    end

    return response
end

#--------------

# parseStringToDecimal

## parseStringToDecimal(inputString)

""" assumes input been checked for null & missing
"""
function parseStringToDecimal(inputString)#,digits=2)

    _decimal = tryparse( inputString)  # round( tryparse( inputString)  ,  digits) #inputResult isa _decimal  #readString(inputString)
    println("Decimal variable is parsed, as expected")
    return _decimal
end

# checkHandleDecimalInput

## checkHandleDecimalInput(var, result = "0.0", nullKernel = handleNullValue)

#lvl4
""" handles a decimal input, if invalid, applies the `nullKernel` function, then it converts it to `Float64` """
function checkHandleDecimalInput(var, result = "0.0", nullKernel = handleNullValue) # vital #compiles

    conditionNull = isNull(var) #correct
    #println("typeof = ", conditionNull, typeof(conditionNull) )
    conditionMissing = ismissing(var)

    condition = isNullOrMissing(conditionNull,conditionMissing)

    floatVar = 0.00

    if isNullOrMissing(var) ==  false # when it's false
        println("isnullmissing isa `False stmt` ")

        #1. If `var` is valid, place it into `floatVar`
        floatVar = var

    elseif  isNullOrMissing(var) ==   true

        println("isnullmissing isa `True  stmt`")

        #2. Otherwise, if var is null, Apply a null kernel (of User's choice) to remove the issue
        floatVar = nullKernel(var, result)

    end

    # handle floatVar if it's missing
    #if isNullOrMissing (floatVar)
    #        floatVar = handleNullValue(floatVar, result)#<--------
    #    end

    #3. Convert the string value into a float variable
    floatVar =  convertToFloat(floatVar)

    floatVar = floatVar * 1.00 #WARNING: `floatVar` can be  Nothing !
    return floatVar
end

#DEMO:

println("check missing = ", isMissing(missing))

println("check isNull = ", ismissing(missing))
println("check isNull = ", isNull(""))

# checkNullOrMissing

#lvl3:
""" checks string if it is null or missing, if it does, handles the null condition """
function checkNullOrMissing(stringInput,result="0.0", kernelNullFunction = handleNullValue) # Practical

    #conditionNull =  isNull(stringInput)
    #conditionMissing =  isMissing(stringInput)

    conditionNull, conditionMissing = checkCondition(stringInput)
    condition = conditionNull || conditionMissing

    if condition == true # `stringInput` is Invalid:  a stopping condition

        stringInput = handleNullValue(stringInput, result)

    elseif condition == false  # `stringInput` is Valid

            result = convertToFloat(stringInput)
    end

    return result

end

#---- input functions

# promptVarName

numbers = [0,1,2,3,4,5,6,7,8,9]
function isNotNumeric(var)

    condition = var in numbers
    if condition == false
        return true
    elseif condition == true
        return false
    end

end

#DEMO
println("DEBUG: isNotNumeric")
isNotNumeric("kj")
println("End, DEBUG")

global usedStringNames = []


""" prompts & handles user's entered `varName`
for a given `varName`, check for null or missing
""" # preferred
function promptVarName(var= "varName" , escapeSequence=escapeSequence) # rechecked #TODO: trimSpaces()

    # take care of the Floating Number:
    # 1. If string was nothing(""), missing, or input was NOT a string Name
    if isNullOrMissing(var) == true #<--- var was null"" or missing
        # Handle it:
        #var = checkHandleDecimalInput(var) #WARNING: `var` can be `nothing ` #<------
        # stackOverFlow counter-mechanism, do something different, i.e.

        return " "
        #println("previous input is invalid! Rewind the function? [ (Y)es/(N)o ]")

        #=
        # To prevent an unncessary Infinite loop, Kindly Ask User if They want to Rewind with Options: [Y, yes , OR N, no ]
        _string = readline()
        # Handle the Null decimal value `var`
        isNull = handleNullName(var) # !!!note: all spaces are trimmed, automatically

        varName = processEmptyVariableName(isNull) #done

        #handle a valid [Y]es / [N]o Question
        response = checkYesOrNo(varName) #<---

        # handle the user-given response for Rewinding ([Y]es / [N]o), passing-in the handeled `var` value
        response = handleResponse(response, var, promptVarName)

        return var #response #var
        =#
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
        throw(error(msg))
    end

    #return var
end


println("DEBUG: PROMPTVAR() = ")
promptVarName()
println("DEBUG: END ")



#DEMO:
# println(promptVarName("")) # BUG: #removed trimSpaces() (input expects decimal string), input has been handeled [See: `demo3.jl` for demonstration]


##assignVariable(_string, var)

"""refactored function: assigns variableName `_string` to value `var` , then returns the resultant `variable` """
function assignVariable(_string, var)

    if isNullOrMissing(_string )
        _string = "variableName"

    elseif isNullOrMissing(var) #|| var = 0.0
        var = 0.0
    end

    variable = assignVariableToValue(_string,var)
    return variable

end




# promptUser

## promptUser(_string)
"""prompts user for input `_string` assigns a var then returns it
assumes function been checked for null or missing
-   Unclear Context : prompt for var Name or var value?
"""
function promptUser(_string) #TODO:checked  (either [call prompt] or check )

    # move to the outside scope
    #var = string_as_varname(_string) #1. make var as string
    #var = _string # 1. Assign string to this var
    #var = ""
    var = "variableName "

    println(" $prompt $var") # 3. concatenate with  var's value

    #1. prompt user for input

    varName = promptVarName()
    varValue = promptValue()

    #var = readline() # let user input # tryparse(Float64, input("$prompt " + decimalVal(stringInput,2)+"\n"))

    # 2. Assign string & value to a variable
    varName = assignVariableToValue(varName,varValue)

    #if null or missing, ensure to assign a meaningful value to this var
    #=
    resultFlag = isNullOrMissing(var)

    if resultFlag == true # if it's `nothing` or `missing`
            #Rewind: promptsUser for input again
            promptUser(_string) # RewrePrompt user for input

    elseif lowercase(var) in escapeSequence # TODO: finish condition  condition
        println("skipped succsessfully ")
        return var
    elseif resultFlag == false # user-input is a Valid String
        return var
    end =#

    return varName

end

## promptUser()
function promptUser()

    var = ""
    varName = readVariableName()
    resultFlag = checkNullOrMissing(var)
    handleNullOrMissing(resultFlag)

    varValue  = readVariableValue()
    resultFlag = checkNullOrMissing(varValue)
    handleNullOrMissing(resultFlag)

    assignVariableToValue(varName, varValue)# TODO: check its return

    return varName, varValue
end

#--- number functions

"""
returns the rational part of numerator & denominator

```
input:
    * **numerator**
    * **denominator**
```

```
Output:
    * **result**: a rational result of dividing numerator, over denominator
```

"""
function divideBy(numerator, denominator)# WARNING: Unused

    #check inputs not null
    result = nothing
    if isNull(numerator) == false && isNull(denominator) ==false #&&\
        if isEmpty(numerator) ==false && isEmpty(denominator) == false
            # math check:
            if denominator !=0 # denominator not equal zero
            #result = numerator //
                result = numerator // denominator
            elseif denominator == 0
                throw(error("ERROR: Divide by zero "))
            end
        end
    end
    return result
    #end
end
#=
"""
reads input from user
"""
function checkIsNull(stringInput, decimalsAllowed=2)

    _decimal= 0.0
    try
        _decimal =tryparse(Float64, Input(" $prompt " + decimalVal(stringInput,decimalsAllowed)+"\n"))

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


# redoing Readline here:

stringInput = "stringInput"
println(" $prompt $stringInput")
stringInput =  readline() #tryparse(Float64, input("$prompt " + decimalVal(stringInput,2)+"\n"))
stringInput = handleNullName(stringInput)
varInput = 100 #hardCoded , this time #readline()
varInput = handleNullValue(varInput)

var1 =  assignVariableToValue(stringInput, varInput) #string_as_varname(stringInput)
#println("var assigned as expected")


#------------

_decimal = "0.0" ;
println("_decimal = ",_decimal)
 _decimal = tryparse(Float64,_decimal) # round(tryparse(Float64,stringInput) )#,2)#::Float64, d)  # isa Nothing ->"nothing entered!" ||round(tryparse(Float64,stringInput)::Float64, d)  #digits=d) ||
println("_decimal is ", _decimal)
#_decimal = toDecimalVal(stringInput) #this needs more love

#------------

""" prompts user for input, reads user input, parses input, checks input sanity

```
Output:
*   returns `decimal`: a floating- point decimal value (rational), rounded to the 2nd
```
"""

# setString
function setString(stringInput)

    _decimal= 0.0
    #try
        #prompt
        #_decimal =tryparse(Float64, input("$prompt " + decimalVal(stringInput,2)+"\n")) #Input("$prompt " + decimalVal(stringInput,2)+"\n"))

        # reDoing Readline here:
        stringInput = "stringInput" #TODO: Create variable, with this name i.e.createVariable($stringInput)
        stringInput = trimSpaces(stringInput)

end


# readString2
""" unclear comtext: are we reading for string variable name, or variable value
as a variable has both a name & a value """
# assume this happened earlier:
#1.#println(" $prompt $stringInput")
#2. stringInput =  readline()

""" handles an expected  a Variable Name input  """

function readVariableName(stringInput)

    #1 handle null (or missing)
        #stringInput = handleNullOrMissing(stringInput)

        #1.check if Null
        stringInput = handleNullName(stringInput)

        nullMissingCondition =  isNullOrMissing(stringInput)

        if nullMissingCondition== true
        #2.handle null input

           stringInput = handleNullName(stringInput)

       elseif nullMissingCondition == false # keep its value
           stringInput = stringInput

       elseif stringInput in escapeSequence  # lowercase(stringInput) in escapeSequence
           exit()

       else
           throw(error(msg ))
       end

       #2. trim all spaces
        #asssumes it's been checked against the case for  `null` & `missing`

        stringInput = trimSpaces(stringInput)
        # assign a string, to a variable name

        return stringInput
end

# readVariableValue
## readVariableValue(stringInput)
""" expecting a decimal (float, rounded to 2 places )"""
function  readVariableValue(stringInput)

        #1. promot user to input
        println("please Enter a $stringInput's Decimal value")

        stringDecimal = readline()

         #2.check if Null
         if isNullOrMissing(stringDecimal)
         #3.handle null input

            stringDecimal = handleNullValue(stringDecimal) # now, input can be safely converted
        end
        #4. convert to Float
        _decimal = convertToFloat(stringDecimal)

        return _decimal
end


#helper function

#=
## checkAndConvert(stringInput)
""" checks if entry is nothing(""), or missing, then converts it to a floating-point """
function checkAndConvert(stringInput)

    #1.check if Null
    if isNullOrMissing(stringDecimal)

        #2.handle null input
       stringDecimal = handleNullValue(stringDecimal) # now, input can be safely converted
   end
    #3. convert to Float
   _decimal = convertToFloat(stringDecimal)

   return _decimal
end
=#

#=
function handleIfNotNullOrMissing(stringInput)

    if !checkNullOrMissing(stringInput)

    end

end=#

# updateVariableName

## updateVariableName(stringInput1::String,stringInput2::String)

function updateVariableName(oldString::String,desiredString::String)



    # 1. Check & handle nullability of string Inputs

    oldString = handleNullName(oldString)
    desiredString = handleNullName(desiredString)

    # 2.  update strings
    oldString = desiredString

    return oldString
end

function updateVariableValue(oldDecimal, desiredDecimal )   #::Float64, desiredDecimal::Float64)
        #1. check decimal input is a number


        #if !checkIsNumber(_decimal2)
        #    _decimal2 = handleNullValue(_decimal2)
        #end

        oldDecimal = handleNullValue(oldDecimal)
        desiredDecimal = handleNullValue(desiredDecimal)

        #2. checks for null, if so , handles it, then converts it into a decimal
        oldDecimal = convertToFloat( oldDecimal)   #checkAndConvert(oldDecimal)

        desiredDecimal = convertToFloat( desiredDecimal)

        #3.Replace  : replace _decimal1 with _decimal2 [not a Swap]
        oldDecimal =  desiredDecimal  # = _decimal2, _decimal1

        return oldDecimal
end


#=
function updateVariableValue(decimal1::Float64, _decimal2::Float64)
        #1. check decimal input is a number

        _decimal1 = checkIfNotANumber(_decimal1)

        _decimal2 = checkIfNotANumber(_decimal2)

        #2.Replace  : replace _decimal1 with _decimal2 [not a Swap]
        _decimal1 =  _decimal2  # = _decimal2, _decimal1

        return _decimal2
end
=#
#--- string functions

# readString2

#=
## readString2(stringInput)
function readString2(stringInput)

        #TODO: transfer to `prompt User` function

        # Commence reading sequence:
        #1. prompt user for input
        println(" $prompt $stringInput")

        stringInput =  readline() #tryparse(Float64, input("$prompt " + decimalVal(stringInput,2)+"\n"))
        #check stringInput isNull
        # decimalVal call (uses isNull implicitly) then tries to parse content, returns decimal

        #function  not assigned , won't work @(args)
            #body
    #    end
    # start here:
        # 1. handle null or missing
        # stringInput = missing # debugging mode only
        # at this stage: after null, misso
        stringInput = handleNullOrMissing(stringInput)
        # for missing , you cannot do rstring & lstring


        #=
        if isNull(stringInput) || isMissing(stringInput)

                #Check String for Null
                if isNull(stringInput)
                    handleNull(stringInput)
                end

                if isMissing(stringInput)
                    handleMissing(stringInput)
                end
        end
        =#

        #2. trim all spaces
            #asssumes it's been checked against the case for  `null` & `missing`
            #stringInput = trimSpaces(string(stringInput) )
            # assign a string, to a variable name

                # Cannot do that, there is only 1 stringInput ( for a name string)
                #    stringInput = assignVariableToValue(stringInput) # Assuming: Input is meaningful (refers to a meaningful name )
                # Returns the var's name

                #
                #old
                #_decimal =  assignVariableToValue(stringInput) #string_as_varname(stringInput)

                #1. check null
                #1.1. empty (or missing) input
        #=
                if isNull(stringInput) == true || isMissing(stringInput) == true #either input isa "" or missing
                    #
                    _decimal = 0.0
                    return _decimal
                #1.2. Input not empty
                elseif isNull(stringInput) == false && isMissing(stringInput) == false # checks if input isa "" or
        =#

        # if isNullOrMissing(stringInput) == true # done
        println("isNullOrMissing been triggered")
        stringInput = handleNullName(stringInput) #handleNullOrMissing(stringInput) #<-- it makes it null

        var = "0.0"
        #input var
        var = readline()
        println("typeof()=",typeof(var) )
        var = handleNullOrMissingValue( var )
        println("typeof()=",typeof(var) )

        #now handle variable value

        ##  stringInput = handleNullOrMissing(stringInput)
        end

        #2. trim All Spaces
    #    stringInput = trimSpaces(stringInput)

        #3. Parse to decimal
        #_decimal = toDecimalVal(var)
        println("_decimal = ", _decimal)

        stringInput = assignVariableToValue(stringInput, _decimal)

        return stringInput #_decimal

        #end
            #catch UnExpectedError
        #        @error "ERROR: Please recheck input: ", exception=(UnExpectedError, catch_backtrace())
        #     end
end=# # UncommentMe

function readString3(stringInput) # 1. In category

        # Commence reading sequence:
        #1. prompt user for input
        #println(" $prompt $stringInput") # do prompt, bfore in the upper scope of the funcion , before calling this line


        stringInput =  readline() #tryparse(Float64, input("$prompt " + decimalVal(stringInput,2)+"\n"))
                #check stringInput isNull
                # decimalVal call (uses isNull implicitly) then tries to parse content, returns decimal

        #stringInput = ""
        #stringInput = ""

        handleNullOrMissing(stringInput)

        stringInput = "valuableAccount" #nothing
        # at this stage: after null, misso
        stringInput = handleNullOrMissing(stringInput)
        # for missing , you cannot do rstring & lstring


        #=
        if isNull(stringInput) || isMissing(stringInput)

                #Check String for Null
                if isNull(stringInput)
                    handleNull(stringInput)
                end

                if isMissing(stringInput)
                    handleMissing(stringInput)
                end
        end
        =#
        #asssumes it's been checked against the case for  `null` & `missing`
        stringInput = trimSpaces(stringInput)
        var = assignVariableToValue(stringInput) # Assuming: Input is meaningful (refers to a meaningful name )
        # Returns the var's name

        #
        #old
        #_decimal =  assignVariableToValue(stringInput) #string_as_varname(stringInput)

        #1. check null
        #1.1. empty (or missing) input
        #=
        if isNull(stringInput) == true || isMissing(stringInput) == true #either input isa "" or missing
            #
            _decimal = 0.0
            return _decimal
        #1.2. Input not empty
        elseif isNull(stringInput) == false && isMissing(stringInput) == false # checks if input isa "" or
        =#

        stringInput = handleNullOrMissing(stringInput)

        #2. trim All Spaces
        stringInput = trimSpaces(stringInput)

        #3. Parse to decimal

        _decimal = toDecimalVal(stringInput)
        println("_decimal = ", _decimal)

        #    return _decimal
        #end
    #catch UnExpectedError
#        @error "ERROR: Please recheck input: ", exception=(UnExpectedError, catch_backtrace())
#     end
end


"""
#mini-algorithm, for camelToes:
#as easy as 1,2,3:
#Note:  < assumes spaces on the side has already been dealth with >

*   1. Locate a space , get its location
*   2. Increment by 1 , there should be another character (i.e. not a space )
*   3. UppperCase the character, at that Position (i.e `.uppercase()`)

"""
function setStringVar(stringInput) # readString -> setString

    #stringInput = "stringInput"
    println(" $prompt $stringInput")

    #1. ReadLine from user
    stringInput =  readline() #tryparse(Float64, input("$prompt " + decimalVal(stringInput,2)+"\n"))

    #2. Handle nothing("") or missing (if any)
    stringInput = handleNullOrMissing(stringInput)

    #3. Trim spaces
    stringInput = trimSpaces(stringInput)

    #4. Assign value to var,  Assuming: Input is meaningful (refers to a meaningful name ) #cannot, only prompted user for (1) value
    #TODO:comment Line # var1 =  assignVariableToValue(stringInput, _value) #was @string_as_varname(stringInput, _value)

    return stringInput  # return `stringInput` only (instead of var1)

end



# DEMO - Example - [note: there is something `funny` about using `rstrip`, `lstrip`] # TODO: Comment it

_str = "sample string "
_str = rstrip(_str)
println("_str", _str)
_str = lstrip(_str)
println("_str", _str)

#How to locate space in the middle?


#trimSpaces(_s)
#readString2(_str) #returns decimal represenation of string # <-------------
#readString(_str)
#checkInputIsValidOrRewind(_str)

#----
#TODO: refactor complete program here ...
"""
totalAssets =  #passmissing(readString)
totalCapital = # passmissing(readString).
totalLiabilities = #passmissing(readString).

sales, earnings, retainedEarnings = calcsales_earnings()
#TODO: calculate z
z = calcCapital(totalAssets,totalLiabilities)
score = z_handling(z)

#TODO: decision making (i.e. what to do about it )

result = z_result(score)

end
ZScore: a survival Indicator value, classifies a Compay, based on its value
"""
#--- Z-Cutt-off Score
""" returns the Z-Score cuttoff
function calcZScore()
    #TODO
end
##-- Result: Decision making: based on paper
"""
function calcZ(score)

    #comments on the score [based on the mentioned paper] (due to the following):
    #1. z-score < 1.18 -then-> (Most likely to be ) Bankrupt!
    #2. 1.81 < z-score < 2.99 -then-> "Stable #ok, (in between) #unsure Region!!
    #3.  z-score > 2.99 -then-> "Safe Zone"

    #me: note: h
    # totalZscore = element-wise Vector Product

end

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


# =#
#DEMO

println("promptVarName = ", promptVarName  )


##preferred
""" initializes a new variable """
function initVar(initialValue=0.00)

    return initialValue
end


""" sets a corresponding variable name, from a string input """
function setVariable()

    plsMsg = "please enter"
    println("$plsMsg a variable name ")

    variable = promptVarName()# prompt variable using the string's value

    println("$plsMsg a variable value ")

    var  = promptValue()
    variable = assignVariableToValue(variable, var)
    #checkResponse()
    return variable


    variableName = handleNullName(_string)
    variableName = trimSpaces(variableName) #corrected

    _value = handleNullValue(varValue)

    _value = convertToFloat(_value)

    variableName = assignVariableToValue(variableName, _value )

    variableName
end

""" creates a new variable from `_string` , and prompts user to input a  `varValue` to `_string` variable
"""
function setVariable(_string="varName") #updated


    #variable= promptVarName(_string) #"$_string")# prompt variable using the string's value
    variable = handleNullName(_string)
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


#DEMO: createVariable(_string)
setVariable("Cash",100) #compiles # createVariable


#--- Altman Coefficients a1, a2, ..., an

#--- marketCapital

# promptMarketCapital

"""prompts user to input the `marketCapital` variables  (not the book Capital):
1. stockPrice
2. sharesOutstanding """

function promptMarketCapital(stockPrice = "stockPrice", sharesOutstanding = "sharesOutstanding") #compiles

    # 1. set `marketCapital` variables
    stockPrice =  setVariable(stockPrice)
    sharesOutstanding =  setVariable(sharesOutstanding)

    # 2. concatenate them into a vector
    _vector = [stockPrice, sharesOutstanding]
    _vector
end



function getMarketCapital(stockPrice, outstandingShares, outstandingSharesName="outstandingShares", stockPriceName = "stockPrice")

        # 1. set `marketCapital` variables
        #outstandingShares = setVariable(outstandingSharesName) #createVariable(outstandingShares)
        #stockPrice =  setVariable(stockPriceName) # createVariable(stockPrice)
        _vector = promptMarketCapital(outstandingSharesName, stockPriceName)
        # 2. concatenate them into a vector
        _vector = [outstandingShares, stockPrice ]

        # 3. return result
        _vector

end


## getMarketCapital(stockPrice, outstandingShares, outstandingSharesName="outstandingShares", stockPriceName = "stockPrice")

""" returns a vector of newly set `marketCapital` variables """
function getMarketCapital(stockPrice, outstandingShares, outstandingSharesName="outstandingShares", stockPriceName = "stockPrice")

        # 1. set `marketCapital` variables
        _vector = promptMarketCapital()

        # 2. concatenate them into a vector

        _vector = [outstandingShares, stockPrice ]

        # 3. return result
        _vector
    end
end


""" performs point-wise Multiplication with each element in vector input `_vectorMarketCapital`  """
function calcMarketCapital(_marketVector)

    #multiply all its elements, the get back  the total figure
    Mul(_marketVector)
end




""" Allow user to input sales variables
1. sales
2. EBIT
3. retainedEarnings

"""
function promptSalesEarnings(sales = "sales",ebit = "ebit", retainedEarnings = "retainedEarnings")
    sales =  setVariable(sales)
    ebit = setVariable(ebit)
    retainedEarnings = setVariable(retainedEarnings)

    vSales= [sales, ebit, retainedEarnings] #(sales, earnings, retainedEarnings)
    vSales
end

""" Reads input string variables , prompts user to input decimals, assigns variables
to `sales`, `ebit`, `retainedEarnings`

```
Input:
-   `sales`: string
-   `ebit`: string
-   `retainedEarnings`: string
```

```
Output:
*   vSales = [sales, ebit, retainedEarnings]
```
"""
function getSalesEarnings(sales="sales", ebit="ebit", retainedEarnings="retainedEarnings") #_string="SalesEarnings")  #sales,ebit retainedEarnings)

    vSales = promptSalesEarnings()

    vSales #[ sales, ebit, retainedEarnings ] #vSales

end

""" Calculates total sales """
function calcSalesEarnings(vEarnings)

    totalSales = Sum(vEarnings)

    return totalSales

end

#--- Altman Coefficients a1, a2, ..., an

## Accounting 5 Ratios

#--- Accounting Ratios

# X1( workingCapital, totalAssets )

""" X1 = workingCapital over totalAssets """ # requires workingCapital pre-calculation
function X1(workingCapital , totalAssets)

    result = workingCapital / totalAssets
    return result
end

# X2( retainedEarnings, totalAssets )

""" X2 = retainedEarnings over totalAssets """
function X2(retainedEarnings , totalAssets=1000) # <----------- totalAssets isa Nothing("")
    retainedEarnings = handleNullName(retainedEarnings)
    retainedEarnings = handleNullValue(retainedEarnings)

    totalAssets = handleNullName(totalAssets)
    totalAssets = handleNullValue(totalAssets)


    return retainedEarnings / totalAssets
end


# X3( EBIT, TotalAssets)

""" X3 = earnings (before Interest & Tax) over TotalAssets """
function X3(EBIT, TotalAssets)

    EBIT = handleNullName(EBIT)
    EBIT = handleNullValue(EBIT)
    totalAssets = handleNullName(totalAssets)
    totalAssets = handleNullValue(totalAssets)

    setVariable()

    return EBIT / TotalAssets
end


# X4(marketCapital , totalDebt)

""" X4 = marketCapital over Total Debts Ratio """
function X4(marketCapital , totalDebt)

#=
    marketCapital = handleNullName(marketCapital)
    marketCapital = handleNullValue(marketCapital)
    totalDebt = handleNullName(totalDebt)
    totalDebt = handleNullValue(totalDebt)
=#
    marketCapital = setVariable(@Name(marketCapital),marketCapital)
    totalDebt = setVariable(totalDebt)

    return marketCapital / totalDebt
end


""" X5 = sales over totalDebt Ratio """
function X5(sales, totalAssets )

    sales = handleNullName(sales)
    sales = handleNullValue(sales)
    totalAssets = handleNullName(totalAssets)
    totalAssets = handleNullValue(totalAssets)

    return sales / totalAssets
end

#--------------
#Demo #3: Sales:

#1. Prompt User for input
println("setVariable:")
totalAssets = setVariable("totalAssets")
totalAssets = setVariable("totalAssets",1000) #<------- # createVariable

println("totalAssets", totalAssets)
println("end of setVariable")

#vSales = getSalesEarnings("sales", "ebit", "retainedEarnings")
sales =  setVariable("sales")
ebit = setVariable("ebit")
retainedEarnings = setVariable("retainedEarnings") #setVariable

# sales,ebit,retainedEarnings = handleNullValue(vSales[1]) , handleNullValue(vSales[2]), handleNullValue(vSales[3])
sales,ebit,retainedEarnings = handleNullValue(sales), handleNullValue(ebit), handleNullValue(retainedEarnings)
vSales = [sales,ebit,retainedEarnings] # dummy
println("retainedEarnings = ", retainedEarnings, " typeof() = ", typeof(retainedEarnings))
#sales,EBIT,retainedEarnings = getSalesEarnings("sales", "ebit", "retainedEarnings")

totalSales = calcSalesEarnings(vSales) # totalSales

#retainedEarnings = initVar()
#retainedEarnings =vSales[3]
#TODO
#r2Ratio = X2(retainedEarnings, totalAssets) #< -------------


# show Sales vector components:
#sales = vSales[1]
#ebit = vSales[2]

#retainedEarnings = vSales[3]
println("sales = ",sales, "ebit = ", ebit, "retainedEarnings = ", retainedEarnings)

#2. calculate total sales & earnings
totalSales = calcSalesEarnings([100,150,300])
println("totalSales = ", totalSales )


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


function getAltmanZ(_in=[1.2, 0.3, 0.4, 0.2, 1.1], _weights=[1.2 , 1.4 , 3.3 , 0.6 , 0.999])

    _mul=1
    isFineToMultiply = false
    if areDimsEqual(_in, _weights)
        isFineToMultiply = true

    end

    if isFineToMultiply == true

        _mul = _in' .* _weights
    end
    return _mul

end


# Demo #4: Altman:
#hardCoded weightVariables:

_in = [1.2, 0.3, 0.4, 0.2, 1.1]
weightVariables = [1.2 , 1.4 , 3.3 , 0.6 , 0.999] #[a1=1.2 , a2=1.4 , a3=3.3 , a4=0.6 ,a5 = 0.999]

getAltmanZ(_in, weightVariables)


"""
Altman Coeffecient formula

sums up Altman's z-score equation (as provided in the enclosed academic paper)
Requires:
8 items, as 8 User-inputs :

1. totalAssets
2. totalLiabilities
3. workingCapital = (currentAssets)
4. retainedEarnings
5. EBIT (Earnings Before Interest & Taxes)
6. totalDebt
7. outstanding shares
8. sales

x1 = workingCapital / TotalAssets
x2 = retainedEarnings / TotalAssets
x3 = EBIT / TotalAssets
x4 = marketCapital = (outstanding shares * current Stockprice) (market Value of  Equity) / totalDebt
x5 = sales / TotalDebt

## MarketCap
MarketCap market Value of  Equity = outstanding shares * stockPrice

How much the firm's assets can decline, in value

"""


#this function has no implementation yet
#=
function getAltmanZ(totalAssets,totalLiabilities, workingCapital,
    retainedEarnings, totalDebt, EBIT, sales, # weights
      a1=1.2 , a2=1.4 , a3=3.3 , a4=0.6 ,a5 = 0.999 )

    capital = copy(calcCapital(totalAssets,totalLiabilities))
    #workingCapital #- meaningless

    z = a1 * X1(workingCapital,totalAssets) #req:working capiyal
    +a2 * X2(retainedEarnings,totalAssets)
    + a3 * X3(earnings,totalAssets)
    + a4 * X4(capital, totalLiabilities) # X4 = capital / totalLiabilities
    + a5 * X5(sales, totalAssets)

    return z

end
=#


#--- Altman Coefficients

# calcWorkingCapital


""" calculates the `workingCapital` of a company , using `currentAssets` & `currentLiabilities`"""
function  calcWorkingCapital(currentAssets,currentLiabilities)
    println("DEBUG: typeof(currentAssets) = ",typeof(currentAssets), " typeof(currentLiabilities) =", typeof(currentLiabilities))
    totalBalance =  currentAssets - currentLiabilities
    return totalBalance
end


# getCurrentLiabilities

## getCurrentLiabilities [no input arguments]

# getCurrentLiabilities


""" getCurrentLiabilities, from the user """
function getCurrentLiabilities(notesPayable="notesPayable",accountsPayable="accountsPayable",accruedExpense="accruedExpense",unearnedRevenue="unearnedRevenue")

    println("DEBUG: getCurrentLiabilities: ")

    notesPayable =  setVariable(notesPayable)

    accountsPayable = setVariable(accountsPayable)

    accruedExpense = setVariable(accruedExpense)

    unearnedRevenue = setVariable(unearnedRevenue)

    longtermDebt = setVariable(longtermDebt)

    _vector = [notesPayable, accountsPayable, accruedExpense, unearnedRevenue, longtermDebt]

    _vector

end


# getCurrentLiabilities1(floatVar, stringVar)
function getCurrentLiabilities1(floatVar=[142, 261, 175, 154, 168], stringVar=["notesPayable","accountsPayable","accruedExpense","unearnedRevenue","longtermDebt"] )

    notesPayable = stringVar[1]; accountsPayable = stringVar[2]; accruedExpense = stringVar[3]; unearnedRevenue = stringVar[4]; longtermDebt = stringVar[5]

    notesPayable = setVariable(notesPayable, floatVar[1]) #notesPayable)

    accountsPayable = setVariable(accountsPayable,floatVar[2]) #accountsPayable)

    accruedExpense = setVariable(accruedExpense, floatVar[3]) #accruedExpense)

    unearnedRevenue = setVariable(unearnedRevenue, floatVar[4]) #unearnedRevenue)

    longtermDebt = setVariable(longtermDebt, floatVar[5])

    _vector = [notesPayable, accountsPayable, accruedExpense, unearnedRevenue, longtermDebt]
    return _vector

end


## getCurrentLiabilities(floatValues , )
#TODO:Recheck
function getCurrentLiabilities(floatValues=[142, 261, 175, 154, 168], stringNames=["notesPayable","accountsPayable","accruedExpense","unearnedRevenue","longtermDebt"])

    #notesPayable =  setVariable(notesPayable)
    #accountsPayable = setVariable(accountsPayable)
    #accruedExpense = setVariable(accruedExpense)
    #unearnedRevenue = setVariable(unearnedRevenue)
    #longtermDebt = setVariable(longtermDebt)
    #conditionEquality = areDimsEqual(stringNames,floatValues)

    _listCurrentLiabilities = []

    vCurrentLiabilities = []
    index = 0
    #if conditionEquality == true
        for _ in stringNames # as easy as 1,2,3:

            #1. Increment the index, by (1) One
            index = index + 1
            #2. Create a new variable from string in vCAssets & float in vFloat vectors, accordingly
            varCurrentLiability =  setVariable(stringNames[index],floatValues[index]) # create a variable #<----------

            #3. Append: the `varCurrentLiability` into the `vCurrentLiabilities` vector list
            append!(vCurrentLiabilities,   varCurrentLiability )
            index = index + 1
            #TODO:Recheck
            currentLiability =  setVariable(stringName[index], floatValues[index])

            append!(_listCurrentLiabilities, currentLiability)
        end

    return _listCurrentLiabilities

    #_vector # [notesPayable, accountsPayable, accruedExpense, unearnedRevenue, longtermDebt]

end


#--- current liabilities
# calcCurrentLiabilities
function calcCurrentLiabilities(vCurrentLiabilities)

    totalCurrentLiabilities = Sum(vCurrentLiabilities)
    totalCurrentLiabilities
end

## totalLiabilities()
""" prompts user to input totalLiabilities """

function getTotalLiabilities( totalLiabilites= "totalLiabilities")

    totalLiabilites =  setVariable(totalLiabilites)

    return totalLiabilites

end


# Demo # currentLiabilities
#TODO: UncommentMe
#currentLiabilities = getCurrentLiabilities([142, 261, 175, 154, 168]) #-------

#----------

#=
"""
# max(capital , liability)
#return max(capital, liability) - min(capital, liability)

return  capital - liability
end
"""
#-- max capital
=#

# CurrentAssets

## getCurrentAssets

## getCurrentAssets(vCurrentAssetsPrices, vCurrentAssets)

""" Checks input vectors, if equal, it creates an element-wise variable from each input
```
Output:

- _listVariables: list of variables
```
"""
function getCurrentAssets(vCurrentAssetsPrices, vCurrentAssets=["cash","accountsReceivable","Inventory","Securities","commercialPaper",
    "treasuryNotes","Other"] ) # = [100.25,120.50, 200.75, 150.75, 100.50, 60.50, 90.00],  = [cash,accountsReceivable,inventory,securities,
    #commercialPaper,treasuryNotes,other]) # <---

    conditionEquality = areDimsEqual(vCurrentAssets,vCurrentAssetsPrices)
    _listVariables = []

    # 1. check dimensional equality condition
    if conditionEquality == true

        #2. loop all the vector (of names and prices ) , set then append to list
        for i in 1:length(vCurrentAssets)

            var = setVariable( vCurrentAssets[i], vCurrentAssetsPrices[i])
            _listVariables = append!( _listVariables, var )

        end
    end

    # 3. return list
    _listVariables

end


# calcCurrentAssets(vCurrentAssets)
"""
Sums up & gets the total of every variable, in a vector list & returns `currentAssets` total

!!!Note: other is optional (some companies may include other  not mention objects,
 value is calculated into other, seperately, then passed into this function
 not to mention a company could state other entitites, which the  user has
 to precalculate those stated figures, and state the subtotal under `others`  )

- In general, For `currentAssets` we need:

     1. Cash
     2. AccountsReceivable
     3. Inventory
     4. Securities
     5. CommercialPaper
     6. TreasuryNotes
     7. Other (if exists)

     !!!Note: input would be best as a vector, of currentAsset variables above vCurrentAssets
     Assets  = CurrentAsset ( is a concept, less than the  bussiness's set year timespan) + non-current Asset (more than  bussiness's set timespan  )

"""
function calcCurrentAssets(vCurrentAssets) #  [cash,accountsReceivable,inventory,securities,commercialPaper,treasuryNotes,other])

    totalCurrentAssets = Sum(vCurrentAssets)

    totalCurrentAssets

end


#e.g.
# vCurrentAssetsPrices = [100,120, 200, 150, 100, 60, 90])


# calcCurrentAssets(vCurrentAssets)
"""
!!!Note:
 CurrentAsset ( is a concept, which spans for  less than the  bussiness's set year timespan  )
"""
function calcCurrentAssets(vCurrentAssets) # [cash, accountsReceivable,inventory,securities,commercialPaper,treasuryNotes,other]

    println("Debug: calculating Current Assets ")

    currentAssets = Sum(vCurrentAssets)

    currentAssets

end


#DEMO : currentAssets
println("calcCurrentAssets")

# _vector = getCurrentAssets2() # [100, 200, 140, 150, 120, 140,120]
_vector = getCurrentAssets([100.25,120.50, 200.75, 150.75, 100.50, 60.50, 90.00])

currentAssets = calcCurrentAssets( _vector)   #[100, 200, 140, 150, 120, 140,120])
println("currentAssets are equal to $currentAssets")


function promptCurrentAssets(cash = "cash", accountsReceivable="accountsReceivable", inventory = "inventory", securities = "securities", commercialPaper = "commercialPaper",
     treasuryNotes = "treasuryNotes", other = "other") #cAssetNames=["cash","accountsReceivable"])

    cash = setVariable(cash)
    accountsReceivable = setVariable(accountsReceivable)
    inventory = setVariable(inventory)
    securities = setVariable(securities)
    commercialPaper = setVariable(commercialPaper)
    treasuryNotes = setVariable(treasuryNotes)
    other = setVariable(other)

    _vector = [cash,accountsReceivable,inventory, securities, commercialPaper,treasuryNotes,other]
    _vector
end

""" sets and returns current Asset variables
returns `currentAssets` figure"""
function setReturnCurrentAssets()

    # 1. prompt user, for input
    _vector = promptCurrentAssets() #[cash,accountsReceivable,inventory, securities, commercialPaper,treasuryNotes,other]

    # 2. calculate `currentAssets`
    currentAssets = calcCurrentAssets( _vector)

    # 3. return `currentAssets`
    currentAssets
end

#--- totalAssets

#getTotalAssets

## getTotalAssets(totalAssets = "totalAssets")

""" prompt user to input totalAssets """
function promptTotalAssets(totalAssets = "totalAssets") #practica*+l

    totalAssets = setVariable(totalAssets) #setVariable(totalAssets)

    totalAssets
end


## getTotalAssets(totalAssetsValue, totalAssets)

function getTotalAssets(totalAssetsValue, totalAssets = "totalAssets") # more practical

    totalAssets = setVariable(totalAssets,totalAssetsValue) #setVariable(totalAssets)
    totalAssets
end

currentAssets = setReturnCurrentAssets()


#----
# Demo #5:
# currentassets

#Demo : getCurrentAssets
# _vector = getCurrentAssets() # [100, 200, 140, 150, 120, 140,120] # ERROR: `accountsReceivable` is Undefined

currentAssets = calcCurrentAssets( _vector)   #[100, 200, 140, 150, 120, 140,120]) getCurrentAssets(vCurrentAssetsPrices = [100.25,120.50, 200.75, 150.75, 100.50, 60.50, 90.00], vCurrentAssets=[cash,accountsReceivable,inventory,securities,
#    commercialPaper,treasuryNotes,other]) #a

#currentAssets = getCurrentAssets2() #input("please enter 'Current Assets' ") # not functioning, as expected

println(calcCurrentAssets)

#getCurrentAssets
# Demo:
_list = [1,2,3,4,5]
println("DEBUG: Sum() = ", Sum(_list) ) # returns correct ansewer [Unless given list is of type `nothing`]

cAssets = getCurrentAssets([100,200,300,100,402,521,530] ,["cash", "accountsReceivable","inventory",
    "securities", "commercialPaper","treasuryNotes","other"]) #[100,200])
_sumAssets = calcCurrentAssets(cAssets) #<-------

println("typeof (_sumAssets) = ",typeof(_sumAssets))

#TODO: UncommentMe
#=
cLiabilities = getCurrentLiabilities() #<--------
_sumLiabilities = calcCurrentLiabilities(cLiabilities)

calcWorkingCapital(_sumAssets, _sumLiabilities) #<-----
=#
#---------
#=
function calcRetainedEarnings()

end
=#

"""
calculates working capital from
1. Current Assets
2. Current Liabilities


1. workingCapital
2. sales & Earnings

1. workingCapital = currentAssets - currentLiabilities

"""
function calcworkingCapital(currentAssets,currentLiabilities)

    #treat those as dummy variables
    #cAssets  = abs(currentAssets)
    #cLiabilities = (currentLiabilities)
    #need to review related functions
    #--- Capital function

    workingCapital = currentAssets - currentLiabilities #max(cAssets , abs(cLiabilities) ) - min( cAssets, cLiabilities  )

    return workingCapital
    #captial  = calcCapital() #UncommentMe

    # sales , earnings , retained_earnings =  calcsales_earnings()
end

#--- prompt for accounting trinity : Assets, liabilities, &  Capital

#=
# update :

prompts user to Directly enter the 3 accounts:
1. Capital (in report: is only the `bookValue` while the market Capital is
actually fluctuating. its value is based on current stockPrice &
number of sharesOutstanding)

1. Assets
2. Liabilities

=#
"""promots user for 3 inputs: capital , liability, asset """
function main_3Accounts() #WARNING: Unused

    capital = setVariable("capital") #passmissing(parse).(Float64, input("$prompt 'capital'\n")))
    liability  = setVariable("liability") # passmissing(parse).abs(Float64, input("$prompt 'liability'\n")))
    asset  = setVariable("asset") #passmissing(parse).abs(input("$prompt 'asset'\n"))

    capital , liability,  asset
end

#--- Asset functions

# Total Assets
"""

calculates Assets, from Total Capital  & Liabilties
    Assets =  Capital - Liabilities
```
Input
```
1. totalCapital
2. totalLiabilities


Q1. what if `Capital` is negative?
Q2. what if `Liabilities` value is negative #doesn't make much #sense

```
Output
```
-Returns capital & liability [As is]
"""
#calctotalAssets


""" calculates totalAssets from """
function calctotalAssets(totalCapital,totalLiabilities) #
    # if someone can get totalCapital, totalLiabilities then:
# Assets = totalCapital - totalLiabilities

    #totalcapital = capital(totalCapital) #
    #liability = liability(totalLiabilities)
    totalAssets =  totalCapital - totalLiabilities
    return totalAssets

end


# calcTotalAssets
"""
Calculates Assets (from totalCapital, & TotalLiabilties)

```
Input
```

Q. what if Capital is Negative? (below 0 ) ( doesn't make sense) #non-sense
Q. what if Liability is Negative? (more Accounts Recievables #busiess is Flourishing!)


"""


# gettotoalAssets
function calcTotalAssets()

    # Equation : capital = Assets - totalLiabilities
    capital = capital(totalCapital)

    liability = liability(totalLiabilities)

    return capital , liability
end

#  calcTotalAssets
## calcTotalAssets(totalCapital, totalLiabilities)
"""
    calculates the accounts' totalAssets
    !!!note: do not change the accounts' negative values
    (it is normal for accounts to have both negative & Positive valued polarities)

"""
function calcTotalAssets(totalCapital, totalLiabilities)

    capital = capital(totalCapital)

    liability = liability(totalLiabilities)

    return capital, liability
end


#=
function checkResponse() # usure, yet # @ depreciate
    response = nothing
    #checkInputIsValidOrRewind() #readString("Cash") #passmissing(parse).(Float64, input("$Cash and cash equivalents" )) # 1. Accounts Receivable
    if response == true
        # cash =
    end

end
=#


## --- calculates Working Capital (from currentLiabilities & current Capital)

#--- Liabilities

# currentLiabilities
"""
    prompts user for input, returns

```
outputs:
    - CurrentLiabilities: returns aa variable with total balance of `currentLiabilities`
```
"""
function getCurrentLiabilities( _valueCurrentLiabilities=[100,230,521,423,165]
    , _stringCurrentLiabilities=["notesPayable","accountsPayable",
     "accruedExpense", "unearnedRevenue","longtermDebt"])

     #    currentLiabilities =  setVariable(_string,_value) #setVariable(_string)
    #    return currentLiabilities
    conditionEquality = areDimsEqual(_stringCurrentLiabilities,_valueCurrentLiabilities)
    _listCurrentLiabilities = []

    index = 0
    if conditionEquality == true
        for _ in _valueCurrentLiabilities # assetNames # as easy as 1,2,3:

            #1. Increment the index, by (1) One
            index = index + 1
            #2. Create a new variable from string in vCAssets & float in vFloat vectors, accordingly
            varCurrentLiability =  setVariable(_stringCurrentLiabilities[index],_valueCurrentLiabilities[index]) # create a variable

            #3. Append: the `varCurrentAsset` into the `vCurrentAssets` vector list
            append!(_listCurrentLiabilities,   varCurrentLiability )
        end
    end
    _listCurrentLiabilities
end


""" prompts user for input the following liabilities:

    1.notesPayable
    2.accountsPayable
    3.accruedExpense
    4.unearnedRevenue
    5.longtermDebt

"""

function getTotalLiabilities(liabilitiesName = "totalLiabilites")

    totalLiabilites = setVariable(liabilitiesName)
    totalLiabilites
end

function promptCurrentLiabilities(notesPayable="notesPayable",accountsPayable="accountsPayable",
    accruedExpense = "accruedExpense", unearnedRevenue="unearnedRevenue",longtermDebt="longtermDebt")

    notesPayable = setVariable(notesPayable) #setVariable("notesPayable")
    accountsPayable = setVariable(accountsPayable) #setVariable("accountsPayable")
    accruedExpense = setVariable(accruedExpense) #setVariable("accruedExpense")
    unearnedRevenue = setVariable(unearnedRevenue) #setVariable("unearnedRevenue")
    longtermDebt = setVariable(longtermDebt) #setVariable("longtermDebt")

    vLiabilities = [notesPayable, accountsPayable,
 accruedExpense,unearnedRevenue,longtermDebt]

    vLiabilities
end

function getCurrentLiabilities(notesPayable="notesPayable",accountsPayable="accountsPayable",
    accruedExpense = "accruedExpense", unearnedRevenue="unearnedRevenue",longtermDebt="longtermDebt")

    vLiabilities = promptCurrentLiabilities(notesPayable, accountsPayable,
 accruedExpense,unearnedRevenue,longtermDebt)

    vLiabilities

end

# DEMO : getCurrentLiabilities()

liabilities = getCurrentLiabilities() # prompt user to insert liabilities
#liabilities = [notesPayable,accountsPayable,accruedExpense,unearnedRevenue,longtermDebt]
#calcLiabilities
Sum(liabilities)


# corrent
"""
Prompts the User to enter the following:
according to the balance Sheet , these figures are part of `currentLiabilities`

     1. notespayable

     2. accountspayable

     3. currentLiabilities

     4. accruedExpense

     5. unearnedRevenue

     6. Long-term Debt

- returns currentLiabilities
"""
function calcCurrentLiabilities( vLiabilities)# [notesPayable,accountsPayable,accruedExpense,unearnedRevenue,longtermDebt]

    if isNull(vLiabilities)
        throw(error(msg))
    end

    currentLiabilities = Sum(vLiabilities)

    currentLiabilities

end

#--- capital (Equity)

# workingCapital


##current Assets

# getCurrentAssets(currentAssets

""" gets currentAssets from user
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

# An alternative way of currentAssets: prompt only for currentAssets
function getCurrentAssets(currentAssets = "currentAssets") #DONE


    cAssets = setVariable(currentAssets)
    cAssets

end

# calcCurrentAssets(vCurrentAssets)
"""
```
input:
```
*   currentAssets: vector of items ( each of type Float64 )
```
Output:

returns _sum
"""

function calcCurrentAssets(vCurrentAssets)

    ##_sum = 0.0
    # currentAssets =  #currentAssets.cash+ currentAssets.accountsPayable +

    currentAssets = Sum(vCurrentAssets) # loop & sum every item

    # currentAssets = currentAssets[_first] +   currentAssets[_firtst +1]
    ##_sum =  map(+, currentAssets )
    ##_sum = filter

    return currentAssets

end

#TODO: recheck Formula
function calcTotalLiabilities(totalAssets, totalCapital)
    # cliabilities = currentLiabilities()

    #asset = abs(totalAssets); capital = abs(totalCapital)
    #totalLiabilities = max(asset, capital) - min(asset, capital)
    # max(totalAssets, totalCapital) - min(Asset, Capital)

    #!!!note: `totalLiabilities` can be negative ()
    totalLiabilities = max(totalAssets, totalCapital) - min( totalAssets, totalCapital)
    #TODO: check equation

    return totalLiabilities
end
# Demo : getCurrentAssets
_vectorAssets =getCurrentAssets2([100, 200, 140, 150, 120, 140,120])

cAssets = calcCurrentAssets( _vectorAssets)   #[100, 200, 140, 150, 120, 140,120])

#cAssets = getCurrentAssets()
_vectorLiabilities = getCurrentLiabilities([142, 261, 175, 154, 168]) #<---------
cLiabilities  = calcCurrentLiabilities(_vectorLiabilities)

#casset = currentassets()#can't occur in real life - maybe  in a parallel Universe
#( user copys pastes from a company's brouchoure under investor-relations) -  applicable 100%
#end #correctly returns cAsserts ok



# Demo #1: currentLiabilities:
    #1. prompt
#calcTotalLiabilities
vCurrentLiabilities = getCurrentLiabilities([142, 261, 175, 154, 168])
totalCurrentLiabilities = calcCurrentLiabilities(vCurrentLiabilities)

totalLiabilites = getTotalLiabilities("totalLiabilites")
totalAssets = setReturnTotalAssets("totalAssets")

currentAssets = _vectorAssets # getCurrentAssets2([100, 200, 140, 150, 120, 140,120]) # prompt user for more input # <---------------

cAssets =  calcCurrentAssets(currentAssets) #WARNING: returns NOTHING

currentLiabilities = getCurrentLiabilities([142, 261, 175, 154, 168]) # prompt user for more input

#TODO:UncommentMe
#cLiabilities = calcCurrentLiabilities(currentLiabilities)

workingCapital = calcWorkingCapital(cAssets , cLiabilities ) # done

#x1Ratio = X1(workingCapital, totalAssets ) #TODO: UncommentMe


vSales,ebit, retainedEarnings = getSalesEarnings() #"sales", "ebit", "retainedEarnings")

totalSales = calcSalesEarnings(vSales) # WARNING: unused

#TODO:UncommentMe
#x2Ratio = X2(retainedEarnings, totalAssets ) #<------------

#x3Ratio = X3(ebit, totalLiabilities)

_vector = getMarketCapital(10,100)

marketCapital = calcMarketCapital(_vector) #Mul(_vector) # outstanding shares * current Stockprice = marketCapital

totalDebt = setVariable("totalDebt") #setVariable

#x4Ratio = X4(marketCapital,totalDebt )

#x5Ratio = X5(sales , totalAssets)
#TODO:
#accountingRatios5 = [x1Ratio, x2Ratio, x3Ratio, x4Ratio, x5Ratio ]
#TODO:
#zScore = getAltmanZ(accountingRatios5)
#TODO:
#z, decision  = z_handling(accountingRatios5)
#TODO:UncommentMe
#println("Altman Z-Score = ", z , " Decision = ",decision)

#2. retainedEarnings
#currentLiabilities = getCurrentLiabilities("currentLiabilities")

##currentLiabilities

#function calcLiabilities(totalAssets,totalCapital) #  #TODO:currentLiabilities


#---  Liabilities

##--- totalLiabilites

"""
    Calculates Total Liabilities (from total Assets & total Capital)

      the issue : the company may have Liabilities.
      when liabilities is  above Capital
      we do NOT Know which is larger,
      Assets or Capital (nor do we know the return's `Sign` whether negative or positive)
      - [thus,  the use of  min & max is allowed ]

    ```
    Output:
    *    totalLiabilities
    ```
    !!!Note:
     - Q.  what if sign is major: it's more important (& more practical than absolute value?)

        totalAssets = abs(totalAssets);
        capital = abs(totalCapital);

    - Hence, under this context, the  `return value` can be Negative:

     # max(totalAssets, totalCapital) - min(Asset, Capital)
     totalLiabilities =  totalAssets - totalCapital

     return totalLiabilities
"""



##--- currentLiabilities
#notesPayable, accountsPayable, accruedExpense,unearnedRevenue, longtermDebt

# useful (funtion declaration )


# calcCurrentLiabilities

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
Output:
```
- Returns: a vector of currentLiabilities book-valued objects:
(notesPayable , accountsPayable , accruedExpense, unearnedRevenue , longtermDebt)

"""
function calcCurrentLiabilities(notesPayable,accountsPayable,
    accruedExpense,unearnedRevenue,longtermDebt)
    currentLiabilities = notesPayable+accountsPayable + accruedExpense + unearnedRevenue + longtermDebt

    return currentLiabilities
end

# =#

function calcCurrentLiabilities(vCurrentLiabilities) #preferred

    currentLiabilities =  0.00

    # =
    for itemFloat in vCurrentLiabilities
        currentLiabilities += itemFloat
    end


    currentLiabilities = Sum(vCurrentLiabilities)

    #currentLiabilities.notesPayable+ currentLiabilities.accountsPayable +
    #currentLiabilities.accruedExpense+ currentLiabilities.unearnedRevenue
    #currentLiabilities.longtermDebt

    return currentLiabilities
end


function getWorkingCapital() # practical
    """
    getWorkingCapital():
    current Assets - current Liabilites

    workingCapital could be positive (assets > liabilities)
    or it could be Negative (liabilities > assets )

    """
    #(Is) cassets > cliabilities ?

    workingCapital = initVar() # 0.00

    workingCapital = promptCurrentAssets() - promptCurrentLiabilities()

    workingCapital
end


function getWorkingCapital(currentAssets, currentLiabilities) # more practical
    """
    getWorkingCapital():
    current Assets - current Liabilites

    workingCapital could be positive (assets > liabilities)
    or it could be Negative (liabilities > assets )

    """
    #(Is) cassets > cliabilities ?

    #workingCapital = initVar() # 0.00

    workingCapital =  currentAssets - currentLiabilities  # Sum(currentAssets()) - Sum(currentLiabilities() )

    workingCapital
end


# calcWorkingCapital(cAssets, cLiabilities)
"""
WorkingCapital(cAssets, cLiabilities):
calculates the difference `current Assets - current Liabilites`

!!!Note:  `workingCapital` could be:
1. Positive (`assets` > `liabilities`), or it could be
2. Negative (liabilities > assets )

"""
function calcWorkingCapital( _vec #cAssets, cLiabilities) #

    #workingCapital = initVar() # 0.00

    workingCapital = cAssets  - cLiabilities #@currentAssets() - currentLiabilities()

    workingCapital

end


#--- functions

# Liabilities

# end  of Assets -----

function altmanCoeffs()

    # nonCurrentAssets
    currentAssets = calAssets() # 1. get current, non-Current Assets

    Assets = currentAssets + nonCurrentAssets # 2. sum them up, into Assets

    currentLiabilities , nonCurrentLiabilities = calcLiabilities() # get Current, non-Current Liabilities

    #another way of calculating totalLiabilities:
    totalLiabilities = currentLiabilities + noncurrentLiabs # sum them up, into Liabilities
    getTotalLiabilities()

    #z_handling(z)
    #return     #altmanCoeffs()
end



function main()

    print("welcome to Altman z-score - Julia Edition!\n")
    println("Please enter the variable's decimal value, or input an escapeSequence to quit program ")


# Assets
# total Assets  = total capital - total Liabilities
# totalAssets = getTotalAssets(TotalLiabilities,totalCapital) # standard accounting equation
totalAssets = convertToFloat( setReturnTotalAssets() )  # let the user pick a value

#currentAssets
CurrentAssets = getCurrentAssets([100,210,100,50,110,50,10]) #read input & returns a tuple
totalCurrentAssets =  calcCurrentAssets(CurrentAssets) # detuple inside

#nonCurrentAssets =  # getnonCurrentAssets()
#calcnonCurrentAssets(nonCurrentAssets)

# currentLiabilities demo
# getCurrentLiabilities() #no such thing should exist

# liabilities

CurrentLiabilities =getCurrentLiabilities([142, 261, 175, 154, 168]) # returns tuple
CurrentLiabilities = calcCurrentLiabilities(CurrentLiabilities) #

#noncurrenLiabs demo
#depreciate: nonCurrentLiabilities are outside the scope of Altman function
#NonCurrentLiabilities = getNonCurrentLiabilities()
#calcNonCurrentLiabilities(NonCurrentLiabilities)

# one way is to calculate liabilities, from `Assets` & `Capital`
totalLiabilities = getTotalLiabilities(totalAssets,totalCapital)

getCurrentLiabilities()
getnonCurrentLiabilities()

end

#--- helper functions II:

#end of helper functions II

#--- refactored functions
# TODO:
#--- Input
function read()
"""
    #note: this

    1. totalAssets
    2. totalLiabilities

     workingCapital # needs to be calculated


    3. EBIT (Earnings Before Interest & Taxes)
    4. totalDebt

    #to calculate Market capital = stockPrice, sharesOutstanding)= stockPrice * sharesOutstanding
    5.outstanding shares (sharesOutstanding)
    6. stockPrice

    7. retainedEarnings
    8. sales

    ------------
    EBIT:
    -An Indicator of a Company's profitability
    -Calculation:
    EBIT calculation (2 ways):
1.
    EBIT = Revenue − COGS − Operating Expenses # revenue, without expenses [useful]
    Or
2.
    EBIT = Net Income + Interest + Taxes # easier (3 inputs ) - to be used

    -----------

    Ebit to total debt calculation

    a measurement of leverage,
    subtract from it the  expenses, which includes overhead costs (i.e. Rent, utilities  ,marketing(/advertising expense) )

    source:
    https://www.investopedia.com/terms/d/debt_edbitda.asp#:~:text=Net%20debt%2Dto%2DEBITA%20ratio,minus%20cash%2C%20divided%20by%20EBITDA.&text=Earnings%20before%20interest%20and%20taxes%20(EBIT)%20is%20an%20indicator%20of,expenses%2C%20excluding%20taxes%20and%20interest.

"""
    # 1. set totalAssets
    #totalAssets = initVar() #  0.0
    totalAssets = setVariable("totalAssets")

    #2. set totalLiabilites
    #totalLiabilities = initVar() #0.0
    totalLiabilities = setVariable("totalLiabilities") # x2 = totalAssets/  totalLiabilities

    #totalAssets = initVar() #0.0
    #totalAssets = setVariable("totalAssets") # x2 =


    #5. EBIT (Earnings Before Interest & Taxes)
    #6. totalDebt

    # var3 = readString2("EBIT")
    #3.set ebit

    #EBIT = initVar() # 0.0
    EBIT = setVariable("EBIT")

    #4. set totalDebt
    #totalDebt = initVar() #0.0
    totalDebt = setVariable("totalDebt") #x3 =  EBIT / totalDebt

    #var4 =  readString2("totalDebt")


    # To calculate Market capital = stockPrice, sharesOutstanding)= stockPrice * sharesOutstanding
    #7.outstanding shares (sharesOutstanding)

    #8. stockPrice

    #5. set `stockPrice`
    #stockPrice = initVar() # 0.0
    stockPrice = setVariable("stockPrice")

    #var4 = readString2("stockPrice")

    #6. set sharesOutstanding
    #sharesOutstanding = initVar() # 0.0
    sharesOutstanding = setVariable("sharesOutstanding") # marketCapital =stockPrice *  sharesOutstanding

    #9. retainedEarnings
    #10. sales

    #7. set retainedEarnings
    #retainedEarnings = initVar()  # 0.0
    retainedEarnings = setVariable("retainedEarnings")

    #8. set sales
    #sales = initVar()
    sales = setVariable("sales") # x5 = sales / totalAssets

    return [totalAssets, totalLiabilites, EBIT, totalDebt  , stockPrice, stockPrice,sharesOutstanding,  retainedEarnings, sales ]
end

#get
totalAssets = handleNullName( setReturnTotalAssets() )
#=
# getworkingCapital()

function getworkingCapital() #TODO: elaborate
    #TODO: handle user input string
    workingCapital =  0.0  # nothing

    #workingCapital = setVariable(workingCapital) #"")
    return workingCapital
end
=#

function calcworkingCapital(currentAssets,  currentLiabilities)

    workingCapital =  currentAssets - currentLiabilities  #calcworkingCapital(currentAssets, currentLiabilities)
    print("Working Capital is:  $workingCapital !")

    return workingCapital
end

#--- Altman cutt-off z

function X4(marketCapital, totalDebt)
    totalLiabi
    result = marketCapital / totalDebt

# no method matching /(::Float64, ::SubString{String})
function X5(sales, totalAssets )
    result =  sales / totalAssets
    return result
end

""" Adds up the `currentAssets` vector """
function calcCurrentAssets(currentAssets)
    Sum(currentAssets)
end

""" adds up the `currentLiabilities` vector """
function calcCurrentLiabilities(currentLiabilities)
    Sum(currentLiabilities)
end

#DEMO: calculating altman's Cutt-off Z, by Calculating the 5 Accounting Ratios:

# Possible dimension missmatch
#ERROR: totalAssets = Nothing

# X1 = working Capital / total assets # Current Assets without current Liabilities / total Assets
x1 = calcworkingCapital(calcCurrentAssets(currentAssets),calcCurrentLiabilities(currentLiabilities))/totalAssets #/ totalAssets #lambda:  = workingCapital() / totalAssets

# X2 =  retainedEarnings, totalAssets  = retainedEarnings/ retainedEarnings
x2 =   retainedEarnings / totalAssets #lambda:  =  retainedEarnings / totalAssets

# X3 = earnings before Income or Tax (EBIT) / total assets
x3 = EBIT / totalAssets #lambda:  =  earnings / totalAssets

x4 = marketCapital/totalDebt #X4()  # or   marketEquity / totalDebt #lambda:  =  marketcapital) / totalDebt
x5 =   #TODO: DEBUG

# X5 = sales / totalAssets

##  --- Accounting Ratios

#=
 TODO: [Working Capital's workigns needs to be shown & displayed for the user ]

- currentAssets: any asset that will
provide an economic value for (or/) within one year
=#

# codes ges here


X1 = workingCapital / totalAssets

# X2 = retained earnings / totalAssets
X2 = retainedEarnings / totalAssets

# X3 = earnings (EBIT) / totalAssets
X3 = earnings / totalAssets

# X4 = totalMarketCapital ( equity) / total liabilities
X4 = marketCapital / totalLiabilities

X5 = sales / totalAssets

return X1,X2,X3,X4,X5  # - #wishful thinking

end

#Reality:
#=
1/TOTALAssets * (X1() +X2() +X3()  +X5() ) +X4() =[marketCapital/totalDebt] = workingCapital+ retainedEarnings + earnings
+ (Capital*totalAssets) /totalLiabilites + Sales/to alt
=#

#--- Altman's Z cut-off Handling

# evaluateZ

function evaluateZ(z)
    decision = " "
    if z < 1.18 # Below: Less `Assets` more `Liabilities`
        decision = "Distress"

    elseif z> 1.81 && z < 2.99
        decision = "Gray Zone"

    elseif z > 2.99 # Above: more `Assets`, less `Liabilities` -> more likely to be in the Safe Zone
        decision = "Safe Zone"
    else end
 return z, decision
end

#-------

""" user is prompted to enter all required values for calculating the Input vector of x's """
function inputUser()
    #TODO:
    # Prompt user for each main 5 input functions: x1,x2,x3,x4
    # Issee: user has to provide specific information about a company's figures
    # W hich is input sensitive [i.e. user might input faulty input ] # TODO: enable
    #enable user to update input


    #for i <5 # its a bit more entangeled than 5 inpu
    toDecimalVal()

    #readString2()


end

# calcAltmanRatios(_list)

#Processing I
##Processing I.I

#println("Checking List:\n", _list = [(workingCapital, totalAssets), (retainedEarnings,totalAssets), (earnings, totalAssets), (capital, totalLiabilities)])
#println(_list[1])
#println(_list[1][1])

"""processing I: calculate the Altman 5 Accounting Ratios (i.e named as the `x`s)
```
Output:
*   returns `ratioVector`: an Output vector _o[x1, x2,x3,x4,x5]
```
"""
function calcAltmanRatios(_list) # [workingCapital,totalAssets,retainedEarnings,EBIT,totalDebt, marketCapital, totalLiabilities, sales ] ) #[ [workingCapital, ], [retainedEarnings,totalAssets], [EBIT, totalDebt], [marketCapital, totalLiabilities]  ,sales ] )

    workingCapital = _list[_first]
    totalAssets = _list[_first + 1 ]
    retainedEarnings = _list[_first + 2 ]
    EBIT = _list[_first + 3 ]
    totalDebt = _list[_first + 4]
    marketCapital = _list[_first + 5 ]
    totalLiabilities = _list[_first + 6]
    sales = _list[_first + 7]


    x1 = X1(workingCapital, totalAssets) #workingCapital,totalAssets) #req:working capital
    #+a2 *
    x2 =  X2( retainedEarnings,totalAssets)  #retainedEarnings,totalAssets)
    #+ a3 *
    x3 =  X3(EBIT,totalDebt) # EBIT / totalDebt
    #+ a4 *
    x4 =  X4(marketCapital, totalLiabilities) # X4 = marketCapital / totalLiabilities
    #+ a5 *
    x5 = X5(sales, totalAssets)
    ratioVector = [x1,x2,x3,x4,x5]
     return ratioVector
end

##Processing I.II
function calcAltmanRatios(currentAssets, currentLiabilities, totalAssets, retainedEarnings, EBIT, stockPrice, sharesOutstanding, totalDebt, sales)


    #calcAltmanRatios() : from `currentAssets`, `currentLiabilities` figures
    workingCapital = calcWorkingCapital(currentAssets,currentLiabilities)

    x1 = workingCapital / totalAssets

    x2 = retainedEarnings /  totalAssets

    x3 = EBIT / totalAssets

    #getMarketCapital(stockPrice, sharesOutstanding)

    # MarketCapital processing: from `stockPrice` & `sharesOutstanding`
    marketCapital = getMarketCapital(stockPrice, sharesOutstanding)
    marketCapital = calcMarketCapital(marketCapital)

    x4 = marketCapital / totalDebt

    x5 =  sales / totalAssets

    #concatenate ratios , reducing input into an `X` vector
    vectorRatios = [x1,x2,x3,x4,x5]

    vectorRatios

end

#!!!Note: currentAssets might be found in relation to other variables
#Processing II
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

    altmanZ = processAltman(vectorRatios)

    altmanZ

end


"""" Processing III: get input _in , _weights , perform Algebriac Vector multiplication
i.e.  _in' * _weights , & return  the Output"""
function processAltman(_in = [0.3, 0.4 , 0.2, 0.1, 0.5], _weights=[1.2 , 1.4 , 3.3 , 0.6 , 0.999 ]) # [x1, x2,x3,x4,x5]

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

            #One-Liner:  point-wise element multiplication
            result = _in' .* _weights # _in(transpose) * _weights [valid input ]


            #!!!note: It's good result  (but not optimally fast)
            #for i in _in:
            # multiply each element by its corresponding weight

                #_in[i]' .* _weights[i]
            #end

            return result

        else
            throw(error("UnExpectedError Occured "))

        end
        return result

    catch UnExpectedError
        @error msg +  exception = (UnExpectedError, catch_backtrace())
    end

end


#--- Output

# for a given weights
_weights=[1.2 , 1.4 , 3.3 , 0.6 , 0.999 ]
_in = [0.3, 0.4 , 0.2, 0.1, 0.5]

#TODO:UncommentMe
#TODO:Requires a list of calculated Altman Ratios
#accountingRatios5 = calcAltmanRatios() #TODO: once finished insert list of altman 5 ratios

altmanZScore = processAltman(_in, _weights )
println("Altman Z-Score = ",   altmanZScore)

#TODO:UncommentMe
#altmanZScore = processAltman(accountingRatios5, _weights)

println("Altman Z-Score = " ,  altmanZScore)
