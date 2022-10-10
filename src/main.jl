# credits :
#using Missings;
#using DataFrames;
#using deepcopy #  deepcopy
#using Base

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
if "by" == var &&  "by" in  escapeSequence #or in ? # in compiles
    boolFlag = true
    println("True user input was in escape sequence flag = " )#,$boolFlag)
elseif var != "by" ||  "by" in escapeSequence == false
    boolFlag = false # replace with exit ..
    println("False, user did not write an escapeSequence! , flag = ")#, $boolFlag)
else
    throw(error("something Unexpected occured "))
end
=#

#=


end notes:
*   - In handling the `escapeSequences`'s condition': `in` works while  `isa` do not
as `isa` is expecting a `Type` but found a `Vector`
=#

#---- string functions

##--- helper functions

# isNull

""" A function checks  if input string is Null (user enters nothing, presses 'return')"""

function isNull(_string) # compiles correct #preferred

    #try
        if  _string === "" #|| typeof(_string) isa Missing  # Works
            #println("Null: passing by 1st if _string condition")

            return true
        elseif _string !== ""
            #println("Null: passing by 2nd if _string condition")
            return false
        else throw(error(UnExpectedError))
        end
        #return response
#    catch UnExpectedError
#    end
end

# handleNull

#  (replace it with either handleNullName or handleNullValue)
#review2 : it is a rough sketch, of a generral form, of a null handling & compiling & is used - no need to depreciate

""" handles null input, by replacing string variable with designated result value """

function handleNull(_string,result="0.00") #Context is inconclusive ( depends entirely on the context: either a variable name or value )

     _string = result
     return _string
end


""" Handles input if it was null or equal to `""`
writes empty string of "" as "0.00", by default (user-changeable ) """ # adds meaning to the void
function handleNullValue(_string, result="0.00")

    #Introduce an extra step (before it, in the upper scope )
    #if _string is Null , assign result to it (as a decimalString)
        _string =  string(result ) # ensure result is still a string
        _string = handleNull(_string,result)

    println("NullValue: Nothing was Found & been handeled")
    return _string
end


"""handles nullability: if input variable is null, or equal to `""`
writes empty variable as `variable`, by default (user-changeable )
"""
function handleNullName(_string, result="variable")

    _string = string(result)  #emsure result is a string

    _string = handleNull(_string,result)
    println("NullName: Nothing was Found & been handeled ")
    return _string

end

#print("null handling",handleNull("") ) #compiles


#----

# isMissing


"""a function checks if `missing` input was given """
function isMissing(_in=missing)

    if _in isa Missing &&  ismissing(_in) === true # correct # correct
        return true    #rintln("try 3: ", true )

    elseif  !(_in isa Missing) ||  ismissing(_in) === false
        return false

    else throw(error("UnExpectedError Occured"))
    end

end


# handleMissing


""" handles input if it was `missing` """
function handleMissing(_string,result="0.00")

    _string = result #setString(0.00) #"0.00"
    println(" Missing was Found")
    return _string
end


#--------------
#helper function

# checkCondition

function getConditions(stringInput)

    conditionNull = isNull(stringInput) # returns bool (true or false )
    conditionMissing = isMissing(stringInput)

    return conditionNull, conditionMissing
end


function checkConditions(conditionNull::Bool, conditionMissing::Bool)
    # Only one of the conditions is triggered
    if conditionNull == true || conditionMissing == true
        return true

    elseif conditionNull == false && conditionMissing == false
        return  false
    else throw(UnExpectedError(msg))
    end
