def caesar_cipher(secret_str,num_shift)
    num_shift=num_shift%26
    encrypted_str ="" 
    secret_str.each_byte do |c|
        ascii = c
        if (c >= 65 && c<=90) || (c >=97 && c <= 122)
            if c <= 90
                ascii_start = 65
                ascii_end = 90
            else
                ascii_start = 97
                ascii_end = 122
            end
            ascii_end+=1 if (c+num_shift.to_i==90 || c+num_shift.to_i==122)
            ascii = (c+num_shift.to_i) % ascii_end
            ascii = ascii + ascii_start - 1 if ascii < ascii_start
        end
        encrypted_str += ascii.chr
    end
    return encrypted_str
end

puts "Enter the string to be encrypted : "
secret_str=gets.chomp
puts "Enter the required shift factor : "
num_shift=gets.chomp
puts caesar_cipher(secret_str,num_shift)