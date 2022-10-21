#=demo2.jl

!!!note: `isa` use with a value is not possible, using `===` instead
=#
# include("main.jl")
#=

Description:

this file checks the missing condition
explores
Wheter `stringInput` is:

1. `null` OR

2. `missing`

1. `null` condition :
in the pursuit of doing that,
Use the following conditions:

1. of type `Nothing`

2. of type `nothing`

2. `missing` condition:


=#

stringInput = readline()

# Trying out null conditons (keywords: `nothing`, `Nothing`)

if typeof(stringInput) === Nothing #not hit
    stringInput = "0.00" ;  println("1st: Nothing was provided"); _decimal = 0.0
end

if typeof(stringInput) === Nothing #not hit
    stringInput = "0.00" ;  println("2nd: Nothing was provided"); _decimal = 0.0
end


# Trying out `Missing` conditons (keywords: `Missing`, `Nothing`)
## the type of `stringInput` `isa Missing` :


#end

# 1. Null Condition

## 1.1. using `nothing`
###1.1.1 `==  nothing ` condition

#1
if typeof(stringInput) == nothing # [`null` Condition not activated ]
    stringInput = "0.00" ;  println("1.1. 1st: typeof(stringInput) == `nothing` was provided [as Null ]"); _decimal = 0.0
end

#2 `== nothing `
if stringInput == nothing # [`null` Condition not activated ]
    stringInput = "0.00" ;  println("1.1. 2nd `stringInput == `nothing`  was provided [as Null]"); _decimal = 0.0
end

#---------------

##1.2.
### `isa nothing`

# TypeError - expected Type got a value
if typeof(stringInput) === nothing  #isa nothing # <--- ERROR {syntax error }
    stringInput = "0.00" ;  println("1.2.1 `typeof(stringInput)` Nothing was provided"); _decimal = 0.0
end

if stringInput === nothing  #isa nothing # did not work!
    stringInput = "0.00" ;  println("1.2.2 `stringInput`  Nothing was provided"); _decimal = 0.0
end

## 1.3. using `""`

#1 typeof
if typeof(stringInput) == ""
    stringInput = "0.00" ;  println("1.3.1  `typeof(stringInput)` Nothing was provided"); _decimal = 0.0
end

#2
if stringInput == "" #  always work [`null` Condition  Activated ]
    stringInput = "0.00" ;  println("1.3.2 : Nothing was provided"); _decimal = 0.0
end

## 1.4 using ``

#1
if typeof(stringInput) === "" #isa ""
    stringInput = "0.00" ;  println("1.4.1  `typeof(stringInput) === '' ` : Nothing was provided"); _decimal = 0.0
end

#2
if stringInput === "" #isa ""
    stringInput = "0.00" ;  println("1.4.2 stringInput === '': Nothing was provided"); _decimal = 0.0
end


## 1.2. using `Nothing` condition
#-----
#additional condition:

#using `===`

if typeof(stringInput) === "" # works! (all the time  ) # [`null` Condition  Activated ]
    stringInput = "0.00" ;  println("1.5.1 `typeof(stringInput) `: Nothing was provided"); _decimal = 0.0
end

if stringInput === "" # works! (all the time  ) # [`null` Condition  Activated ]
    stringInput = "0.00" ;  println("1.5.2 `stringInput` : Nothing was provided"); _decimal = 0.0
end

###1.2 .1 `isa Nothing` condition

#1
if typeof(stringInput) isa Nothing # [`null` condition not activated ]

    stringInput = "0.00" ;  println("1.6.1  `typeof(stringInput)` : Nothing was provided"); _decimal = 0.0
end

#2
if stringInput isa Nothing
    stringInput = "0.00" ;  println("1.6.2 `stringInput `: Nothing was provided"); _decimal = 0.0
end

#-------------
#2.  `Missing` Condition:

## 2.1 using `Missing` condition

### 2.1.1 `isa Missing`

#1
if typeof(stringInput) isa Missing # (Guess not) # [Condition not Activated]
    stringInput = "0.00" ;  println("2.1.1  `typeof(stringInput)`: Missing was provided"); _decimal = 0.0