end


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
output: Bool : either true when it's null (or missing), or false, otherwise
```

"""
function isNullOrMissing(stringInput)

    conditionNull = isNull(stringInput)
    conditionMissing = isMissing(stringInput)

    #conditionNull, conditionMissing = getConditions(stringInput)

    #UncommentMe: if everything works out
    # condition: at least One of the conditions is triggered (or both)
    #condition = checkConditions(conditionNull, conditionMissing) # <-- (::String, ::Bool)

    if conditionNull == true || conditionMissing == true #condition == true  #
        return true

    elseif  conditionNull == false && conditionMissing == false # condition == false  #
        return  false
    else
        throw(error(msg)) # <----

    end
    return condition
end


function isNullOrMissing(conditionNull:: Bool, conditionMissing:: Bool) # WARNING:unused
    #UncommentMe: if things goes as expected
    # Only one of the conditions is triggered
    #condition = checkConditions(conditionNull, conditionMissing)

    condition = checkConditions(conditionNull, conditionMissing)

    #=
    if conditionNull == true || conditionMissing == true #condition == true  #conditionNull || conditionMissing
        return true

    elseif conditionNull == false && conditionMissing == false #condition == false  #
        return  false
    end =#
    return condition

end
# ---User Prompt


""" Reads a user-given variable name """
function readVariableName()
    println("Please enter a variable Name ")
    variableName = readline()
    return variableName
end
#=
function readVariableName(_string)

    variableName = readline()
    return variableName
end=#

""" returns user-inputString """
function readVariableValue()
    println("Please enter a variable Value: a Decimal, up to 2 points of precison  ")
    variableValue = readline()
    return variableValue
end


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


""" converts a string Input to its corresponding float64 represenation"""
function convertToFloat(stringInput)
    decimalValue = tryparse(Float64, string(stringInput) )
    return decimalValue
end


function Sum(_vector)
    return sum([i for i in 1:length(_vector)])
end


function Mul(_vector)

    _mul=1
     for i in 1:length(_vector)
         _mul = mul * i
     end
     return _mul
end


# string_as_varname

# lvl1:
#credits to: @NickNack on discourse
function string_as_varname(s::AbstractString,v::Any)
         s=Symbol(s)
         @eval (($s) = ($v))
end


# assignVariableToValue
# lvl2:

# assignVariableToValue()
""" assigns input string to a variable
Assumes string is not null nor missing """
function assignVariableToValue(stringName, stringValue) # ready to be used

    decimalValue = convertToFloat(stringValue) #tryparse(Float64,stringValue) # decimal value [non-isNullOrMissing]
    # !!!note: string cannot be assigned unless both name & value are present
    _variable = string_as_varname(stringName,decimalValue)# now: _string = varValue(_string here)

    return _variable #(stringName, decimalValue)
end


# Demo #2:
varName = readVariableName()
varName = handleNullName(varName)


varValue  = readVariableValue() # 1
varValue  = handleNullValue(varName) # 2

#=
readVariableValue
handleNullValue

=#

#checkNullOrMissing(varName )

#varName = handleNullOrMissing(varName)

#1. read (input)
varName = readVariableName()
varValue = readVariableValue()

#2 handle input

varValue = readVariableValue(varName) # !!!note: varName as input to be displayed, is Optional

#2. checking (& Handling)

varName = handleNullName(varName)
varValue = handleNullValue(varValue)

#3. Assign to a variable
#TODO: Assign them to each other [turns a string and decimal into a variable called $string ]
varName = assignVariableToValue(varName,varValue) # now varName is a variable #TODO: return it

println("isa: debug#1: ",isa(440, Number))
println("isa: debug#2: ",isa(440.20, Number))
println("isa: debug#3: ",isa(440.201, Number)) # true but don't want it to be so
println("isa: debug#4: ",isa(string(440.20), Number)) # false
println("isa: debug#5: ",isa(string(440.20)*"a", Number)) # false value

function createVariable() #WARNING: unused

    print("Debug: Enter create Variable")

    #1 read input  input
    varName = readVariableName()
    #varValue = readVariableValue() also this function compiles
    varValue = readVariableValue(varName) # !!!note: varName as input, to be displayed, is Optional

    #2. checking (& Handling)

    varName = handleNullName(varName)
    varValue = handleNullValue(varValue)

    #3. Assign to a variable
    #- Assign them to each other [turns a string and decimal into a variable called $string ]
    varName = assignVariableToValue(varName,varValue) # now `varValue` is assigned to `varName`

    return varName

end

if isNullOrMissing("sth") == false # string was given
    print("isNullOrMissing == false")
end

if isNullOrMissing("sth") == true
    print("isNullOrMissing == true")
end

""" create a variable, prompts user with  a corresponding input string """
function createVariable(_string) # practical

    print("Debug: Enter create Variable")

    #1. check input if null or missing (it's a string describing a (variable) name )
    if isNullOrMissing(_string) == false
        varName = _string     #readVariableName()
    elseif isNullOrMissing(_string) == true
        varName = readVariableName(_string) # _string added as arg (new)
    end

    #2 handle input
    varValue = readVariableValue(varName) # !!!note: `varName` as input, that's displayed, is Optional

    #2. checking (& Handling)

    varName = handleNullName(varName)
    #update: do not lowercase, keep everything as user intended
    #varName = lowercase(varName) #i.e. for "Cash" -> "cash"
    varValue = handleNullValue(varValue)

    #2.1 space handling
    #2.2 case handling

    #3. Assign to a variable
    #- Assign them to each other [turns a string and decimal into a variable called $string ]
    varName = assignVariableToValue(varName,varValue) # now varName is a variable #TODO: return it
    return varName
end


""" create a variable, assigning a string, & a value to a newly created variable"""
function createVariable(_stringName, _value) # more useful

    print("Debug: Enter create Variable")

    conditionName = isNullOrMissing(_stringName)

    #1. check input if null or missing (it's a string describing a (variable) name )
    if conditionName == false
        varName = _stringName     #readVariableName()
    elseif  conditionName == true
        varName = readVariableName(_stringName) # _string added as arg (new)
    end

    conditionValue = isNullOrMissing(_value)
    if conditionValue == false
        varValue = _value     #readVariableName()
    elseif conditionValue == true
        varValue = readVariableName(_value) # _string added as arg (new)
    end
    #2 handle input

    varName = handleNullName(_stringName)

    varValue = handleNullValue(varValue)


    #3. Assign to a variable
    #- Assign them to each other [turns a string and decimal into a variable called $string ]
    varName = assignVariableToValue(varName,varValue) # now varName is a variable #TODO: return it
    return varName
end
# readVariableName(varValue) # function takes 0 input argumentts
#readVariableName()
createVariable("Cash",100) #compiles


#return varName, varValue

"""
source: https://discourse.julialang.org/t/string-as-a-variable-name/2195/6
"""
#=
macro string_as_varname_macro(s::AbstractString, v::Any)
	s = Symbol(s) # <----
	esc(:($s = $v))
end
=#


#=
""" takes a string name , & a float value """
function assignVariableToValue(stringName, varValue)

    # !!!note: string cannot be assigned unless both name & value are present ( & not Null)
    _variable = string_as_varname(stringName,varValue)# now: _string = varValue(_string here)
    return _variable
end
=#

# checkNull
"""checks if input string is null (or not) """
function checkNull(_string)
    if isNull(_string) == true
        println("_string value is NULL, please check input,& try again later")
    elseif isNull(_string) == false
        return _string
    end
end

# hasString
"""
# Credits: @tamasgal
checks if input only contains characters , in the form [a-z,A-Z]
https://discourse.julialang.org/t/check-for-letters-only-string/41091/4
"""
function hasString(inputResult) #Done # TODO: recheck
    condition = isatoz(inputResult) # in the form "a-z,A-Z"
    if condition == false
        return false
    elseif condition == true
        return true
    end
end

# String Operations



#--------------
# Space detection & Handling

## removeSpaces1
"""
credits: @isbarn
stackOverFlow: Julia trinm string whitespace and check length
"""
function removeSpaces1(inputString)

    _string = inputString #copy(inputString)

    result = join(map(character -> !isspace(_string[character]) ? "" : _string[character], 1:length(_string)  ) )
    return result
end


## removeSpaces2
""" [lvl1]
@credits: Fenyyang Wang
!!!Note: the use of the `filter` as a function of mapping
"""
function removeSpaces2(inputString)
    _string = copy(inputString)
    #@credits: "Fengyang Wang"
    result = filter(character -> !isspace(x), _string)
    return result
end


# Refactored function [lvl2]
""" removes spaces in function input [lvl2]"""
function trimSpaces(inputString)

    result = removeSpaces2(inputString)
    return result

end


# isNumber
""" checks if input is of type `Number` """
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
throw an `UnExpectedError` """
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
output:

* true:  if valor is an AbstractFloat
* false:  if vaslor is not an AbstractFloat
* Nothing: if UnExpectedError Occured (whether it occurs at input arguments or at
the function's body)
```
"""
function isNumber2(valor) # recommended
    return isa(valor, AbstractFloat) # takes true or false # or nothing if input isnot as expected
end
#-------


""" returns the proper result, for missing or null string input  """
function handleMissingAndNull(stringInput, kernelNullFunction=handleNullName) #unused

    result = 0.0 # decimal return
    if isMissing(stringInput) #stringInput isa Missing # Works
        #result = handleMissing(stringInput)
    #end

    elseif isNull(stringInput) # stringInput ===  # "" # works! (all the time  )
        #result  = kernelNullFunction(stringInput)

    end
    result  = kernelNullFunction(stringInput)
    return  result
end

#-----


# handleNullName
function handleNullName(stringInput,result="variable")

    varName = ""
    isFaulty = isNullOrMissing(stringInput)

    if isFaulty
    	varName = string(result) # already assigned , above

    elseif !isFaulty
        # varName = stringInput # return stringInput as varName
        varName = stringInput
        #TODO: do other string ops here:
        varName = trimSpaces(varName)

    end

    return varName
end


function handleNullValue(stringInput,result=0.00)

	varValue = 0.00
	isFaulty = isNullOrMissing(stringInput)

	if isFaulty == true
	   # use the default result
	   varValue = result

    elseif isFaulty  == false
	   varValue = convertToFloat(stringInput)
	end

	return varValue
end


function handleNullOrMissingName(stringInput, result="variable")

    conditionNull, conditionMissing = getConditions(stringInput)
    resultingCondition = conditionNull || conditionMissing

    # Only one of the conditions is triggered
    if  resultingCondition   #  conditionNull || conditionMissing #isMissing(stringInput) # a stopping condition

        #Checks if String is Null

        #pass in the default `result` value
        result =  handleNullName(stringInput, result) # pass


    elseif !resultingCondition #!conditionNull && !conditionMissing # if it's neither [then, stringInput is fine]

        # Assign stringInput to result
        result = stringInput # !!!note : it depends on result & its type [String]

    end

    return result
end


function handleNullOrMissingValue(stringInput,result=0.00) #TODO:
    conditionNull, conditionMissing = getConditions(stringInput)
    resultingCondition = conditionNull || conditionMissing

    # Only one of the conditions is triggered
    if  resultingCondition   #  conditionNull || conditionMissing #isMissing(stringInput) # a stopping condition

        #Checks if String is Null

        #pass in the default `result` value
        result =  handleNullValue(stringInput, result) # new


    elseif !resultingCondition # [hence, `stringInput` is OK]

        # Assign stringInput to result
        result = stringInput # !!!note : it depends on result & its type [String]

    end

    return result
end


function handleNullOrMissingValue(stringInput,result=0.00)
end


function handleNullOrMissing(stringInput,result="0.0", kernelNullFunction=handleNullValue) # Practical

    #result = "0.0" #0.0
    #conditionNull = isNull(stringInput) # returns bool (true or false )
    #conditionMissing = isMissing(stringInput)

    conditionNull, conditionMissing = getConditions(stringInput)

    #Check if String is Null
    # Only one of the conditions is triggered
    if conditionNull || conditionMissing #isMissing(stringInput) # a stopping condition
        #=

            if conditionNull == true
                #pass in the default `result` value
            result =  handleNull(stringInput, result) # pass

            elseif conditionMissing == true
                # pass-in the default `result` value
            result =  handleMissing(stringInput, result )
            end
            =#

        stringInput = kernelNullFunction(stringInput, result )

    # Else: niether of conditions are tirggered
    # thus, string Input is valid ( and safe to get assigned  & used by functions)
    # thus, assign stringInput to result

    elseif !conditionNull && !conditionMissing # if it's neither
        result = stringInput # REALIZE : it depends on result & its type
        #(howevcer we have 2 inputs, thus we got to have 2 different functions ,then 2 outputs)

    end

    return result
end


#=
println("Debugging line : ")
var = readline()
if isNullOrMissing(var)
    println("NULL")
end
=#


#--- Decimal functions

""" rounds to the 2nd decimal digit

