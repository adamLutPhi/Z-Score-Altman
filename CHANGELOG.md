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

- `handleNullOrMissing()`
  minor changes in the control-flow statement


# 10-3-2022

# update
- `handleNullOrMissing(stringInput)` :

function is debugged, updating changes that reders it functional


## update
- `promptName()` : prompts user to enter a string name, for a variable
- `promptValue()`: prompts user to enter a decimal value, for a variable

## update
- `isNull(_string)`: checked, changes been applied

- `handleNull(_string)`:  inner logic been checked &  functionality has been changed

# 10-5-2022

## add
- `handleNullName`: checks & handles user-input, for the variable Name
- `handleNullValue`: checks, handles user-input, for the variable value

- `setVariable` : covers the whole process of prompt, read, nullability check of a variable , while doing same thing for its respective value, and finally Assigning the name, for that value

# 10-7-2022

## update

`isNullOrMissing`: Takes  (2) Two `Bool` condition functions (`isNull()`, `isMissing()`)
so that one can evaluate each `Bool` flag seperately

`isNullOrMissing`
-  debugged the single input argument function
-  debugged the (2) Two input argument function, as well

- `handleNullName`: been checked, now compiles

- `handleNullValue`: been check & compiles, as well  

- `main.jl` compiles

# 10-8-2022

- `handleNull` has an Unclear context
(2) functions been offered, in return: `handleNullName` `handleNullValue`
both of which uses `handleNull`, however, the handling is done , based on the expected typ
`handleNullName` is expected to return `String` while `handleNullValue`
expected to parse input string of default value `0.00` to  a `Float64` then
returns the corresponding value  

# 10-9-2022

## add
- `getCurrentLiabilities()`: prompts user to input the string equivalents of variable name, & a variable's float, both inputs are transfromed into a single variable
the process is repeated for each variable item, contained in `currentLiabilities`


## remove
- `nonCurrentAssets` (2) function variations:
 `getnonCurrentAssets` , `calcNonCurrentAssets`

Altman's scope does not cover `non-Current Assets`
(are Assets lasting **3 to 5 years**)
as it is not of interest ( whereas `currentAssets` is )
because **solvency** is concerned with the current year ( **earnings** of a firm)


## update

- `currenttLiabilities to `getCurrentLiabilities()`: function been renamed

- `calcAssets()` to `calcTotalAssets()`: function been renamed

- `createVariable(_string)`  to `setVariable(_string)`

- getTotalLiabilities(): to be input, prompted by the  user

# 10-11-2022

## remove

-	`currentassets`: besides the function name being a noun (& not a verb),
it is also a duplicate for an already existing function: `getCurrentAssets()`

# 10-14-2022

## update
- `getCurrentAssets()`
- `calcCurrentAssets()`
- `getCurrentLiabilities()`
- `calcCurrentLiabilities()`
- `handleNull()`

# 10-15-2022
## update

- `isNull(_string)`:
Updated condition to allow either `nothing` or `""`  as `null`

# 10-16-2022
## BUG found

- `assignVariableToValue`

## update

- `string_as_varname_macro`: renamed to `macro_string_as_varname`
- `assignVariableToValue`: uses `macro_string_as_varname`

10-18-2022

## add

- `warn()`: throws an error, and warns the user about the faulty input . what makes it useful is that
it doesn't unexpectedly exits the REPL. the User stays in the REPL,
which lets the user easily re-invoke the function, with possibly a valid input, afterwards

## update

`handleResponse()`: a second input argument has been added , to  pass & handle the decimal `var` value

- `handleResponse()` added a third input argument `kernel` to pass in the corresponding function, either `promptVarName`
or even possibly `promptValue`

10-20-2022

## update

`isNull`: condition logic been updated
& checked in `demo2`

- `trimSpaces`: corrected condition (recheck is required)

- `main.jl` runs withou Error  
