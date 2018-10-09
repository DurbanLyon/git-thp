goo = [15, 8, 3, 17, 8, 10, 17]
mmm = [14, 20, 8, 3, 18, 12, 14]
adbe = [12, 3, 15, 6, 4, 8, 2]
ea = [13, 10, 5, 9, 6, 3, 17]
ba = [8, 5, 10, 15, 15, 18, 7]
ko = [10, 19, 5, 6, 18, 20, 13]
xom = [20, 12, 15, 8, 3, 5, 1]
gps = [7, 6, 13, 1, 12, 11, 15]
mcd = [11, 15, 10, 10, 19, 3, 15]
dis = [15, 9, 18, 15, 3, 9, 10]
crm = [6, 10, 5, 18, 7, 8, 9]
jnj = [10, 17, 14, 3, 9, 15, 17]

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

def trade(array)
    i = 0
    j = 0
    gain = 0
    len = array.length - 1
  
    while i <= len
        j = i + 1
        while j <= len
            tmp = array[j] - array[i]
            if tmp > gain
                gain = tmp
                buy = i
                sell = j
            end
            j += 1
        end
        i += 1
    end
    return "[BEST-MOVE]:[#{buy}, #{sell}] | [BUY-ON-DAY=>#{buy+1}]:[#{array[buy]}€] [SELL-ON-DAY=>#{sell+1}]:[#{array[sell]}€] [GAIN]:[#{gain}€]"
end

key = [:GOO, :MMM, :ADBE, :EA, :BA, :KO, :XOM, :GPS, :MCD, :DIS, :CRM, :JNJ]
value = [goo, mmm, adbe, ea, ba, ko, xom, gps, mcd, dis, crm, jnj]

hash = create_hash(key, value)
array = get_value(hash)

i = 0
len = array.length - 1
while i <= len
    puts trade(array[i])
    i+=1
end