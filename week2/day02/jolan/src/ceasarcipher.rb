def ceasar_cipher(string, amplitude)
    ciphered_string = ""
    string_to_array = string.split('')
    alphabet = Array('a'..'z')

    string_to_array.each do | char |
        ciphered_string << char unless alphabet.include?(char.downcase)
        alphabet.each do | letter |
            if char.downcase == letter
                i = alphabet.index(letter) + amplitude
                i %= 26 if i >= 26
                ciphered_string << (char == char.upcase ? alphabet[i].upcase : alphabet[i])
            end
        end
    end
    return ciphered_string
end