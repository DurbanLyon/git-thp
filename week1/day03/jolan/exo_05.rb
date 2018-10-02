def pyramide(value, rule)
    i = 1
    while i <= $value
        j = $value - i
        if rule == 0
            y = "#" * i
            x = " " * j + "#" * i
        elsif rule == 1
            y = "#" * (i - 1)
            x = " " * j + "#" * i
        end
        puts "#{x}#{y}"
        i += 1
    end
end

def error(value, rule)
    if $value < 0 || $value > 25
        return true
    elsif $rule < 0 || $rule > 1
        return true
    end
    return false
end

puts "Please type an Integer Value"
print "> "
value = gets.chomp
$value = value.to_i
puts "Your value is #{$value}"
puts "Please choose Odd (1) or Even (0)"
print "> "
rule = gets.chomp
$rule = rule.to_i
puts "Your value is #{$rule}"

error = error($value, $rule)

if error == true
    puts "Error"
else
    pyramide($value, $rule)
end