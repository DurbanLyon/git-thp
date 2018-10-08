def ftoc(fahrenheit)
    tmp = fahrenheit - 32
    celcius = (tmp) * 5 / 9
    return celcius
end

def ctof(celcius)
    tmp = celcius.to_f
    tmp = tmp * 9 / 5
    fahrenheit = (tmp) + 32
    return fahrenheit
end