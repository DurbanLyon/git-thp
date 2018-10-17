def found_data(string, dictionnary)
    result = Hash.new
    
    string.downcase.scan(/\w+/) do | word |
        dictionnary.each do | elem |
            if result.include?(elem)
                result[elem] += 1
            else 
                result[elem] = 1
            end if word.include?(elem)
        end
    end
    return result.sort.to_h
end

def get_file_as_string(filename)
    data = ''
    f = File.open(filename, "r") 
    f.each_line do |line|
        data += line
    end
    return data
end

shakespeare = get_file_as_string 'shakespeare.txt'
dictionnary_insult_array = ["anal", "anus", "arse", "ass", "ballsack", "balls", "bastard", "bitch", "biatch", "bloody", "blowjob", "blow job", "bollock", "bollok", "boner", "boob", "bugger", "bum", "butt", "buttplug", "clitoris", "cock", "coon", "crap", "cunt", "damn", "dick", "dildo", "dyke", "fag", "feck", "fellate", "fellatio", "felching", "fuck", "f u c k", "fudgepacker", "fudge packer", "flange", "Goddamn", "God damn", "hell", "homo", "jerk", "jizz", "knobend", "knob end", "labia", "lmao", "lmfao", "muff", "nigger", "nigga", "omg", "penis", "piss", "poop", "prick", "pube", "pussy", "queer", "scrotum", "sex", "shit", "s hit", "sh1t", "slut", "smegma", "spunk", "tit", "tosser", "turd", "twat", "vagina", "wank", "whore", "wtf"]
dictionnary_array = ["the", "of", "and", "to", "a", "in", "for", "is", "on", "that", "by", "this", "with", "i", "you", "it", "not", "or", "be", "are"]

#puts found_data(shakespeare, dictionnary_array)
puts found_data(shakespeare, dictionnary_insult_array)