end

#2
if stringInput isa Missing # No # [`Missing` Condition not activated ]
    stringInput = "0.00" ;  println("2.1.1  `stringInput`: Missing was provided"); _decimal = 0.0
end

#-------------
# missing

## 2.2  `=== missing`  #`isa missing`

#1 typeof
# LoadError: TypeError: in isa, expected Type, got a value of type Missing
if typeof(stringInput) === missing # isa missing # Works # [`Missing`  Condition Activated ]
    stringInput = "0.00" ;  println("2.2.1  `typeof(stringInput) isa missing` was provided"); _decimal = 0.0
end

#2
if stringInput === missing # isa missing # Works # [`Missing`  Condition Activated ]
    stringInput = "0.00" ;  println("2.2.2 `stringInput isa missing` was provided"); _decimal = 0.0
end

#-------------------
#!!!note: stop using isa (throws unncessary errors ), use `===` always as possible
#-----------------
## 2.3. == Missing

#1
if typeof(stringInput) == Missing # again,no [`Missing` Condition not activated ]
    stringInput = "0.00" ;  println("2.3.1 `typeof(stringInput)` : Nothing was provided"); _decimal = 0.0

end

#2
if stringInput == Missing # again,no [`Missing` Condition not activated ]
    stringInput = "0.00" ;  println("2.3.2 `stringInput`: Nothing was provided"); _decimal = 0.0

end

#---------
# `isa Missing`
#!!! Note: here, `isa` works fine as it was presented with a Type `Missing`

## 2.3. isa Missing
#1
if typeof(stringInput) isa Missing # [ `Missing` Condition not activated ]

    stringInput = "0.00" ;  println("2.4.1 `typeof(stringInput) isa Missing`: Nothing was provided"); _decimal = 0.0
end

#2
if stringInput isa Missing # [ `Missing` Condition not activated ]

    stringInput = "0.00" ;  println("2.4.2 `stringInput isa Missing` : Nothing was provided"); _decimal = 0.0
end

#-----------


### ==


#-------
# functions

# checkMissing

## checkMissing(stringInput)
""" returns either true or false """
function checkMissing(stringInput) # suspicious : checking missing, but function says it checks nulls

    #    try

        if stringInput === missing
            return true
        elseif  stringInput !== missing
            return false

        else
            throw(UnExpectedError)
        end

#    catch UnExpectedError
#        @error "ERROR: Please recheck input: ", exception=(UnExpectedError, catch_backtrace())

#    end

end

# Demo - trying out the following `missing` conditions:

#condition #1
if missing === Missing
    println("try 1: `missing === Missing` ", true )
end
#------
#condition #2
if typeof(missing) isa Missing
    println("try 2: typeof(missing) isa Missing ", true )
end

#condition #3
if missing isa Missing # correct
    println("try 3: ` missing isa Missing`", true )
end

#-------------
#Condition #4
#ismissing compiles , works as expected

if ismissing(missing) === true # correct
    println("try 4: `ismissing(missing)` ", true )
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

println("isMissing(missing) =  ",isMissing(missing))
#end (of `missing` conditon )
#----------
# isNull

""" A function checks  if input string is Null (user enters nothing, presses 'return')"""

function isNull(_string) # compiles #preferred

    #try
    condition =  _string === "" || _string === nothing
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

println("DEBUG: try isNull('') = ",isNull("") )

#---------
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
#----

#DEMO checkNull - passing a `missing`
println("checkNull(missing) = ",checkNull(missing))

# Extra

## CartesianIndex:

#the following is a `List Comprehension` that Should Generate a `Matrix` with the following indicies: row = i , column = j

# Matrix [i,j]
# m (matrix) is not defined
#m = zeros(10,10) # error, LoadError: Array `m` doesn't have a field `e`
#indicies = [ CartesianIndex(m.v[i], m.v[j]) for (i,j) in m.e ]
#println("CartesianIndices = ", indicies)
