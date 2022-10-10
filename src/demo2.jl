if typeof(stringInput) === Nothing #not hit
 stringInput = "0.00" ;  println("1st: Nothing was given"); _decimal = 0.0
end

if typeof(stringInput) === nothing #not hit
 stringInput = "0.00" ;  println("2nd: Nothing was given"); _decimal = 0.0
end

if typeof(stringInput) isa Nothing # Nope
 stringInput = "0.00" ;  println("3rd: Nothing was given"); _decimal = 0.0
end

if typeof(stringInput) isa Missing # Guess not
 stringInput = "0.00" ;  println("4th: Nothing was given"); _decimal = 0.0
end

if stringInput isa Missing # Works
 stringInput = "0.00" ;  println("5th: Nothing was given"); _decimal = 0.0
end

if stringInput isa Missing # No
 stringInput = "0.00" ;  println("6th: Nothing was given"); _decimal = 0.0
end

if stringInput === Missing # later
 stringInput = "0.00" ;  println("7th: Nothing was given"); _decimal = 0.0
end

if typeof(stringInput) === Missing # again,no
 stringInput = "0.00" ;  println("8th: Nothing was given"); _decimal = 0.0
end

if stringInput == nothing
 stringInput = "0.00" ;  println("9th: Nothing was given"); _decimal = 0.0
end

if stringInput === Nothing
 stringInput = "0.00" ;  println("10th: Nothing was given"); _decimal = 0.0
end

if stringInput === "" # works! (all the time  )
 stringInput = "0.00" ;  println("11th: Nothing was given"); _decimal = 0.0
end

if typeof(stringInput) isa Missing
 stringInput = "0.00" ;  println("12th: Nothing was given"); _decimal = 0.0
end

if typeof(stringInput) isa Nothing
 stringInput = "0.00" ;  println("13th: Nothing was given"); _decimal = 0.0
end

if typeof(stringInput) isa Missing
    stringInput = "0.00" ;  println("13th: Nothing was given"); _decimal = 0.0
end

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


# Demo

if missing === Missing
    println("try 1: ", true )
end

if typeof(missing) isa Missing
    println("try 2: ", true )
end

if missing isa Missing # correct
    println("try 3: ", true )
end
if ismissing(missing) === true # correct
    println("try 4: ", true )
end

#checkNull
println(checkNull(missing))

# =#
# Matrix [i,j]
indicies = [ CartesianIndex(m.v[i], m.v[j]) for (i,j) in m.e ]
