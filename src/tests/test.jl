function parsing(message1="please insert a Number", message2=3000 ::Number) #i.e. Number & string

# if isnumeric(tryparse( typeof(message2) ,
if tryparse(Number,input(message1) isa Number) ? true : false
    # isnumeric(tryparse(typeof(message2) , input(message1 +"is"+"$message2 \n")) ? true : false)))
#else
#    return
     #throw() #rethrow()

end
end


#Extension: Explicit Importation
function Base.tryparse(::Type{Number}, ::Bool) if true ? true : false
end
end
# end

function oneLinerParsing(message1, prompt2)

 if isstructtype(typeof("$message1")) ? true : nothing #rethrow()
end
end


if isstructtype(cd) ? true : nothing #rethrow()
end
end

@assert isstructtype(
end
end
#=
 if isstructtype(typeof("$message1")) ? true : nothing #rethrow()
end
end
=#
#=

# @assert parsing( 3000, "accountant")

@assert parsing("accounts Payable", 3000) #is true

#=
try multi-dispatch on String
no method matching tryparse "String"