```
output:
*   a Bool
"""


function toDecimalVal(_string,d=2) #  compiles

    _decimal = 0.0 #setting a deimal to 0.0  #nothing #nullable - not recommended
    if  isNullOrMissing(_string) || _string == "" # isNullOrMissing cannot capture `Nothing` properly

        return _decimal

    elseif !isNullOrMissing(_string) && _string != ""

            _decimal = convertToFloat(_string) # tryparse(Float64,_string) #digits=d)

    else
        throw( error("UnExpectedError Occured"))
    end
        return _decimal

end


#=
function setString(decimal=0.00)
    _stringRepresentation = str(decimal)
    return _stringRepresentation
end
=#

#=
#stringInput = "stringInput"
#1. prompt user for input

#println(" $prompt $stringInput")
#stringInput =  readVar() #readline() #tryparse(Float64, input("$prompt " + decimalVal(stringInput,2)+"\n"))
#            read
#3. Parse to decimal

if stringInput isa Missing &&  ismissing(stringInput) === true  # correct
    println( true)    #rintln("try 3: ", true )

elseif  !(stringInput isa Missing) ||  ismissing(stringInput) === false
    println(false)
end
=#
""" checks if inputString (by the user) is null or empty: if so,  then  it rewinds input  , otherwise if user wants to exit : enters one of the escapeSequences  """
function checkInputIsValidOrRewind() #inputString) #vital,  compiles

    # whenever inputString is null, or is Empty
    response = nothing
    println("checkInputIsValidOrRewind - welcome please emter a valid string, if null (``) function repeats,to escape use one of  escapeSequence words: exit, bye, kill, quit, terminate,...  ")
    inputResult = readline()    #readString2(inputString) #Rule: if nullable do not copy

    #$boolFlag = nothing
    #1. Check in is null, or missing  , or string is valid
    if  isNullOrMissing(inputResult)  &&  hasString(inputResult) == false        # isMissing(inputResult) || isNull(inputResult)  #|| hasString(inputResult) # string is valid
        response = checkInputIsValidOrRewind()
        #return checkInputIsValidOrRewind() # rewind this program

    #-----------
    #elseif hasString(inputResult) == true

    # If user wants to exit the program: then, if user-input matches one of an escapeSequence keyword:
    elseif lowercase(inputResult) in  escapeSequence #  compiles # if it's an escapeSequence


        println("BoolFlag = ", boolFlag ," user input was in escape sequence ... exiting Julia REPL ... ")#,$boolFlag)
        #exit()
        # return false
        response = false
    elseif lowercase(inputResult) in escapeSequence == false #&& hasString(inputResult)  # if it's not an escapeSequence

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


#elseif inputResult.lowercase() in escapeSequence #in escapeSequence
#        println("exiting [REPL] ... ")
#        exit()
    #end


#    println(_decimal) # print the decimal
#    return _decimal
    #end
#end

# 1. Read variable Value (readVariableValue):

#isNullOrMissing(_input)

""" assumes input been checked for null & missing
"""
function parseStringToDecimal(inputString)#,digits=2)

    _decimal = tryparse( inputString)  # round( tryparse( inputString)  ,  digits) #inputResult isa _decimal  #readString(inputString)
    println("Decimal variable is parsed, as expected")
    return _decimal
end

#checkInputIsValidOrRewind() # compiles


#_decimal = + decimalVal(stringInput,2)

##--- trim space & join characters

# remove spaces





println("check missing = ", isMissing(missing))

println("check isNull = ", ismissing(missing))
println("check isNull = ", isNull(""))


function checkNullOrMissing(stringInput,result="0.0", kernelNullFunction = handleNullValue) # Practical

    #conditionNull =  isNull(stringInput)
    #conditionMissing =  isMissing(stringInput)
    conditionNull, conditionMissing = checkCondition(stringInput)

    if conditionNull || conditionMissing # a stopping condition

        #=
            #Checks String if Null
            if  conditionNull  #isNull(stringInput)
            #result =     handleNull(stringInput, result)
            end
            #check if it is missing
            if conditionMissing
            #result =    handleMissing(stringInput, result)
            end
            =#
        stringInput = handleNullValue(stringInput, result)


    elseif !conditionNull && !conditionMissing # stringInput is valid

            result = convertToFloat(stringInput)
    end

    return result

end


function promptValue()#digits=2) # rechecked #note function
    _string = ""
    var = 0.0
    println("Please enter the variable's decimal value ")
    _string= readline()

    if isNullOrMissing(_string) == true #|| ! hasString(var)
        # cannot be missing , rewind for user input
        promptValue()

    elseif isNullOrMissing(_string) == false #&& hasString(var) # if input is valid
        var = convertToFloat(_string)  #round(tryparse(Float64,_string),digits)
    else throw(error(msg))
    end
    return var
end

# Prompt Var

## promptvar()
function promptVar() # ok

    var = 0.0
    println("Please enter the variable's decimal value ")

    _string = ""
    _string = readline()

    if isNullOrMissing(_string) == true #|| ! hasString(var)
        # cannot be missing , rewind for user input
        promptVar()

    elseif isNullOrMissing(_string) == false

        var = convertToFloat(_string)   #round(tryparse(_string), 2)
    end

    return var
end

#practical
function checkHandleDecimalInput(var, result = "0.0", nullKernel = handleNullValue) # vital #compiles

    conditionNull = isNull(var) #correct
    println("typeof = ", conditionNull, typeof(conditionNull) )
    conditionMissing = ismissing(var)
    #conditionNull, conditionMissing = getConditions(var) # erroneous

    condition = isNullOrMissing(conditionNull,conditionMissing)

    floatVar = 0.00

    if isNullOrMissing(var) ==  false
        println("isnullmissing isa `False stmt` ")
        #floatVar = nullKernel(var, result) # <---------- # false stmt returns String
        floatVar = convertToFloat(floatVar)


    elseif  isNullOrMissing(var) ==   true
        println("isnullmissing isa `True  stmt`")
        floatVar = nullKernel(var, result)
        floatVar =  convertToFloat(floatVar)  #round(tryparse(var), 2)

    end

    floatVar = floatVar * 1.00 # floatVar is Nothing !
    return floatVar
end

## promptVar(_string)


""" Assunes a varavle name has already been set """
function promptVar(_string)

    var = ""
    println("Please enter _string's decimal value ") # was $_string
    var= readline()

    var = checkHandleDecimalInput(var) #<------

    return var
end

"""prompts user for input `_string` assigns a var then returns it
assumes function been checked for null or missing
-   Unclear Context : promt for var Name or var value?
"""
function promptUser(_string) #TODO:recheck # conflicts with string check (either call prompt or check )

    # move to the outside scope
    #var = string_as_varname(_string) #1. make var as string
    #var = _string # 1. Assign string to this var
    var = ""
    #=
    if isNull(_string) || isMissing(_string) # if empty i.e. user haven't added
        # a name for the variable, yet
        var = "variable name " # then, help user by showing what she could do
    else # _string not empty  i.e `please add variable name `
        # assign var to string
        var = _string  # assumes `variable name` as assignnt, only thing left is
        # the variable's value  i.e. `please add $_string` (a user-Defined Variable)
    end
    =#
    println(" $prompt $var") # 3. concatenate with  var's value

    #1. prompt user for input
    #var = readline() # let user input # tryparse(Float64, input("$prompt " + decimalVal(stringInput,2)+"\n"))

    if isNullOrMissing(var)
        # a name for the variable, yet
        var = "variableName " # then, help user by showing what she could do
    else # _string not empty  i.e `please add variable name `
        # assign var to string
        var = _string  # assumes `variable name` as assignnt, only thing left is
        # the variable's value  i.e. `please add $_string` (a user-Defined Variable)
    end

    #println(" $prompt $stringInput")

    #check stringInput isNull or missing
    #if null or missing, ensure to assign a meaningful value to this var

    resultFlag = isNullOrMissing(var)

    if resultFlag == true
            #Rewind: promptsUser for input again
            promptUser(_string) # RewrePrompt user for input

    elseif lowercase(var) in escapeSequence # TODO: finish condition  condition
        println("skipped succsessfully ")
        return var

    elseif resultFlag == false # user-input is a Valid String
        return var
    end


        # prop

        #    var = handleNullOrMissing(var)   #checkNullOrMissing(var)


    #var = trimSpaces(var) remo



    #var = assignVariableToValue(var) # new  #_string)

    return var

end

function promptUser()

    varName = readVariableName()
    resultFlag = checkNullOrMissing(var)
    handleNullOrMissing(resultFlag)

    varValue  = readVariableValue()
    resultFlag = checkNullOrMissing(varValue)
    handleNullOrMissing(resultFlag)

    assignVariableToValue(varName, varValue)# TODO: check it's return

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
output:
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
=#
#=
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
#=
stringInput = "stringInput"
println(" $prompt $stringInput")
stringInput =  readline() #tryparse(Float64, input("$prompt " + decimalVal(stringInput,2)+"\n"))
var1 =  assignVariableToValue(stringInput) #string_as_varname(stringInput)
#println("var assigned as expected")
=#

#------------

_decimal = "0.0" ;
println("_decimal = ",_decimal)
 _decimal = tryparse(Float64,_decimal) # round(tryparse(Float64,stringInput) )#,2)#::Float64, d)  # isa Nothing ->"nothing entered!" ||round(tryparse(Float64,stringInput)::Float64, d)  #digits=d) ||
println("_decimal is ", _decimal)
#_decimal = toDecimalVal(stringInput) #this needs more love

#------------

""" prompts user for input, reads user input, parses input, checks input sanity

```
output:
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
        nullMissingCondition =  isNullOrMissing(stringInput)
        if nullMissingCondition== true
        #2.handle null input

           stringInput = handleNullName(stringInput)

       elseif nullMissingCondition == false # keep its value
           stringInput = stringInput
       end

       #2. trim all spaces
        #asssumes it's been checked against the case for  `null` & `missing`

        stringInput = trimSpaces(stringInput)
        # assign a string, to a variable name

        #var = assignVariableToValue(stringInput) # Assuming: Input is meaningful (refers to a meaningful name )

        return stringInput
 end

