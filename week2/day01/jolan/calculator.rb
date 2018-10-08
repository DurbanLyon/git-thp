def add(a_nb, b_nb)
    result = a_nb + b_nb
    return result
end

def subtract(a_nb, b_nb)
    result = a_nb - b_nb
    return result
end

def sum(array)
    i = 0
    len = array.length
    while i <= len
        result = array.sum
        i += 1
    end
    return result
end

def multiply(a_nb, b_nb)
    result = a_nb * b_nb
    return result
end

def power(nb, pow)
    result = nb
    if pow < 0
        result = 0
		return result
    elsif pow == 0
        result = 1
		return result
    elsif pow == 1
		return result
    else
        pow = pow - 1
        return result * power(nb, pow)
    end
end

def factorial(nb)
    i = 1
    result = 1
    if nb < 0
        result = 0
        return result
    end
    while i <= nb
        result = result * i
        i += 1
    end
    return result
end