@node_key = [ "WELSH", "FRIES", "BEERS" ]
@main_key = [ "Lipids", "Carbohydrate", "Protein" ]

@price_key = [ "PRICE" ]
@transit_node_key = [ "WELSH", "FRIES", "BEERS", "PRICE" ]

@welsh_value = [ 38.4, 18.3, 36.3 ]
@fries_value = [ 15, 41, 3.4 ]
@beers_value = [ 0, 25, 4 ]

@price_value = [ 15, 4, 5 ]
@calorie_value = [ 9, 4, 4 ]

def create_hash(key, value)
    new_hash = Hash[key.zip value]
    return new_hash
end

def get_value(hash)
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

def weight_watchers(node, value_hash)
    hash = get_value(node)
    calorie = get_value(value_hash)

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

def meal_weight_watchers(node, value_hash, id)
    menu = get_value(node)
    
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

def meal_price(node)
    from_node = get_value(node)
    to_node = get_value(from_node[3])
    value = get_value(to_node[0])

    i = 0
    len = value.length
    while i <= len
        result = value.sum
        i += 1
    end
    return result
end

def clean_hash(rule)
    @h_price = create_hash(@node_key, @price_value)
    @h_calorie = create_hash(@main_key, @calorie_value)
    
    @h_welsh = create_hash(@main_key, @welsh_value)
    @h_fries = create_hash(@main_key, @fries_value)
    @h_beers = create_hash(@main_key, @beers_value)
    
    node_value = [@h_welsh, @h_beers, @h_fries]
    
    transit_value_price = [@h_price]
    transit_node_price = create_hash(@price_key, transit_value_price)
    transit_node_value = [@h_welsh, @h_beers, @h_fries, transit_node_price]
    
    if rule == 0
        node_hash = create_hash(@node_key, node_value)
        return node_hash
    elsif rule == 1
        transit_node_hash = create_hash(@transit_node_key, transit_node_value)
        return transit_node_hash
    end
end

def launcher()
    puts "This program allow you too see the sum of calorie for product"
    puts "You also can know the total price of products"
    puts "\nPlease type (0) for Calorie or (1) for Price to run the program"
    print "> "
    id = gets.chomp.to_i
    
    if id == 0
        rule = 0
        node = clean_hash(rule)
        puts "\nPlease choose a Product to know is total of Calorie"
        puts "     actual product:"
        puts "         - Welsh"
        puts "         - Fries"
        puts "         - Beers"
        print "> "
        id = gets.chomp
        
        result = meal_weight_watchers(node, @h_calorie, id)
        puts result
    elsif id == 1
        rule = 1
        node = clean_hash(rule)
        result = meal_price(node)
        puts "\nTotal Price is: #{result}"
    end
end

launcher()