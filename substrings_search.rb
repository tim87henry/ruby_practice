def substring(dictionary,search_string)
    result= Hash.new
    dictionary.each do |dict|
        count=0
        search_string.split.each do |str|
            count+=1 if str.downcase.include?(dict.downcase)
        end
        result[dict]=count if count > 0
    end
    return result
end

puts "Enter the text content : "
dictionary=gets.chomp.split
puts "Enter the search string : "
search_string=gets.chomp
puts substring(dictionary,search_string)