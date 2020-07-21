def fibs(num)
    puts "Fibonacci series up to #{num} : "
    fib_series=[0,1]
    for i in 2 .. num
        fib_series[i] = fib_series[i-2] + fib_series[i-1]
    end
    return fib_series
end

def fibs_rec(num)
    if num < 2
        return [0,1]
    else
        return  fibs_rec(num-1).append(fibs_rec(num-1)[-2] + fibs_rec(num-1)[-1])
    end
end

pp fibs(10)
pp fibs_rec(10)