def multiples(a_nb, b_nb)
    tmp_array = Array(0..999)
    result = Array.new
    for i in tmp_array
        result.push(i) if i % a_nb == 0 || i % b_nb == 0
    end
    return result.sum
end