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
  
dictionnary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
  
print found_data("Howdy partner, sit down! How's it going?", dictionnary)