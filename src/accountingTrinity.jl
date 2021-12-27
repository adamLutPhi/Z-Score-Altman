## ---

module findtheThird


capital = parse(Float64, input("insert total capital"))
@assert capital
export calcCapital, capital,liability
function calcCapital(totalAssets,totalLiabilities)
asset = abs(totalAssets) ; liability = abs(totalLiabilites)
#return max(asset, liability) - min(asset, liability)
return asset - liability
end
#---
#capital Calculation
#TODO: #Done!
#"""user inserts  totalCapital"""
global capital(totalCapital) =abs(totalCapital);
global liability(totalLiabilities) = abs(totalLiabilities)
#TODO: #Done!

function calcAssets(totalCapital, totalLiabilities)
capital(totalCapital) = tryparse(:Number, input("please insert total Capital"))  # capital(totalCapital)
liability(totalLiabilities) = tryparse(:Number, input("please insert total Liabilities")) #abs(totalLiabilities)
#return max(capital, liability) - min(capital, liability)
return capital - liability
end

end

#---

using Parsers
 function baseline(s,delimiter=' ')
           pieces = split(s, delimiter, keepempty=false)
           map(pieces) do piece
               parse(Float64, piece)
           end
       end

read  = readline()
read
 #p = Parsers.DELIMITED(" ", ignorerepeated=true);


function inquire(message="")
print(message+"\n")
line = readline()
return line
end
