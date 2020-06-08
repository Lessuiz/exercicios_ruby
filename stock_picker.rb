def stock_picker(prices)
  profit = 0
  best_buy = 0
  best_sell = 0
  prices.each_with_index do |buy_value, buy_day|
    prices[buy_day...prices.length].each_with_index do |sell_value, sell_day|
      if sell_value - buy_value > profit
        profit = sell_value - buy_value
        best_buy = buy_day
        best_sell = sell_day + buy_day
      end
    end
  end
  [best_buy, best_sell]
end

p stock_picker([17,3,6,9,15,8,6,1,10])
