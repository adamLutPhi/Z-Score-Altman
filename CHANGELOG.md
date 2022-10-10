# 10-2-2022

## Update: instead of not taking (2) two input arguments, as the 2nd `result` allows user to input another string, to be assigned for InputString, when the latter is null

E.g. handleNullOrMissing(.., result)

## update :

- handleNull(stringInput, result): added `result`, as a new input argument
to be called, right after `isNull`,

TODO: recheck function (to check on the new  changes)

## add

- checkIsNumber(result): to check variable value is a floating number


## update
- handleMissing(stringInput, result): adds `result`, as a 2nd input argument; if `stringInput` is null

## update

- handleNullOrMissing()
minor changes in the control-flow statement


# 10-3-2022

# update
- handleNullOrMissing(stringInput)

## update
- `promptName` :
- `promptValue`:

## update
- `isNull(_string)`: checked

- `handleNull(_string)`:  changed inner functionality

# 10-5-2022

## add
- `handleNullName`: checks & handles user-input, for the variable Name
- `handleNullValue`: checks, handles user-input, for the variable value

- `setVariable` : covers the whole process of prompt, read, check hand nullability of a variable , while doing same thing for its respective value, and finally Assining the name, for that value

# 10-7-2022

## update

`isNullOrMissing` taking 2 boolean conditions (`isNull`, `isMissing`)
so that one can evaluate each boolean flag seperately

`isNullOrMissing`
-  debugged the single input argument function
-  debugged the (2) Two input argument function, as well

- `handleNullName`: compiles

- `handleNullValue`: compiles, as well  

- `main.jl` compiles

# 10-8-2022

- `handleNull` has an Unclear context
(2) functions offered, in return: `handleNullName` `handleNullValue`


# 10/9/2022

## add
getCurrentLiabilities()



## remove
- `nonCurrentAssets` (2) functions:
 `getnonCurrentAssets` , `calcNonCurrentAssets`

Altman's scope does not cover `non-Current Assets`
(are Assets lasting 3 to 5 years)
as it is not of interest ( whereas `currentAssets` is of interest)
because solvency is concerned with the current year ( of a firm)


## update

- `currenttLiabilities to `getCurrentLiabilities()`

- `calcAssets()` to `calcTotalAssets()`

- `createVariable(_string)`  to `setVariable(_string)`

- getTotalLiabilities(): to be input, by user
