@node_key = ["WELSH", "FRIES", "BEERS"]
@main_key = ["Lipids", "Carbohydrate", "Protein"]

@welsh_value = ["38.4", "18.3", "36.3"]
@fries_value = ["15", "41", "3.4"]
@beers_value = ["0", "25", "4"]

@calorie_value = ["9", "4", "4"]

def manage_value(value, id)
    if id == "float"
        new_value = value.map { | value | value.to_f }
    elsif id == "int"
        new_value = value.map { | value | value.to_i }
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

def weight_watchers(main_hash, value_hash)
    hash = to_array(main_hash)
    calorie = to_array(value_hash)

    i = 0
    tmp = [hash, calorie]
    len = tmp.length
    while i <= len
        result = (0..i).map { | elem | hash[elem] * calorie[elem] }
        result = result.sum
        i += 1
    end
    return result
end

def meal_weight_watchers(main_hash, value_hash, id)
    menu = to_array(main_hash)
    
    if id == "Welsh"
        tmp = weight_watchers(menu[0], value_hash)
        result = "\nTotal Calorie for #{id}: #{tmp}"
    elsif id == "Fries"
        tmp = weight_watchers(menu[1], value_hash)
        result = "\nTotal Calorie for #{id}: #{tmp}"
    elsif id == "Beers"
        tmp = weight_watchers(menu[2], value_hash)
        result = "\nTotal Calorie for #{id}: #{tmp}"
    end
    return result
end

def launcher()
    int_calorie = manage_value(@calorie_value, "int")
    float_welsh = manage_value(@welsh_value, "float")
    float_fries = manage_value(@fries_value, "float")
    float_beers = manage_value(@beers_value, "float")

    h_welsh = create_hash(@main_key, float_welsh)
    h_fries = create_hash(@main_key, float_fries)
    h_beers = create_hash(@main_key, float_beers)
    h_calorie = create_hash(@main_key, int_calorie)

    node_value = [h_welsh, h_beers, h_fries]
    node_menu = create_hash(@node_key, node_value)

    puts "Please choose a Product to know is total of Calorie"
    puts "     actual product:"
    puts "         - Welsh"
    puts "         - Fries"
    puts "         - Beers"
    print "> "
    id = gets.chomp

    result = meal_weight_watchers(node_menu, h_calorie, id)
    puts result
end

launcher()