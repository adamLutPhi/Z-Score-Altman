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


#println("DEBUG: PROMPTVAR() = ")
#promptVarName()
#println("DEBUG: END ")
#promptRewind = "previous input is invalid! Rewind program? [ (Y)es/(N)o ]"
function checkYesOrNo(_string)

    conditionNo = uppercase( _string) =="N" || lowercase(_string) == "no" #"No"
    conditionYes = uppercase(_string) == "Y" || lowercase( _string) ==  "yes" #"Yes"

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

        throw(error("ERROR: UnExpectedError Occured "))
    end
end
""" Warn user about wrong input, without exiting the REPL """

#New
function warn(msg = "ERROR: UnExpectedError Occured: please check input then try again, later  ")
    throw(error(msg))
end

function handleResponse(boolFlag,var, kernel = promptVarName ) #updated functon

    if boolFlag == true
        println("DEBUG:   BoolFlag = ",boolFlag,"\n User Prefers to rewind input; use the function:",kernel, " with input argument var:  ",var)
        return kernel(var)

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
""" prompts & handles user's entered `varName`
for a given `varName`, check for null or missing
""" # preferred
function promptVarName(var = "", escapeSequence=escapeSequence) # rechecked #TODO: trimSpaces()

    # take care of the Floating Number:
    # 1. If string was nothing(""), missing, or input was NOT a string Name
    if isNullOrMissing(var) == true
        # Handle it:
        #var = checkHandleDecimalInput(var) #WARNING: `var` can be `nothing ` #<------

        #2. Retry: Automatically (rewind Program): display input's invalid, check if user wants to rewind the function
        #stackOverFlow counter-mechanism, do something different, i.e.
        println("previous input is invalid! Rewind the function? [ (Y)es/(N)o ]")

        # To prevent an unncessary Infinite loop, Kindly Ask User if They want to Rewind with Options: [Y, yes , OR N, no ]

        _string = readline()
        response = checkYesOrNo(_string)

        # Handle the Null decimal value `var`
        var = handleNullValue(var)

        # handle the user-given response for Rewinding ([Y]es / [N]o), passing-in the handeled `var` value
        response = handleResponse(response, var, promptVarName)

        return var #response #var

    #2. if it's valid
    elseif isNullOrMissing(var) == false #|| isaAlphaString(var) == true
            # do nothing

            #var = trimSpaces(var)
            println("Not NULL or Missing <Input is Valid> varName  = ",var) # var = totalAssets

            return var

    # Otherwise, if  it's an escape sequence, User wants to Exit...
    elseif var in escapeSequence
        var = exit() # Program exits the REPL
    # Otherwise, it's an error
    else
        throw(error(msg))
    end

    return var
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
    println("please enter a valid float ")
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

# Sanity Checked
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
#=
# It is Questionable , commented out , (Use the functon above)
function promptValue(   var = 0.0, stringName,  escapeSequence = escapeSequence) # rechecked

    _string = stringName #  ""

    println("Please enter the variable's decimal value, or input an escapeSequence to quit program ")

    # 1. Let User Input a value
    #_string= readline()

    # 2. If stirng was nothing(""), missing or input was a string Name
    condition = isNullOrMissing( var) # == true # ||  isaAlphaString(var) == true
    if condition == true
        # Rewind for user input [restart function], as it cannot be missing
        return promptValue() # reprompt input , from command line
    # 3. otherwise, `_string` is neither nothing(""), missing or a string Name
    elseif condition == false  #isNullOrMissing(var ) == false && isaAlphaString(var) == false  # if input is valid

        # 4. Convert `_string` to a `Float64`
        var = convertToFloat(var)
        return var

        var = convertToFloat(var)
        _string = assignVariableToValue(stringName , var)
        return _string #var # _string
    # Otherwise, at anytime, if user felt stuck, entered  one of the exit strings  to exit
    elseif  _string in escapeSequence # #in  not isa lowercase(_string) in escapeSequence
        return exit() #   program exits the REPL....

    else
        throw(error(msg))
    end

    return var
