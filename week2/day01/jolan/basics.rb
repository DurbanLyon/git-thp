def who_is_bigger(a, b, c)
    if a == nil || b == nil || c == nil
        return "nil detected"
    elsif a > b && a > c
        return "a is bigger"
    elsif b > a && b > c
        return "b is bigger"
    elsif c > a && c > b
        return "c is bigger"
    end
end

def reverse_upcase_noLTA(string)
    i = 0
    len = string.length
    while i <= len

        result = string.upcase.reverse.delete! 'LTA'
        i += 1
    end
    return result
end

def array_42(array)
    return array.include?(42)
end

def magic_array(array)
    tmp = []
    array.flatten.sort.uniq.each { |i| tmp << i * 2 if i % 3 != 0 }
    return tmp
end
