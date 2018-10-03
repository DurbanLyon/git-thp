def stairs()
puts "Je peux contruire jusqu'à 25 étages de brique. Combien en veux-tu ?"
print ">"
x = gets.chomp.to_i
return x
end

def build(x)
r = x * 2

n = 1 
while n <= x && n <= 26
    if (n == 1)
        puts ("# " * n).rjust(r)
    else
        puts ("# " * n).rjust(r)
    end
    n += 1 
end
end

