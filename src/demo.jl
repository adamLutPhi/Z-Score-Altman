#=
demo.jl

Author = @adamwillisMastery ('Ahmad Lutfi')

Description:

- This file mainly checks the **functionality** of the following *functions*:

- assignVariableToValue

- trimSpaces

- getConditions(stringInput)

- isNull()
- isMissing()

- @macro Name


!!!Note: function `warn` has been added (which is called, instead of  calling `throw(error(msg)))`
=#
#include("main.jl")

# demo:
#=_decimal = typeof(stringInput) == Nothing=# #; println("Nothing was given"); #_decimal = 0.0 ;

if stringInput isa Missing # Works
    handleMissing(stringInput)

 #stringInput = "0.00" ;  println("5th: Nothing was given"); _decimal = 0.0
end

if isNull(stringInput) == true # stringInput ===  # "" # works! (all the time  )
    handleNull(stringInput)
 #stringInput = "0.00" ;  println("11th: Nothing was given"); _decimal = 0.0
end

stringInput = "$stringInput"
println("Please Enter string variable: $stringInput")
stringInput =  readline() #tryparse(Float64, input("$prompt " + decimalVal(stringInput,2)+"\n"))
#3. Parse to decimal
#A correct way of implementing `isMissing`:
if stringInput isa Missing &&  ismissing(stringInput) === true  # correct
    println( true)    #rintln("try 3: ", true )

elseif  !(stringInput isa Missing) ||  ismissing(stringInput) === false
    println(false)
end

escapeSequence = ["by","bye","c","close","q","quit","e","end","exit", "k","kill","t","terminate","f", "finish", "escape"] # TODO: apply to lower

#=
macro macro_string_as_varname(s::AbstractString, v::Float64)  #::Any)
	s = Core.Symbol(s) # <---- `Symbol`: from Core module (automatically imported)
	esc(:($s = $v))
end
=#

#lvl1
""" takes a string name , & a float value
assigns input string to a variable
Assumes string is not null nor missing """
function assignVariableToValue(stringName::AbstractString, varValue::Float64)
    decimalValue = convertToFloat(varValue)
    # !!!note: string cannot be assigned unless both name & value are present ( & not Null)
    _variable = Core.Symbol(stringName)
    _str = string(Core.Symbol(_variable)) #  `string` is caputred, correctly

    println("DEBUG: HotFix: typeof(Core.Symbol(_variable) )  = ",typeof(string(Core.Symbol(_variable))),"_str = ",_str)
    _variable =  :($decimalValue)   # macro_string_as_varname(stringName,varValue) #string_as_varname(stringName,varValue)
    println("DEBUG: HotFix: typeof(eval(_variable))  = ",typeof(eval(_variable)))
    return  eval(_variable)  #esc(:($stringName = $varValue)) # eval(_variable) # or esc(:($_variable = $decimalValue))
end

## removeSpaces1

"""
credits: @isbarn
 Julia trim string whitespace and check length
 #ERROR reproty stackOverFlow

"""#lvl1
function removeSpaces1(inputString)

    _string = inputString #copy(inputString)

    result = join(map(character -> !isspace(_string[character]) ? "" : _string[character], 1:length(_string)  ) )
    return result
end


## removeSpaces2
"""
@credits: Fenyyang Wang
!!!Note: the use of the `filter` as a function of mapping
"""#lvl1
function removeSpaces2(inputString) #useful

    _string = inputString #copy(inputString)
    #@credits: "Fengyang Wang"
    result = filter(character -> !isspace(character), _string)
    return result
end

# trimSpaces
#Refactored function [lvl2]
""" removes spaces in function input [lvl2]"""
function trimSpaces(inputString)

    result = removeSpaces1(inputString) #removeSpaces2(inputString)
    return result

end
#--------------

#helper functions


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

# isMissing

""" checks if a given input is `missing`

```
Output:
-   `Bool` flag: true if missing, false if not missing, otherwise throws an error
```
 """
function isMissing(_in=missing)

    if _in isa Missing &&  ismissing(_in) === true  # correct
        return true    #println("try 3: ", true )

    elseif  !(_in isa Missing) ||  ismissing(_in) === false
        return false

    else throw(error("UnExpectedError Occured"))
    end

end

# getConditions(stringInput)
""" calls isNull() , isMissing(), using the input string variable "stringInput" """
function getConditions(stringInput) # <--------

    conditionNull = isNull(stringInput) # returns bool (true or false )
    conditionMissing = isMissing(stringInput)
    conditionNull, conditionMissing
    # isNull(stringInput) ,  isMissing(stringInput) # conditionMissing
end


# checkConditions(conditionNull::Bool, conditionMissing::Bool)

""" checkConditions """
function checkConditions(conditionNull::Bool, conditionMissing::Bool)

    #!!!Note: Check if only one of the Conditions is triggered:

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

""" converts a string Input to its corresponding float64 represenation"""
function convertToFloat(stringInput)
    decimalValue = tryparse(Float64, string(stringInput) ) #<-------
    return decimalValue
end


""" handles null input, by replacing string variable with designated result value """
function handleNull(_string,result="0.00") #Context is **Inconclusive** ( depends entirely on the context: either a variable name or value )

    #1. if string was null, assign result to it
    if isNull(_string) == true
        _string = result
    end

    #2. return `_string` whether null or not
     return _string

end
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
    else
        throw(error("UnExpectedError Occured "))

    end

    return stringInput #varName
end


#println( handleNullName(""))


## promptVarName()
"""  prompts for user input, if valid , transform it to a decimal value
!!!note: Assumes a valid variable name has already been set """#lvl5
function promptVarName(var="",escapeSequence = escapeSequence) # rechecked #Triple-check: var is given as input argument

    #var = ""

    #1.DO NOT  Prompt user for input, then read the input
    #    println("Please enter _string's decimal value ") # was $_string
    #     var= readline()

    # 2. If string was nothing(""), missing, or input was NOT a string Name
    if isNullOrMissing(var) == true #|| isaAlphaString(var) == false
        #var = checkHandleDecimalInput(var) #WARNING: `var` can be `nothing ` #<------
        # rewind Program
        #counter-stackOverFlow mechanism: re-Prompt user for input
        println("Retry: previous input invalid! Please enter a valid _string's decimal value: ")
        _stringName = readline()
        var = promptVarName(_stringName) # call the other function (with 1 compulsory argument )
        var = handleNullName(var )
        var = trimSpaces(var) #TODO: later

        return var
    #3. if it's valid
    elseif isNullOrMissing(var) == false #&& isaAlphaString(var) == true
        # do nothing major (auxilliary functions allowewd )
        #trim spackes around the number , if any

        var = trimSpaces(var)

        return var


    # Otherwise, if  it's an escape sequence
    elseif var in escapeSequence
        var = exit() # program exits the REPL
        return var
    else
        throw(error(msg))
    end

    return var
end