#helper function
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

function handleIfNotNullOrMissing(stringInput)

    if !checkNullOrMissing(stringInput)

    end

end
function updateVariableName(stringInput1::String,stringInput2::String)

    if checkNullOrMissing(stringInput1) #&& !checkNullOrMissing(stringInput2)

    end

    stringInput1 = stringInput2
    return stringInput1
end

function updateVariableValue(stringInput::String, _decimal2::Float64)
        #1. check decimal input is a number
        if !checkIsNumber(_decimal2)
            _decimal2 = handleNullValue(_decimal2)
        end
        #2. checks for null, if so , handles it, then converts it into a decimal
        _decimal1 = checkAndConvert(stringInput)

        #3.Replace  : replace _decimal1 with _decimal2 [not a Swap]
        _decimal1 =  _decimal2  # = _decimal2, _decimal1

        return _decimal2
end
function checkIfNotANumber(aNumber)
    if !checkIsNumber(aNumber)
        aNumber = handleNullValue(aNumber)
    end
    return aNumber
end

function updateVariableValue(decimal1::Float64, _decimal2::Float64)
        #1. check decimal input is a number

        _decimal1 = checkIfNotANumber(_decimal1)

        _decimal2 = checkIfNotANumber(_decimal2)

        #2.Replace  : replace _decimal1 with _decimal2 [not a Swap]
        _decimal1 =  _decimal2  # = _decimal2, _decimal1

        return _decimal2
end

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

    # handleNullOrMissing(stringInput)

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
                stringInput = trimSpaces(stringInput)
                # assign a string, to a variable name

                stringInput = assignVariableToValue(stringInput) # Assuming: Input is meaningful (refers to a meaningful name )
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

        if isNullOrMissing(stringInput) == true # done
            println("isNullOrMissing been triggered")
            stringInput = handleNullOrMissing(stringInput)

            var = "0.0"

        #now handle variable value

            stringInput = handleNullOrMissing(stringInput)
        end

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

function readString3(stringInput) # 1. In category

                # Commence reading sequence:
                #1. prompt user for input
                #println(" $prompt $stringInput") # do prompt, bfore in the upper scope of the funcion , before calling this line


                #stringInput =  readline() #tryparse(Float64, input("$prompt " + decimalVal(stringInput,2)+"\n"))
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
*   2. Increment by 1 , there should be another character
*   3. UppperCase the character, at that Position (i.e `.uppperCase()`)

"""
function setStringVar(stringInput) # readString -> setString
    #stringInput = "stringInput"
    println(" $prompt $stringInput")
    stringInput =  readline() #tryparse(Float64, input("$prompt " + decimalVal(stringInput,2)+"\n"))

    stringInput = handleNullOrMissing(stringInput)

    stringInput = trimSpaces(stringInput)

    # Assuming: Input is meaningful (refers to a meaningful name )
    var1 =  assignVariableToValue(stringInput) #string_as_varname(stringInput)

    return var1

end

""" trims both left & right spaces
it's ok if string was null i.e ""
but string should not be misasing
 """
function trimSpaces(_string)

    if isNullOrMissing( _string) == false #!== Missing  #missing # non-Bool (Missing) used in Bool context
        _string = lstrip(_string)
        _string = rstrip(_string)

    end
    return _string
end

# Example:

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

#--- Altman Coefficients a1, a2, ..., an
#assets : read assets

#=
function calcCapital() #compiles
    """
    marketCapital (not book Capital)
    outstanding shares
    """

Stockprice =  setVariable("stockprice")  #toDecimalVal("stock Price")  #total Assets") #readString("total Assets") #passmissing(parse).(Float64, input("$prompt 'total Assets'\n"))
#totalCapital =  #passmissing(parse).(Float64, input("$prompt 'total Capital'\n"))
sharesOutstanding =  setVariable(sharesOutstanding") #toDecimalVal("outstanding shares")  #readString("total Liabilities")  #passmissing(parse).(Float64, input("$prompt 'total Liabilities'\n"))

    capital = totalAssets - totalLiabilities  # Capital
    return totalAssets, totalLiabilities, capital
end

=#

"""
    Prompts user to enter: Sales,  Earnings  & Retained Earnings  (of a company)
"""

function calcsales_earnings()

    sales =  toDecimalVal("Sale") #readString("Sale") #passmissing(parse).(Float64, input("$prompt 'Sales'\n"))
    earnings = toDecimalVal("Earnings") #readString("Earnings") #passmissing(parse).(Float64, input("$prompt 'Earnings'\n"))
    retainedEarnings = toDecimalVal("Retained Earnings") #readString("Retained Earnings") #passmissing(parse).(Float64, input("$prompt 'Retained Earnings'\n"))

        return  sales, earnings, retainedEarnings #(sales, earnings, retainedEarnings)

end

#global sales
#global ebit
#global retainedEarnings

function getSalesEarnings()
    println("getSalesEarnings")

    sales = setVariable("Sales")
    ebit = setVariable("EBIT")
    retainedEarnings = setVariable("RetainedEarnings")

    #sales = toDecimalVal("Sale") #readString("Sale") #passmissing(parse).(Float64, input("$prompt 'Sales'\n"))
    #earnings = toDecimalVal("EBIT") #readString("Earnings") #passmissing(parse).(Float64, input("$prompt 'Earnings'\n"))
    #retainedEarnings = toDecimalVal("RetainedEarnings") #readString("Retained Earnings") #passmissing(parse).(Float64, input("$prompt 'Retained Earnings'\n"))
    _vector  = [sales, earnings, retainedEarnings]
        return  _vector #sales, earnings, retainedEarnings #(sales, earnings, retainedEarnings)

end

""" reads input string variables , prompts user to input decimals, assigns variables

