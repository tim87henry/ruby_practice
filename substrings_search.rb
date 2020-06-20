def substring(dictionary,search_string)
    result= Hash.new
    search_string.split.each do |str|
        result[str]=dictionary.count(str)
    end
    return result
end

puts "Enter the text content : "
dictionary=gets.chomp.split
puts "Enter the search string : "
search_string=gets.chomp
puts substring(dictionary,search_string)