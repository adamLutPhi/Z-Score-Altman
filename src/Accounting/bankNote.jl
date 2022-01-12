module bankNote

#--- functions
"""
Mimics the Cash found in a cash-registry systems

Idea: how about adding a penny, & a nickle ??

"""
function _5dollar(count::Interger,value=5)
end
function _10dollar(count::Interger,value=10)
end
function _20dollar(count::Interger, value=20)

end

#TODO: time of start counting of Inflation -i.e. inflation, since When?
"""
a generic dollar amount
has a value
Changing based on inflation
"""
# a generic dollar amount: has a value Changing based on inflation
#
function _Xdollar(value, ,inflation = 5 * 10^-2)
"""
returns the intrinsic value of a dollar
"""
    intrinsic_value =  (value - value * inflation)
    #if has
    return intrinsic_value
end

#The must-have factor
"""
based on netwon's renowned f = m * a in classical phyiscs
a dollar has a physical value, that is changing by changin the
1. velocity:
2. acceleration:

"""
function _Xdollar(value, velocity, acceleration,inflation=10^-1)

    intrinsic_value =  (value - value * inflation)
    #if has
end
end
