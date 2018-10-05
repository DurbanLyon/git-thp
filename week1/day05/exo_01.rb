require 'matrix'

@main_key = ["Lipids", "Carbohydrate", "Protein"]
@welsh_value = ["38.4", "18.3", "36.3"]
@calorie_value = ["9", "4", "4"]

def manage_value(value, id)
    if id == "float"
        new_value = value.map { | value | value.to_f }
    elsif id == "int"
        new_value = value.map { | value | value.to_i }
    elsif id == "string"
        new_value = value.map { | value | value.to_s }
    end
end

def create_hash(key, value)
    new_hash = Hash[key.zip value]
    return new_hash
end

def to_array(hash)
    for value in hash
        i = 0
        val = hash.values
        len = val.length
        while i <= len
            $val = val[0..i]
            tmp = $val
            i += 1
        end
        return tmp
    end
end

def weight_watchers(a_hash, b_hash)
    welsh = to_array(a_hash)
    calorie = to_array(b_hash)

    i = 0
    tmp = [welsh, calorie]
    len = tmp.length
    while i <= len
        result = (0..i).map { | elem | welsh[elem] * calorie[elem] }
        result = result.sum
        i += 1
    end
    return result
end

def launcher()
    int_calorie = manage_value(@calorie_value, "int")
    float_welsh = manage_value(@welsh_value, "float")
    h_welsh = create_hash(@main_key, float_welsh)
    h_calorie = create_hash(@main_key, int_calorie)

    result = weight_watchers(h_welsh, h_calorie)
    print result
end

launcher()