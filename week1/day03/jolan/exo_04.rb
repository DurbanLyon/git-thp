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