end

=#
escapeSequence = ["by","bye","c","close","q","quit","e","end","exit", "k","kill","t","terminate","f", "finish", "escape"] # TODO: apply to lower

#@macro Name (to Invoke)
macro Name(arg)
    string(arg)
end

# convertToFloat
""" converts a string Input to its corresponding float64 represenation"""
function convertToFloat(stringInput)
    decimalValue = tryparse(Float64, string(stringInput) ) #<-------
    return decimalValue
end

#lvl1
#=
macro macro_string_as_varname(s::AbstractString, v::Any)  #::Any) # does not perform what is expected
	s = Core.Symbol(s) # <---- `Symbol`: from Core module (automatically imported)
	esc(:($s = $v))
end

varName = @macro_string_as_varname(stringName1, 100)

println("macro_string_as_varname = "  @Name(varName)," with value = ", varName)
=#
#orignial macro

# string_as_varname(s::AbstractString,v::Any)

# lvl1:
#credits to: @NickNack on discourse
macro string_as_varname(s::AbstractString,v::Any) #TODO: try to use this function
         s = Core.Symbol(s)
         @eval (($s) = ($v))
end

## assignVariableToValue(stringName, stringValue)
#!!!Note: given function does not assign a string as a var name, unfortunately
""" assigns input string to a variable
Assumes string is not null nor missing """
function assignVariableToValue(stringName, stringValue)

    stringValue = handleNullValue(stringValue)# Optional (but recommended)
    decimalValue = convertToFloat(stringValue) #tryparse(Float64,stringValue) # decimal value [non-isNullOrMissing]
    # !!!note: string cannot be assigned unless both name & value are present
    #_variable = #string_as_varname(string(stringName),decimalValue ) # now: _string = varValue(_string here)
    _variable = macro_string_as_varname((stringName), decimalValue) # does not perform what it's expected to do

    return _variable #(stringName, decimalValue)
end


println("DEBUG: assignVariableToValue's name = ",@Name(assignVariableToValue2("valuableVariable",1000)), " value = ", valVariable)
#=
function assignVariableToValue2(stringName, stringValue)


    stringValue = handleNullValue(stringValue)# Optional (but recommended)
    decimalValue = convertToFloat(stringValue) #tryparse(Float64,stringValue) # decimal value [non-isNullOrMissing]

    _variable = assignVariableToValue(stringName, decimalValue)
    _variable
end
valVariable = assignVariableToValue2("valuableVariable",1000)
valVariable = assignVariableToValue2("valuableVariable",1000)

=#
println("DEBUG: assignVariableToValue's name = ",@Name(assignVariableToValue2("valuableVariable",1000)), " value = ", valVariable)

#lvl3
""" takes a string name , & a float value
assigns input string to a variable
Assumes string is not null nor missing """

function assignVariableToValue(stringName::AbstractString, varValue)

    #1. Get the decimal value
    decimalValue = convertToFloat(varValue)
    # !!!note: string cannot be assigned unless both name & value are present ( & not Null)

    #2. create a symbol variable from the stringName
    stringName = Core.Symbol(stringName)

    #3. Assign the value to the generated variable
    stringName = decimalValue #@Name(stringName)  #@macro_string_as_varname(stringName,decimalValue) #:($decimalValue)   # macro_string_as_varname(stringName,varValue) #string_as_varname(stringName,varValue)


    stringName # eval(_variable) # or esc(:($_variable = $decimalValue))
end

_variable = 60
a = @Name(_variable) # invoking @Name Macro
println("DEBUG: Demo: @macro Name(arg):  variable name is: ",a)

newVar = assignVariableToValue("newString", 100)
println("DEBUG: newVar should be called newString = ",@Name(newVar), " with value = ", newVar )
#--------
#=
newVar2 = assignVariableToValue2("newString",100)
println("DEBUG: newVar should be called newString = ",@Name(newVar2), " with value = ", newVar2 )
=#
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

