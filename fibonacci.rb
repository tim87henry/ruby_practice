def fibs(num)
    puts "Fibonacci series up to #{num} : "
    fib_series=[0,1]
    for i in 2 .. num
        fib_series[i] = fib_series[i-2] + fib_series[i-1]
    end
    print fib_series
    puts "\n"
end

def fibs_rec(num)
    if num < 2
        return num
    else
        return fibs_rec(num-1)+fibs_rec(num-2)
    end
end


fibs(10)
puts fibs_rec(10)