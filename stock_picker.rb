def stock_picker(stock_prices)
    buy=0
    sell=0
    max_diff=0
    for i in 1..stock_prices.length-1
        for j in 0..i-1
            if stock_prices[i] - stock_prices[j] > max_diff
                buy = j
                sell = i
                max_diff = stock_prices[i] - stock_prices[j]
            end
        end
    end
    return [buy,sell]
end

stock_prices=[]
puts "Enter the number of days you traded : "
num_days=gets.chomp.to_i
puts "Enter the stock prices for each day : "
for i in 0..num_days-1
    stock_prices[i]=gets.chomp.to_i
end
print "\n"
result=stock_picker(stock_prices)
max_diff = stock_prices[result[1].to_i]-stock_prices[result[0].to_i]
print result
if max_diff == 0
    report="not do anything"
else
    report="buy on day "+(result[0]+1).to_s+" and sell on day "+(result[1]+1).to_s+", for a profit of $"+max_diff.to_s
end
print "\n"
print "The best thing to do, would be to "+report
print "\n"