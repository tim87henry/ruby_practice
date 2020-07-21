def merge_sort(list,first,last)
    if last-first==1
        return list
    end
    middle=((first+last)/2)
    len1=middle-first
    len2=last-middle
    a=merge_sort(list.slice(first,middle),0,list.slice(first,middle).length)
    b=merge_sort(list.slice(middle,last),0,list.slice(middle,last).length)
    return merge(a,b)
end

def merge(a,b)
    c=[]
    until a.empty? or b.empty?
        if a[0]<=b[0]
            c.push(a[0])
            a=a.slice(1,a.length-1)
        else 
            c.push(b[0])
            b=b.slice(1,b.length-1)
        end
    end
    until a.empty?
        c.push(a[0])
        a=a.slice(1,a.length-1)
    end    
    until b.empty?
        c.push(b[0])
        b=b.slice(1,b.length-1)
    end
    return c
end

puts "Please enter the number of elements : "
len=gets.chomp.to_i
list=[]
puts "Enter the elements : "
for i in 0..len-1
    list.push(gets.chomp.to_i)
end
puts "Sorted array is #{merge_sort(list,0,len)}"