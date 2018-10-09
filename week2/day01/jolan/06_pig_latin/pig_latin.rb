def translate(string)
    array = ["a", "e", "i", "o", "y"]
    converted_words = string.split.map do | word |
        i = 0
        word.each_char do | char |
            if array.include?(char)
                break
            end
            i += 1
        end
        word[ i, word.size ] + word[ 0, i ] + "ay"
    end
    converted_words.join(" ")
end