function trimSpaces(inputString)

    if isNullOrMissing( inputString) == true
        return ""

    elseif isNullOrMissing( inputString) == true

         inputString = removeSpaces2(inputString) #removeSpaces2(inputString)
         inputString = Base.lstrip(inputString)
         inputString = Base.rstrip(inputString)
    end

    return inputString

end


""" sets a variable  corresponding variable, from a string input, with no pre-defined valued
```
Output:
```
-   variable: has a name of `_string` & a value of `var`
"""
# setVariable [2]

## setVariable(_string="varName")
function setVariable(_string="varName") #updated


    #variable  = initVar()
    #variable = _string

    #variable= promptVarName(_string) #"$_string")# prompt variable using the string's value
    variable = handleNullName(_string)
    #variable = trimSpaces(variable) #corrected

    var  =  0.0
    var  = promptValue(var,variable)#TODO: recheck please
    var = handleNullValue(var)

    variable = assignVariableToValue((variable), var) #<---- given variable Nothing
    #checkResponse()
    return variable
end

""" sets a corresponding variable name, from a string input """
## setVariable(_string="varName")
function setVariable2(_string="varName") #updated


    #variable  = initVar()

    #variable= promptVarName(_string) #"$_string")# prompt variable using the string's value
    variable = handleNullName(_string)

    var  =  initVar() #0.0
    var  = promptValue(var,variable)#TODO:
    var = handleNullValue(var)

    variable = assignVariableToValue(@Name(variable), var) #<---- given variable Nothing
    #checkResponse()
    return variable
end

## setVariable(var=_var,_string="varName")
function setVariable(var=_var,_string="varName")

    #variable  = 0.0
    #variable  = var #initVar()

    #variable= promptVarName(_string) #"$_string")# prompt variable using the string's value
    variable = handleNullName(_string) #TODO: check

    #var  = promptValue(var, variable)#TODO:
    var = handleNullValue(var)

    variable = assignVariableToValue(@Name(variable), var)
 #<---- given variable Nothing
    #checkResponse()
    return variable
end


#println("handleNullName('') = ", handleNullName("" ))
#println("handleNullName(nothing) = ", handleNullName(nothing ))

# handleNullValue

println("entering ''",handleNullValue( promptValue("")) ) # nothing
println("entering abc ",handleNullValue( promptValue("abc") ) ) # nothing
println("entering 07: ", handleNullValue(promptValue("07") ) ) # CORRENT [7.0]



#DEMO - setVariable:
#=
#1. setVariable(""): Input is Null("")
var1 = setVariable("")

println("setVariable('') \n", "stringName = ", @Name(setVariable("")) , " stringValue = ", " $var1" )

=#

#2. setVariable: Input is **Valid**

abc = setVariable("abc",100) # BUG: issue while setting a float to a variable

println("setVariable('abc') \n",abc, " name = ", @Name(abc), " value = ", abc)
println("setVariable('bn6') \n",setVariable("bn6"))
println("setVariable('spacey ') \n",setVariable("spacey "))


#println("removeSpaces2('spacey') = ", removeSpaces1("spacey"))

println("removeSpaces2('spacey') = ", removeSpaces2("spacey"))
println("removeSpaces2('spacey') = ", removeSpaces2("spacey "))
println("removeSpaces2('spacey') = ", removeSpaces2(" spacey"))
resTrimmed = trimSpaces(" spacey ")

println("resTrimmed  = ", resTrimmed)

println(handleNull(" spacey ")) #ok

#handleNullValue()
println("handleNullName( spacey ) ", handleNullName(" spacey "))

println("removeSpaces2('spacey') = ", removeSpaces2(" spa cey "))

println("removeSpaces2(' spacey ') = ", removeSpaces2(" spa cey "))
println("setVariable('spacey ') \n",setVariable("spacey "))
println("prmpt", promptValue(1)) #TODO: Recheck
