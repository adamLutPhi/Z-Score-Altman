"""
The Accounting Trinity or [CAL]!

[]: important (somehow) - it's objective alright
(): optional read , acts as a comment
me: personal words, to add an overall flavor & meaning to the comment itself - as needed
A/C : Account - a fancy way accountants use for any account 'book'
1.Assets k let's start - here goes nothing

2.Capital :  an abstract entity me: i.e. bank account value- me: has a Direct Relation with either an 'Asset' or a Liability A/C "Account"
3.Assets: a Tangible object, of Value, has an/a owner(s)

below is the explination, non-academic - based on the Personal View -- for your eyes only,ok
# 3.1 thinking about it - I'm a comment after all oh wait maybe I'm not -- who Am ... I ??? - stop talking this is your brain police stop --or what ? - we'll see
#3.2 Ownership:


the actual Owner: for whom the Account belongs to - usualy 1 or more Seperate entities (persons, companies - or mix of the 2 )

1. One Owner: 1 is the lonliest number, if that's you , kudos to you!
2. A couple, partnerships or best Friends (usually Spoils in, or before the end (whatever that means)  you know,  as nothing stands still on its own for good- hate to spoil that on you!) - but sb gotta spill the Beans, right ;) -- sb: somebody
3. 3 ot more: fits the bill for  family-related  members  - [Time: for either long-term or short-term]

3.Liabilities: Debt,  shares US ()(intl.) - how to say in the UK???(if you're authorized to issue that ), given by other people willingly (hopefully they know what they're doing, right) i.e.  Accounts payable A/P  , me: the 'pay me back later, okay?' accounts  - [either long-term or short-term]

together, they make up the following Golden (brown) Equation:

                Assets = Liabilites + Capital
"""
# the Accounting Equation , :
## Assets = Liabilites + Capital
## ---
#existential question the function is already equal to its absolute value -talk about a Self-reference !
global capital(totalCapital) =abs(totalCapital);
global asset(totalAssets) = abs(totalLiabilities)
global liability(totalLiabilities) = abs(totalLiabilities)
#nothing, yet - chop chop, gotta go, are you there yet, where you at!


 #syntax: incomplete: "module" at /Users/ahmadlutfi/Desktop/src/src/accountingTrinity.jl:3 requires end

#TODO: working input ref ... # DONE!
capital = input("please insert total $capital")  # insert a value only
liability = input("please insert total $liability")
asset = input("please insert total $asset")

print("capital:   $capital") # TODO: Ignore Alpha words -- REGEX  - maybe later -- I guessed it
#@assert capital >= 0

export calcCapital, capital,liability
#=
function calcCapital(totalAssets,totalLiabilities)
asset = abs(totalAssets);  liability = abs(totalLiabilites) #edit: I don't recall writing those , conciously -wow
=#

function calcCapital(asset, liability)
#return max(asset, liability) - min(asset, liability) #that's another thing I've been thinking about - to add or not the add -- that is the Question
"""
capital = asset - liability
"""
capital = asset - liability # for some reason i have to check with liability ... #TODO:
return capital # Capital

function calcAsset(capital, liability)
"""
asset =  - liability

"""
asset : asset <
capital = asset - liability
return capital
end

function calcLiability(capital, asset)
liability  =   capital - asset
return liability

end

end

#--- Asset Calculation
#capital Calculation ?

#TODO:calculate Asset  = capital - liability  #Done!
#"""user inserts  totalCapital"""

#TODO:finish
"""
function calcAssets(totalCapital, totalLiabilities)
capital(totalCapital) = tryparse(:Number, input("please insert total Capital"))  # capital(totalCapital)
liability(totalLiabilities) = tryparse(:Number, input("please insert total Liabilities")) #abs(totalLiabilities)
#TODO:
            return max(capital, liability) - min(capital, liability) #
return capital - liability # = Asset
end
end
"""

"
Capital account v.s liability account

Credit / debit   account algebra :

Cr*Cr = Dr

Dr*Dr = Dr

(-): credit
(+): debit

Dr: Debit
Cr: Credit

