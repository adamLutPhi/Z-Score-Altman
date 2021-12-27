function parsing(message1, message2 ) #i.e. Number & string

if tryparse( typeof("$message1") , input("$message1 $message2 \n"))

else
    throw() #rethrow()

end
end
@assert parsing( 3000, "accountant")

@assert parsing ("accounts Payable", 3000)

#=
try multi-dispatch on String
no method matching tryparse "String"