```
output:
*   vSales = [sales, ebit, retainedEarnings]
```
"""
function getSalesEarnings(sales="sales", ebit="ebit", retainedEarnings="retainedEarnings") #_string="SalesEarnings")  #sales,ebit retainedEarnings)

    # println(_string)

    sales = createVariable(sales) #setVariable(sales)
    ebit = createVariable(ebit) #setVariable(ebit)
    retainedEarnings = createVariable(retainedEarnings) #setVariable(retainedEarnings)

    vSales= [sales, ebit, retainedEarnings] #(sales, earnings, retainedEarnings)
    #sales = toDecimalVal("Sale") #readString("Sale") #
    #earnings = toDecimalVal("EBIT") #readString("Earnings")
    #retainedEarnings = toDecimalVal("RetainedEarnings") #readString("Retained Earnings")
    return  vSales

end

function X2(retainedEarnings, totalAssets )
    result = retainedEarnings / totalAssets
    return result
end

""" Calculates total sales """
function calcSalesEarnings(vEarnings)

    totalSales = Sum(vEarnings)

    return totalSales

end

#Demo #3: Sales:

#1. Prompt User for input
totalAssets = createVariable("totalAssets",1000)
vSales = getSalesEarnings("sales", "ebit", "retainedEarnings")
totalSales = calcSalesEarnings(vSales)

#retainedEarnings = initVar()
retainedEarnings =vSales[3]
r2Ratio = X2(retainedEarnings, totalAssets)


# show Sales vector components:
sales = vSales[1]
ebit = vSales[2]

retainedEarnings = vSales[3]
println("sales = ",sales, "ebit = ", ebit, "retainedEarnings = ", retainedEarnings)

#2. calculate total sales & earnings
totalSales = calcSalesEarnings([100,150,300])
println("totalSales = ", totalSales )


#--- Altman Coefficients a1, a2, ..., an

## Accounting 5 Ratios

""" X1 = workingCapital over totalAssets """ # requires workingCapital pre-calculation

function X1(workingCapital , totalAssets)

    return workingCapital / totalAssets
end

""" X2 = retainedEarnings over totalAssets """
function X2(retainedEarnings , totalAssets)
    return retainedEarnings / totalAssets
end

""" X3 = earnings (before Interest & Tax) over TotalAssets """
function X3(EBIT, TotalAssets)
    return EBIT / TotalAssets
end

""" X4 = marketCapital over Total Debts Ratio """
function X4(marketCapital , totalDebt)
    return marketCapital / totalDebt
end

""" X5 = sales over totalDebt Ratio """
function X5(sales, TotalDebt )
    return sales / TotalDebt
end

""" Processing II:
    takes a vector of xs (of Altman's Z), along with another vector
weights are placeholders (only)
"""#TODO: calc Xs

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
# Demo #4: Altman
#hardCoded weightVariables:

_in = [1.2, 0.3, 0.4, 0.2, 1.1]
weightVariables = [1.2 , 1.4 , 3.3 , 0.6 , 0.999] #[a1=1.2 , a2=1.4 , a3=3.3 , a4=0.6 ,a5 = 0.999]

getAltmanZ(_in, weightVariables)

# requires more work
"""
Altman Coeffecient formula
parameters: are changeable, as requeired
sums up Altman's z-score equation (as provided in the enclosed academic paper)
Requires:
8 items, as 8 User-inputs :

1. totalAssets
2. totalLiabilities
3. workingCapital = (currentAssets)
4. retainedEarnings
5. EBIT (Earnings Before Interest & Taxes)
6. totalDebt #sales
7. outstanding shares
8. sales

x1 = workingCapital / TotalAssets
x2 = retainedEarnings / TotalAssets
x3 = EBIT / TotalAssets
x4 = marketCapital = (outstanding shares * current Stockprice) (market Value of  Equity) / totalDebt
x5 = sales / TotalDebt

MarketCap market Value of  Equity = outstanding shares

How much firm's assets can decline, in value

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


# CurrentAssets
## getCurrentAssets
"""
reads
Cash, accountsReceivable, inventory, securities commercialPaper, treasuryNotes, other
from the user

"""
function getCurrentAssets(cash="cash", accountsReceivable="accountsReceivable",inventory="inventory",
    securities="securities",commercialPaper="commercialPaper",treasuryNotes="treasuryNotes",other="other") # includes many mini-functions

    #1. Cash
    Cash = createVariable(cash) #setVariable("Cash") #or?  #"$Cash") #<----

    #2. accountsReceivable
    accountsReceivable = createVariable(accountsReceivable) #setVariable("accountsReceivable")

    #3. inventory
    inventory = createVariable(inventory) #setVariable("inventory")
    #4. securities
    securities = createVariable(securities) #setVariable("securities")
    #5. commercialPaper
    commercialPaper = createVariable(commercialPaper) #setVariable("commercialPaper")
    #6. treasuryNotes
    treasuryNotes = createVariable(treasuryNotes) #setVariable("treasuryNotes")
    #7. other
    other = createVariable(other) #setVariable("other")

    vCurrentAssets = [Cash, inventory , securities , commercialPaper, treasuryNotes, other]
    return vCurrentAssets

end

""" takes a vector of string names, & another for float values; returns a vector of current Asset Variables """
function getCurrentAssets(stringNames=["cash", "accountsReceivable","inventory",
    "securities", "commercialPaper","treasuryNotes","other"],floatValues=[100,210,100,50,110,50,10]) # includes many mini-functions

    conditionEquality = areDimsEqual(stringNames,floatValues)
    listCurrentAssetVariables = []

    if conditionEquality == true
        index = 0

        for item in stringNames,
            index = index + 1 # start by incrementing index
            _var = createVariable(item,floatValues[index])
            append!( listCurrentAssetVariables, _var)
        end

    end

    return listCurrentAssetVariables

end
"""
    Calculates & returns currentAssets
!!!note: other is optional (some companies may include other  not mention objects,
 value is calculated into other, seperately, then passed into this function  )


- For `currentAssets` we need:

     1. cash
     2. accountsReceivable
     3. inventory
     4. securities
     5. commercialPaper
     6.treasuryNotes
     7. other (if exists)

"""
function calcCurrentAssets(vCurrentAssets=[cash,accountsReceivable,inventory,securities,
    commercialPaper,treasuryNotes,other]) #a


    currentAssets = 0.0

    currentAssets = Sum(vCurrentAssets)

    #=
        for i in vCurrentAssets
            currentAssets += i
        end
    =#
    #currentAssets = cash+accountsReceivable + inventory + securities +commercialPaper+treasuryNotes+other
    return currentAssets
end

println("calcCurrentAssets")
# Demo : getCurrentAssets
_vector =getCurrentAssets() # [100, 200, 140, 150, 120, 140,120]

currentAssets = calcCurrentAssets( _vector)   #[100, 200, 140, 150, 120, 140,120])


"""

Assets  = Current ( a concept, less than the  bussiness's set year timespan)+ non-current Asset (more than  bussiness's set timespan  )
"""
function calcCurrentAssets(vCurrentAssets=[cash, accountsReceivable,inventory,securities,commercialPaper,treasuryNotes,other])

    #currentAssets = 0.0
    currentAssets = Sum(vCurrentAssets)
    #=
    for i in vCurrentAssets
        currentAssets += i
    end =#
    return currentAssets # , nonCurrentAssets

end

""" prompt user to input totalAssets """
function getTotalAssets(totalAssets = "totalAssets") #practical

    totalAssets = createVariable(totalAssets) #setVariable(totalAssets)
    return totalAssets
end


#----
"""
# max(capital , liability)
#return max(capital, liability) - min(capital, liability)

return  capital - liability
end
"""
# Demo #5:
# currentassets
# Demo : getCurrentAssets
_vector =getCurrentAssets() # [100, 200, 140, 150, 120, 140,120]

currentAssets = calcCurrentAssets( _vector)   #[100, 200, 140, 150, 120, 140,120])

currentAssets = getCurrentAssets() #input("please enter 'Current Assets' ")

#should debug
function currentassets() # returns a (decimal) Number
    """
    calculates currentAssets , from user prompt
    !!!note:
    Depreciation, nowadays, is 3 years, due to tech. Development
    Average Utilization in accounting books was 5 years
    but with Tech. Adcancement, it is safe to say it's more like 3 years on Average)
    thus a tech product (i.e. pc, workstation, server, ...)
    has a lifetime of 3 years, on Average

    1.Current Assets = Cash and Cash Equivalents
    2. Accounts Receivable [Ones owning you (in cash) ]
    3. Inventory [ (sellable) Product/ (marketable) Service]
    4. Marketable securities
    5. Commercial Paper
    6. Treasury Notes
    7. Other Instruments (differs from company to another, by dwefault it's equal to 0)

    """
    Cash = createVariable("Cash") # cash can be called

    accountsReceivable = createVariable("accountsReceivable")

    inventory = createVariable("inventory")

    securities = crearteVariable("securities")

    commercialPaper = createVariable("commercialPaper")
    treasuryNotes = createVariable("treasuryNotes")

    other = createVariable("other")

    currentAssetList = [cash,accountsReceivable, inventory, securities, commercialPaper, treasuryNotes, other ]

    return currentAssetList #currentAssets
end

function calcCurrentAssets(assetsList)
    println("Debug: calculating Current Assets ")

end

println(calcCurrentAssets)

#getCurrentAssets
#--- Altman Coefficients


#calcWorkingCapital

function  calcWorkingCapital(currentAssets,currentLiabilities)
    println("DEBUG: typeof(currentAssets) = ",typeof(currentAssets), " typeof(currentLiabilities) =", typeof(currentLiabilities))
    totalBalance =  currentAssets - currentLiabilities
    return totalBalance
end

# getCurrentLiabilities

## getCurrentLiabilities [no input arguments]


function getCurrentLiabilities(notesPayable="notesPayable",accountsPayable="accountsPayable",accruedExpense="accruedExpense",unearnedRevenue="unearnedRevenue")


    notesPayable = createVariable(notesPayable) #setVariable(notesPayable)

    accountsPayable = createVariable(accountsPayable) #setVariable(accountsPayable)

    accruedExpense = createVariable(accruedExpense) #setVariable(accruedExpense)

    #unearnedRevenue = initVar()

    unearnedRevenue = createVariable(unearnedRevenue) # setVariable(unearnedRevenue)

    longtermDebt = createVariable(longtermDebt) #setVariable(longtermDebt)

    _vector = [notesPayable, accountsPayable, accruedExpense, unearnedRevenue, longtermDebt]
    return _vector

end


## getCurrentLiabilities ()
function getCurrentLiabilities()#notesPayable, accountsPayable,accruedExpense,unearnedRevenue,longtermDebt)

    notesPayable = createVariable("notesPayable") #setVariable(notesPayable)

    accountsPayable = createVariable("accountsPayable") #setVariable(accountsPayable)

    accruedExpense = createVariable("accruedExpense") #setVariable(accruedExpense)

    unearnedRevenue = createVariable("unearnedRevenue")  #setVariable(unearnedRevenue)

    longtermDebt = createVariable("longtermDebt") #setVariable(longtermDebt)

    _vector = [notesPayable, accountsPayable, accruedExpense, unearnedRevenue, longtermDebt]
    return _vector

end


#--- current liabilities
# calcCurrentLiabilities
function calcCurrentLiabilities(vCurrentLiabilities)

    totalCurrentLiabilities = Sum(vCurrentLiabilities)
    return totalCurrentLiabilities
end

## totalLiabilities()
""" prompts user to input totalLiabilities """

function getTotalLiabilities( totalLiabilites= "totalLiabilities")

    totalLiabilites =  createVariable(totalLiabilities) #setVariable(_string)

    return totalLiabilities

end

function getMarketCapital(outstandingShares="outstandingShares", stockPrice = "stockPrice")

    outstandingShares = createVariable(outstandingShares) #setVariable(outstandingShares)
    stockPrice = createVariable(stockPrice) # setVariable(stockPrice)
    _vector = [outstandingShares, stockPrice ]
    return _vector
end

function calcMarketCapital(_vectorMarketCapital)
    return Mul(_vector)
end


# Demo:
_list = [1,2,3,4,5]
println("DEBUG: Sum() = ", Sum(_list) ) # returns correct ansewer [Unless given list is of type `nothing`]

cAssets = getCurrentAssets()

_sumAssets = calcCurrentAssets(cAssets)

println("typeof (_sumAssets) = ",typeof(_sumAssets))
cLiabilities = getCurrentLiabilities()
_sumLiabilities = calcCurrentLiabilities(cLiabilities)

calcWorkingCapital(_sumAssets, _sumLiabilities)

#---------

function calcRetainedEarnings()

end


"""
calculates working capital from
1. Current Assets
2. Current Liabilities


1. workingCapital
2. sales & Earnings

1. workingCapital = currentAssets - currentLiabilities


"""
function calcCurrentCapital(currentAssets,currentLiabilities)

    #treat those as dummy variables
    #cAssets  = abs(currentAssets)
    #cLiabilities = (currentLiabilities)
    #need to review related functions

    #--- Capital function s

    workingCapital = currentAssets - currentLiabilities #max(cAssets , abs(cLiabilities) ) - min( cAssets, cLiabilities  )

    return workingCapital
    #captial  = calcCapital() #UncommentMe

    # sales , earnings , retained_earnings =  calcsales_earnings()

# return x1, x2, x3, x4, x5
end

#--- prompt for accounting trinity : Assets, liabilities, &  Capital


"""
#=
# update :

prompts user to Directly enter the 3 accounts:
1. Capital (in report: is only the `bookValue` while the market Capital is
actually fluctuating. its value is based on current stockPrice &
number of sharesOutstanding)

1. Assets
2. Liabilities

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


# calcTotalAssets
"""
Calculates Assets (from totalCapital, & TotalLiabilties)

```
inputs:

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
function calcTotalAssets(totalCapital, totalLiabilities)

    """
    Handling the accounts' values is  Crucial
    i.e. do not change the accounts' negative values
    (it is normal for accounts to have both negative & Positive values)
    (requires further handling)

    """
    capital = capital(totalCapital)

    liability = liability(totalLiabilities)

    return capital, liability
end


##----
""" initializes a new variable """
function initVar(initialValue=0.00)

    var = initialValue
    return var
end

#preferred
""" sets a corresponding variable name, from a string input """
function setVariable(_string)

    #variable  = 0.0
    variable  = initVar()

    variable = promptVar("$_string")# prompt variable using the string's value

    variable  = promptValue()
    #checkResponse()

end

function checkResponse() # usure, yet # @ depreciate
    response = nothing
    #checkInputIsValidOrRewind() #readString("Cash") #passmissing(parse).(Float64, input("$Cash and cash equivalents" )) # 1. Accounts Receivable
    if response == true
        # cash =
    end

end



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
function getCurrentLiabilities( _string="currentLiabilities",_value=100)

    currentLiabilities =  createVariable(_string,_value) #setVariable(_string)
    return currentLiabilities
end

""" prompts user for input the following liabilities:

    1.notesPayable
    2.accountsPayable
    3.accruedExpense
    4.unearnedRevenue
    5.longtermDebt

"""

function getLiabilities(notesPayable="notesPayable",accountsPayable="accountsPayable",
    accruedExpense = "accruedExpense", unearnedRevenue="unearnedRevenue",longtermDebt="longtermDebt")

    notesPayable = createVariable(notesPayable) #setVariable("notesPayable")
    accountsPayable = createVariable(accountsPayable) #setVariable("accountsPayable")
    accruedExpense = createVariable(accruedExpense) #setVariable("accruedExpense")
    unearnedRevenue = createVariable(unearnedRevenue) #setVariable("unearnedRevenue")
    longtermDebt = createVariable(longtermDebt) #setVariable("longtermDebt")

    vLiabilities = [notesPayable, accountsPayable,
 accruedExpense,unearnedRevenue,longtermDebt]

    return vLiabilities
end

liabilities = getLiabilities() # prompt user to insert liabilities
#liabilities = [notesPayable,accountsPayable,accruedExpense,unearnedRevenue,longtermDebt]
#calcLiabilities
Sum(liabilities)

# corrent
function calcCurrentLiabilities(  vLiabilities=  [notesPayable,accountsPayable,accruedExpense,unearnedRevenue,longtermDebt]
    )
    """
    Prompts the User to enter the following:
    according to the balance Sheet , these figures are part of `currentLiabilities`

         1. notespayable

         2. accountspayable

         3. currentLiabilities

         4. accruedExpense

         5. unearnedRevenue

         6. Long-term Debt

    -returns
    """

    notesPayable , accountsPayable , accruedExpense , unearnedRevenue , longtermDebt = currentLiabilities()
    #currentLiabilities = abs(notesPayable) + abs(accountsPayable) + abs(accruedExpense) + abs(unearnedRevenue) + abs(longtermDebt)

    currentLiabilities = notesPayable + accountsPayable +  accruedExpense + unearnedRevenue + alongtermDebt

    return currentLiabilities

end

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
#=
function getworkingCapital() #TODO: elaborate
    #TODO: handle user input string
    workingCapital =  0.0  # nothing

    #workingCapital = setVariable(workingCapital) #"")
    return workingCapital
end
=#

function calcworkingCapital(currentAssets,  currentLiabilities)

    workingCapital =  calcworkingCapital(currentAssets, currentLiabilities)
    print("Working Capital is:  $workingCapital !")

    return workingCapital
end

#--- Altman cutt-off z

#DEMO: calculating altman's Cutt-off Z, by Calculating the 5 Accounting Ratios:

X1 = calcworkingCapital(currentAssets,currentLiabilities) / totalAssets #lambda:  = workingCapital() / totalAssets

# X2 =  retainedEarnings, totalAssets  = retainedEarnings/ retainedEarnings
X2 =   retainedEarnings / totalAssets #lambda:  =  retainedEarnings / totalAssets

# X3 = earnings before Income or Tax (EBIT) / total assets
X3 = EBIT / totalAssets #lambda:  =  earnings / totalAssets

x4 = marketCapital/totalDebt #X4()  # or   marketEquity / totalDebt #lambda:  =  marketcapital) / totalDebt
x5 = X5(sales,totalAssets)  #TODO:
# X5 = sales / total assets

function X4(marketCapital, totalDebt)
    totalLiabi
    result = marketCapital / totalDebt
function X5(sales, totalAssets )
    result =  sales / totalAssets
    return result
end

# X5 = sales / totalAssets

##  --- Accounting Ratios

#= X1 = working Capital / total assets # Current Assets without current Liabilities / total Assets

 TODO: [Working Capital's workigns needs to be shown & displayed for the user ]

- currentAssets: any asset that will
provide an economic value for (or/) within one year
=#
# codes ges here

#=

X1 = workingCapital / totalAssets

# X2 = retained earnings / totalAssets

X2 = retainedEarnings / totalAssets

# X3 = earnings (EBIT) / totalAssets
X3 = earnings / totalAssets

# X4 = totalequity(capital) / total liabilities
X4 = marketCapital / totalLiabilities


return X1,X2,X3,X4,X5  - #wishful thinking

end

Reality:

1/TOTALAssets * (X1() +X2() +X3()  +X5() ) +X4() =[marketCapital/totalDebt] = workingCapital+ retainedEarnings + earnings
+ (Capital*totalAssets) /totalLiabilites + Sales/to alt

=#
#--- Z cutt-off Handling

function z_handling(z) # TODO: check Implementation
    if z < 1.18 # Below: Less `Assets` more `Liabilities`
        decision = "Distress"

    elseif z> 1.81 && z < 2.99
        decision = "Gray Zone"

    elseif z > 2.99 # Above: more `Assets`, less `Liabilities` -> more likely to be in the Safe Zone
        decision = "Safe Zone"
    else end
 return z, decison
end

#Well-DONE! #<- double-check

##current Assets

#function altman(totalAssets, sales )

# An alternative way of currentAssets: prompt only for currentAssets
function getCurrentAssets(currentAssets = "currentAssets") #DONE

    # null -double check
    cAssets = createVariable(currentAssets) #setVariable(currentAssets)
return cAssets
end


"""
```
input:
```
*   currentAssets: vector of items ( each of type Float64 )
```
output:

returns _sum
"""

function calcCurrentAssets(vCurrentAssets)

    ##_sum = 0.0
    # currentAssets =  #currentAssets.cash+ currentAssets.accountsPayable +
    #currentAssets=0.00 # TODO: recheck

    currentAssets = Sum(vCurrentAssets) # loops every item

    # currentAssets = currentAssets[_first] +   currentAssets[_firtst +1]
    ##_sum =  map(+, currentAssets )
    ##_sum = filter

    return currentAssets

end

# Demo : getCurrentAssets
_vectorAssets =getCurrentAssets() # [100, 200, 140, 150, 120, 140,120]

cAssets = calcCurrentAssets( _vectorAssets)   #[100, 200, 140, 150, 120, 140,120])

#cAssets = getCurrentAssets()
_vectorLiabilities = getCurrentLiabilities()
cLiabilities  = calcCurrentLiabilities(_vectorLiabilities)

#casset = currentassets()#can't occur in real life - maybe  in a parallel Universe
#( user copys pastes from a company's brouchoure under investor-relations) -  applicable 100%
#end #correctly returns cAsserts ok


function X1(workingCapital, totalAssets)

    result = workingCapital / totalAssets
    return result
end

function X4(marketCapital,totalDebt )

    result = marketCapital .* totalDebt #TODO: check is it `.*` or inverse?
    return result
end


function X5(sales, totalAsset )

    result = sales / totalAssets
    return result
end


# Demo #1: currentLiabilities:
    #1. prompt

vCurrentLiabilities = vCurrentLiabilities = getCurrentLiabilities()
totalCurrentLiabilities = calcCurrentLiabilities(vCurrentLiabilities)

totalLiabilites = getTotalLiabilities("totalLiabilites")
totalAssets = getTotalAssets("totalAssets")

currentAssets = getCurrentAssets() # prompt user for more input # <---------------

cAssets =  calcCurrentAssets(currentAssets) #WARNING: returns NOTHING

currentLiabilities = getCurrentLiabilities() # prompt user for more input
cLiabilities = calcCurrentLiabilities(currentLiabilities)

workingCapital = calcWorkingCapital(cAssets , cLiabilities ) # done

x1Ratio = X1(workingCapital, totalAssets )


vSales = getSalesEarnings("sales", "ebit", "retainedEarnings")

totalSales = calcSalesEarnings(vSales) # WARNING: unused

x2Ratio = X2(retainedEarnings, totalAssets )

x3Ratio = X3(ebit, totalLiabilities)

_vector = getMarketCapital()

marketCapital = calcMarketCapital(_vector) #Mul(_vector) # outstanding shares * current Stockprice = marketCapital

totalDebt = createVariable("totalDebt") #setVariable("totalDebt")

x4Ratio = X4(marketCapital,totalDebt )

x5Ratio = X5(sales , totalAssets)

accountingRatios5 = [x1Ratio, x2Ratio, x3Ratio, x4Ratio, x5Ratio ]

zScore = getAltmanZ(accountingRatios5)

z, decision  = z_handling(accountingRatios5)

println("Altman Z-Score = ", z , " Decision = ",decision)

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
    output:
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

##--- currentLiabilities
#notesPayable, accountsPayable, accruedExpense,unearnedRevenue, longtermDebt

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
- Returns: a vector of currentLiabilities book-valued objects:
(notesPayable , accountsPayable , accruedExpense, unearnedRevenue , longtermDebt)

"""


# calcCurrentLiabilities


function calcCurrentLiabilities(

    notesPayable,accountsPayable,accruedExpense,unearnedRevenue,longtermDebt)
    currentLiabilities = notesPayable+accountsPayable + accruedExpense + unearnedRevenue + longtermDebt

    return currentLiabilities
end


function calcCurrentLiabilities(vCurrentLiabilities) #preferred

    currentLiabilities =  0.00

    #=
    for itemFloat in vCurrentLiabilities
        currentLiabilities += itemFloat
    end
    =#

    currentLiabilities = Sum(vCurrentLiabilities)

    #currentLiabilities.notesPayable+ currentLiabilities.accountsPayable +
    #currentLiabilities.accruedExpense+ currentLiabilities.unearnedRevenue
    #currentLiabilities.longtermDebt

    return currentLiabilities
end

#---
function getWorkingCapital()
    """
    getWorkingCapital():
    current Assets - current Liabilites

    workingCapital could be positive (assets > liabilities)
    or it could be Negative (liabilities > assets )

    """
    #cassets > cliabilities ?
    workingCapital = initVar() # 0.00

    workingCapital = currentAssets() - currentLiabilities()

    return workingCapital
end # returns workingCapital
function calcWorkingCapital(cAssets, cLiabilities)
    """
    WorkingCapital():
    current Assets - current Liabilites

    workingCapital could be positive (assets > liabilities)
    or it could be Negative (liabilities > assets )

    """
    #cassets > cliabilities ?
    workingCapital = initVar() # 0.00

    workingCapital = cAssets  - cLiabilities #@currentAssets() - currentLiabilities()

    return workingCapital
end # returns workingCapital



#--- functions

# Liabilities

## getLiabilities
function getLiabilities() #WARNING: unused
    """
    calculates current, non-current liabilities
    Accounts
    ```
    inputs:
    Nothing
    !!! note: prompts user for input 2 values:
        -currentLiabilities
        -noncurrentliabs
    ```

    """

    currentLiabilities = currentLiabilities() #done

    noncurrentliabs = createVariable(noncurrentliabs) #setVariable(noncurrentliabs) # prompt user, for input

    return currentLiabilities , noncurrentliabs

end

#end  of Assets -----

function altmanCoeffs()

    # , nonCurrentAssets
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

# Assets
# total Assets  = total capital - total Liabilities
totalAssets = getTotalAssets(TotalLiabilities,totalCapital)

#currentAssets
CurrentAssets = getCurrentAssets() #read input & returns a tuple
calcCurrentAssets(CurrentAssets) # detuple inside

#nonCurrentAssets =  # getnonCurrentAssets()
#calcnonCurrentAssets(nonCurrentAssets)

# currentLiabilities demo
# getLiabilities() #no such thing should exist

# liabilities

CurrentLiabilities =getCurrentLiabilities() # returns tuple
calcCurrentLiabilities(CurrentLiabilities) #
#noncurrenLiabs demo
NonCurrentLiabilities = getNonCurrentLiabilities()
calcNonCurrentLiabilities(NonCurrentLiabilities)

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

    #totalAssets = initVar() #  0.0
    totalAssets = setVariable("totalAssets")

    #totalLiabilities = initVar() #0.0
    totalLiabilities = setVariable("totalLiabilities") # x2 = totalAssets/  totalLiabilities

    #totalAssets = initVar() #0.0
    totalAssets = setVariable("totalAssets") # x2 =


    #5. EBIT (Earnings Before Interest & Taxes)
    #6. totalDebt

    # var3 = readString2("EBIT")

    #EBIT = initVar() # 0.0
    EBIT = setVariable("EBIT")

    #totalDebt = initVar() #0.0
    totalDebt = setVariable("totalDebt") #x3 =  EBIT / totalDebt

    #var4 =  readString2("totalDebt")


    # To calculate Market capital = stockPrice, sharesOutstanding)= stockPrice * sharesOutstanding
    #7.outstanding shares (sharesOutstanding)

    #8. stockPrice
    #stockPrice = initVar() # 0.0
    stockPrice = setVariable("stockPrice")

    #var4 = readString2("stockPrice")

    #sharesOutstanding = initVar() # 0.0
    sharesOutstanding = setVariable("sharesOutstanding") # marketCapital =stockPrice *  sharesOutstanding

    #9. retainedEarnings
    #10. sales

    #retainedEarnings = initVar()  # 0.0
    retainedEarnings = setVariable("retainedEarnings")


    #sales = initVar()
    sales = setVariable("sales") # x5 = sales / totalAssets


end

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

#println("Checking List:\n", _list = [(workingCapital, totalAssets), (retainedEarnings,totalAssets), (earnings, totalAssets), (capital, totalLiabilities)])
#println(_list[1])
#println(_list[1][1])

"""processing I: calculate the Altman 5 Accounting Ratios (i.e named as the `x`s)
```
output:
*   returns `ratioVector`: an output vector _o[x1, x2,x3,x4,x5]
```
"""
function calcAltmanRatios(_list = [workingCapital,totalAssets,retainedEarnings,EBIT,totalDebt, marketCapital, totalLiabilities, sales ] #[ [workingCapital, ], [retainedEarnings,totalAssets], [EBIT, totalDebt], [marketCapital, totalLiabilities]  ,sales ] )

    x1 = X1(workingCapital,totalAssets) #req:working capital
    #+a2 *
    x2 =  X2(retainedEarnings,totalAssets)
    #+ a3 *
    x3 =  X3(EBIT,totalDebt) # EBIT / totalDebt
    #+ a4 *
    x4 =  X4(marketCapital, totalLiabilities) # X4 = marketCapital / totalLiabilities
    #+ a5 *
    x5 = X5(sales, totalAssets)
    ratioVector = [x1,x2,x3,x4,x5]
     return ratioVector
end



"""" Processing III: get input _in , _weights , perform Algebriac Vector multiplication
i.e.  _in' * _weights , & return  the output"""
function processAltman(_in = [0.3, 0.4 , 0.2, 0.1, 0.5], _weights=[1.2 , 1.4 , 3.3 , 0.6 , 0.999 ]) # [x1, x2,x3,x4,x5]

    try
        #1. check whether both vectors are of same length
        condition  = areDimsEqual(_in, _weights)

        #condition =  copy( length(_in) == length(_weights)) # or try `deepcopy`
        result = zeros(lenght(_in))

        if !condition  # if lengths are not equal
            println("Input Dimensions are not equal, please check input, then try again later  ")
        elseif condition # if lengths are equal
            # element-sie multiplication
            #!!!Note: julia follows vector logic thus a transpose must be applied
            result = _in' .* _weights # _in(transpose) * _weights [valid input ]

            #=
            # It's good result  (but not optimally fast)

            for i in _in:
                # multiply each element by its corresponding weight
                result =  _in[i] * _weights[i]
            =#

            return result

        else
            throw(error("UnExpectedError Occured "))

        end
        return result

    catch UnExpectedError
        @error msg +  exception = (UnExpectedError, catch_backtrace())
    end

end

# for a given weights
_weights=[1.2 , 1.4 , 3.3 , 0.6 , 0.999 ]
_in = [0.3, 0.4 , 0.2, 0.1, 0.5]

accountingRatios5 = calcAltmanRatios()

println("Altman Z-Score = ",  processAltman(_in, _weights ) )

println("Altman Z-Score = " , processAltman(accountingRatios5, _weights) )



""" Output: Display inputs, weights used,  altman's cuttOff `Z-Score` & the decision  """
function output()
    #TODO:
end
