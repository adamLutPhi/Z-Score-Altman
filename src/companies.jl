include("main.jl")

#Demo for `crackerBarrel`

function demo1(cash =45105, accountsReceivable = 32246, inventory = 213249 ,securities=0,commercialPaper=0, treasuryNotes=0,other=48602,
     notesPayable = 0.0 , accountsPayable= 169871 , accruedExpense = 0 , unearnedRevenue =0  ,longtermDebt=423249,
     totalAssets = 2294911 )

    CurrentAssets = getCurrentAssets([cash, accountsReceivable  ,inventory, securities,commercialPaper, treasuryNotes ,other])
    #currentLiabilities = getCurrentLiabilities()

    currentLiabilities = getCurrentLiabilities([notesPayable, accountsPayable, accruedExpense, unearnedRevenue, longtermDebt])

    workingCapital = getWorkingCapital(currentAssets, currentLiabilities)

    totalAssets = getTotalAssets(totalAssets) #promptTotalAssets()


end

demo1()
