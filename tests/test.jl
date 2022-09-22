
"""
Testing: in "the Application Space"
Rules: no parsing in the Test Phase
#TOOD: remove every parsing from "the Testing Space"
when initializing: recall we are in the "Application Space" - our Repository
since that's true -then-> we have to abide with this space
hence's it 's prefered to do either 1 of the foloowing (based on the Implementer's Strategy)
# Implementation strategy:

1. Generalization: Use Any for all numbers
(specify later, on the Go)
2.Specialization:
for specic trypes of implementation
upon implemntation: what is the implemation strategy:
1. Do we round off any value ( or leave as is)?
2. if so: do we always Floor or Ceil the value?
(maybe speccific use of promotion in certain cases)

is Number an abstract type ( used in the abstract space)
hence cannot be used in reality ?
remmendation: use any ( gene) or Float64 (real-world apps)
"""

function parsing(message1="please insert a Number", message2=3000 ::Number) #i.e. Number & string

# if isnumeric(tryparse( typeof(message2) ,
#if tryparse(Number,input(message1) isa Number) ? true : false
    # isnumeric(tryparse(typeof(message2) , input(message1 +"is"+"$message2 \n")) ? true : false)))
#else
#    return
     #throw() #rethrow()
#end
end

function parsing(message1="please insert a(an) (IR)Rational Number", message2=3000 ::Float64) # should always error Out : message2 is by default an Integet i.e. Number & string

# if isnumeric(tryparse( typeof(message2) ,

"""
Number: is an abstract value only, used in the Abstract Space, only
tryparse : used for DateTime types mainly (plus other ones)

Recommendation: use pasps
"""
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
 ßend
end

"""
is
"""
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
