def bubble_sort(list)
    num_length=list.length
    for i in 1..num_length-1
        for j in 0..num_length-2
            if list[j]>list[j+1]
                temp=list[j]
                list[j]=list[j+1]
                list[j+1]=temp
            end
        end
    end
    return list
end

puts "Enter the number of elements : "
num_length=gets.chomp.to_i
puts "Enter the elements : "
list=[]
for i in 0..num_length-1
    list[i]=gets.chomp.to_i
end

pp bubble_sort(list)