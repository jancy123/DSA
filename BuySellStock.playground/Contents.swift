/*
 
 https://leetcode.com/problems/best-time-to-buy-and-sell-stock/description/
 
 buying_price = prices[0]
         curr_profit = max_profit = 0
         for i in range(1, len(prices)):
             if prices[i] < buying_price:
                 buying_price =  prices[i]
             curr_profit = prices[i]-buying_price
             max_profit = max(max_profit, curr_profit)
         return max_profit
 
 
 You are given an array prices where prices[i] is the price of a given stock on the ith day.

 You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.

 Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.

  

 Example 1:

 Input: prices = [7,1,5,3,6,4]
 Output: 5
 Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
 Note that buying on day 2 and selling on day 1 is not allowed because you must buy before you sell.
 Example 2:

 Input: prices = [7,6,4,3,1]
 Output: 0
 Explanation: In this case, no transactions are done and the max profit = 0.

 
 */



func maxProfit(input: [Int]) -> Int {
    // add guard
    guard !input.isEmpty else { return 0 }
    var currentProfit = 0
    var maxProfit = 0
    var buyingPrice: Int = input[0]
    for i in 1..<input.count {
        let price = input[i]
        buyingPrice = min(buyingPrice, price)
        currentProfit = price - buyingPrice
        maxProfit = max(maxProfit, currentProfit)
    }
    return maxProfit
}
maxProfit(input: [7,1,5,3,6,4])

/*
 Say something like:
 “I iterate once, tracking the minimum price seen so far. At each step, I compute the profit if I sold today and update the maximum profit. This gives O(n) time and O(1) space.”
 */


