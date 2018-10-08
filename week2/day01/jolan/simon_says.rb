def echo(string)
    return string
end

def shout(string)
    return string.upcase
end

def repeat(string, value=2)
    return string + (' ' + string) * (value - 1)
end

def start_of_word(string, value)
    i = 0
    while i <= value
        res = string[0..i - 1]
        i += 1
    end
    return res
end

def first_word(string)
    return string.partition(" ").first
end

def titleize(string)
    stop_words = %w{the and}
    string.split(' ').map.with_index do |word, index|
        unless stop_words.include?(word) == true && index > 0
            word.capitalize
        else
            word
        end
    end
    .join(' ')
end

