# TODO: Altman's z score


function altmanCoeffs(currentAssets,currentLiabilities,totalAssets,)

#=
CheatSheet:

totalAssets goes into: X1, X2, X3
=#
workingCapital = currentAssets - currentLiabilities


#= X1 = working Capital / total assets
needs to be shown
currentAssets: any asset that will
provide an economic value for or
 within one year
 =#

X1 = workingCapital / totalAssets

# X2 = retained earnings / total assets

X2 = retainedEarnings / totalAssets

# X3 = earnings / total assets
X3 = earnings / totalAssets

# X4 = equity / total liabilities

X4 = equity / totalLiabilities

# X5 = sales / total assets

X5 = sales / totalAssets


return X1,X2,X3,X4,X5
end
