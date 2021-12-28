"""
The Accounting Trinity or [CAL]!

[]: important (somehow) - it's objective alright
(): optional read , acts as a comment
me: personal words, to add an overall flavor & meaning to the comment itself - as needed
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

global capital(totalCapital) =abs(totalCapital);
global asset(totalAssets) = abs(totalLiabilities)
global liability(totalLiabilities) = abs(totalLiabilities)
#nothing, yet - chop chop, gotta go, are you there yet, where you at!


 #syntax: incomplete: "module" at /Users/ahmadlutfi/Desktop/src/src/accountingTrinity.jl:3 requires end

#TODO: working input ref ... # DONE!
capital = input("please insert total $capital")  # insert a value only
print("capital:   $capital") # TODO: Ignore Alpha words -- REGEX  - maybe later -- I guessed it
#@assert capital >= 0

export calcCapital, capital,liability
#=
function calcCapital(totalAssets,totalLiabilities)
asset = abs(totalAssets);  liability = abs(totalLiabilites) #edit: I don't recall writing those , conciously -wow
=#

#return max(asset, liability) - min(asset, liability) #that's another thing I've been thinking about - to add or not the add -- that is the Question
capital = asset - liability # for some reason i have to check with liability ... #TODO:
return capital # Capital
end

#---
#capital Calculation

#TODO:calculate Asset  = capital - liability  #Done!
#"""user inserts  totalCapital"""

#TODO:finish
"""
function calcAssets(totalCapital, totalLiabilities)
capital(totalCapital) = tryparse(:Number, input("please insert total Capital"))  # capital(totalCapital)
liability(totalLiabilities) = tryparse(:Number, input("please insert total Liabilities")) #abs(totalLiabilities)
#TODO:
            return max(capital, liability) - min(capital, liability)
return capital - liability # = Asset
end
end
"""
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
# TODO: error with prompt #Done @ 6:15 pm
function prompt(message="How are you feeling?") #Working: #getback: prompt's 2 methods prompt() & prompt(message)

print(message*"\n")
line = readline() #read # ok
# splits on spaces and casts to T
result = produce(map(x -> parse(T, x), split(line)))
# return #result
return parsebin(line) #ok
end #Done ! #Correct #checked #prompt(message)

#---
# num = parse(Number, line)
# num =map(x -> parse(Real{Integer},line)

#--- map parse a long dump, long way to go

# num = map(x-> parse(Real{Integer}),line)
#num = custom_parse(T, x::AbstractString) = parse(T, x)  #nope
#num = custom_parse(::Type{T}, x::AbstractString) where #

#{T <: AbstractString} = T(x)
#num = parse(Integer,line)
#my_parse(T, x) = ((T <: AbstractString) && (x isa AbstractString)) ? x : parse(T, x)

#num = map(x -> my_parse(x...), zip((Int64,Float64,String),("123","234","234.7")))
#num = map(x -> my_parse(x), zip((Int64),(line)))
#num = map(x->parse(Integer,x),line)#!null

#if isnumeric(num)#assumes numeric = Number
#    return "$num"*" " *typeof(num)
#else
#end
#TODO:Errors out - for some reason ....??? -What ...
#prompt("How are you feeling?") #it did NOT Prompt - I Swear it's over

#---  ap(x -> parse(T, x)
#it's so calm - I hear nobody, oh wait, tere a a sound feels like mom's - is she back -- maybe it's my imagination
_out =""
i=0
while i<1 #!eof(f)
    print("please say something")
    line = readline()#readline(f)
    # splits on spaces and casts to T
    _out = id, s = split(s, '')#produce(map(x -> parse(T, x), split(line)))
i=i+1
end
print(_out)
#--- parse styff - input: file


function parsestuff(file)
    if(file == nothing) result = ""
    else
    buf = read(file)
    len = length(buf)
    pos = 1
    opts = Parsers.Options(delim=' ', wh1=0x00)
    while pos <= len
        res = Parsers.xparse(Int, buf, pos, len, opts)
        if Parsers.ok(res.code)
            # parsing succeeded, do stuff with res.val
        end
        pos += res.tlen
    end
end
end # needed this little end - made out of 3 chars, in the end


result = parsestuff(input("how are you doing?"))  # for file or directory - knock, knock you're there ? --not yet -can I have a Cold Brew -- I LIKE A PIZZAss , I'm up to it --- me too ! count me in
print(result)
