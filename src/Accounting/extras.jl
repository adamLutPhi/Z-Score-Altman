module extras

end  # module extras
"""
cleaner to return nothing in this case
There are 3 (equally valid) ways I might use to do this. All 3 return nothing:
"""
Method 1

function myfunc()
    #do something
    return
end
Method 2

function myfunc()
    #do something
    return nothing
end
Method 3

function myfunc()
    #do something
    nothing
end
