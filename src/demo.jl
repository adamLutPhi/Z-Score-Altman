#using main
include("main.jl")
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


stringInput = "stringInput"
println(" $prompt $stringInput")
stringInput =  readline() #tryparse(Float64, input("$prompt " + decimalVal(stringInput,2)+"\n"))

#3. Parse to decimal

if stringInput isa Missing &&  ismissing(stringInput) === true  # correct
    println( true)    #rintln("try 3: ", true )

elseif  !(stringInput isa Missing) ||  ismissing(stringInput) === false
    println(false)
end