liability account decrease could be from
paying off Accounts Payable i.e. (-) Accounts Payable A/C [Credit Account] : (-)credit Accounts Payable A/C,
decreasing(-) Accounts Payable A/C - Credit Account #whenever you Credit a   (-)credit account, that means you are Debiting (decreasing, here) the Credit Account i.e. Cr*Cr = Dr,
adding(+) more Accounts Recievable (+) Accounts Recievable A/R [Debit Account] : (+)debit, Accounts Recieveble A/C - Debit Account (+)is debit #whenever you Debit a Debit account, means you
i.e. some one is Paying you off Dr*Dr = Dr

(-) Accounts Payable A/C

"
function calcAsset(totalCapital, totalLiabilities)



end
#--- prompt Area
#=
using Parsers
 function baseline(s,delimiter=' ')
           pieces = split(s, delimiter, keepempty=false)
           map(pieces) do piece
               parse(Float64, piece)
           end
       end

read  = readline()

 #p = Parsers.DELIMITED(" ", ignorerepeated=true);
=#
#--- ....
#= TODO:READ - Someday, ok - getback -- on it
function _sth parse(::Type{T}, s::AbstractString) where T
    y = tryparse(T, s)
    y === nothing && throw(ArgumentError("Cannot parse as $T: \"$s\""))
    return y
end
=#
#--- Checking region ...
# TODO:  prompt #Done @ 6:15 pm
function prompt(message="How are you feeling?") #Working: #getback: prompt's 2 methods prompt() & prompt(message)

print(message*"\n")
line = readline() #read # ok # string
# splits on spaces and casts to T
#result = produce(map(x -> parse(T, x), split(line)))
# return #result
return parse(Complex,line) #ok
end #Done ! #Correct #checked #prompt(message)
prompt() #gets lost: reason(type input variable)- i.e. is it Float64 ? --unsure: the most existential questionyou might ask
#oh my handling complex vars is complex (in itself!)
#what type of work around & remedyyou'll do
#don't know what type of input user may enter  either string or number
# if number, will it be complex - Problem
#but. let  it be a  Float64 - no problem!



using Test
global digits= 10
global datatype = nothing
function inputHandling(T)
 #--- test Region

    for sign in ('-','+'), Im in ("i","j","im"), s1 in (""," "), s2 in (""," "), s3 in (""," "), s4 in (""," ")
         for r in (1,0,-1), i in (1,0,-1),
             n = Complex(r, sign == '+' ? i : -i)
             s = string(s1, r, s2, sign, s3, i, Im, s4)
             @test n === parse(Complex{Int}, s)
             @test Complex(r) === parse(Complex{Int}, string(s1, r, s2))
             @test Complex(0,i) === parse(Complex{Int}, string(s3, i, Im, s4))
             for T in (Float64, BigFloat)
                 nT = parse(Complex{T}, s)
                 @test nT isa Complex{T}
                 @test nT == n
                 @test n == parse(Complex{T}, string(s1, r, ".0", s2, sign, s3, i, ".0", Im, s4))
                 @test n*parse(T,"1e-3") == parse(Complex{T}, string(s1, r, "e-3", s2, sign, s3, i, "e-3", Im, s4))
             end

         end
         for r in (-1.0,-1e-9,Inf,-Inf,NaN), i in (-1.0,-1e-9,Inf,NaN)
    n = Complex(r, sign == '+' ? i : -i)
    s = lowercase(string(s1, r, s2, sign, s3, i, Im, s4))
    @test n === parse(ComplexF64, s)
    @test Complex(r) === parse(ComplexF64, string(s1, r, s2))
    @test Complex(0,i) === parse(ComplexF64, string(s3, i, Im, s4))
end
end
end
for T in (Int, Float64), bad in ("3 + 4*im", "3 + 4", "1+2ij", "1im-3im", "++4im")
    @test_throws ArgumentError parse(Complex{T}, bad)
end
@test_throws ArgumentError parse(Complex{Int}, "3 + 4.2im")
#test passed


#--- T Handling #DONE

if(typeof(T) isa Int)
datatype = Int
@inferred parse(Int, "$digits")
# end
elseif (typeof(T) isa Float64)
    datatype = Float64
@inferred parse(Float64, "$digits")
#end
elseif(typeof(T) isa Complex{Int})
    datatype = Complex{Int}
     @inferred parse(Complex{Int}, "$digits")
end

#you're in my head, Always....
