
import ZHDataStructure
import UIKit

/**
 309. Best Time to Buy and Sell Stock with Cooldown
 Category: [DP]
 
 Question: Say you have an array for which the ith element is the price of a given stock on day i.
 
 Design an algorithm to find the maximum profit. You may complete as many transactions as you like (ie, buy one and sell one share of the stock multiple times) with the following restrictions:
 
 You may not engage in multiple transactions at the same time (ie, you must sell the stock before you buy again).
 After you sell your stock, you cannot buy stock on next day. (ie, cooldown 1 day)
 
 Example:
 
 prices = [1, 2, 3, 0, 2]
 maxProfit = 3
 transactions = [buy, sell, cooldown, buy, sell]
 
 Link: https://leetcode.com/problems/best-time-to-buy-and-sell-stock-with-cooldown/#/description

 
 Idea: Dynamic programming, dp array means the max value sold at today
 
 Time: O(n^2), Space: O(n)
 
 */

func maxProfit(_ prices: [Int]) -> Int {
    guard prices.count > 1 else { return 0 }
    var res = 0
    var dp = Array(repeating: 0, count: prices.count)
    
    for i in 1 ..< prices.count {
        for j in (0 ..< i).reversed() {
            if j >= 2 {
                dp[i] = max(dp[i], prices[i] - prices[j] + dp[j - 2])
            } else {
                dp[i] = max(dp[i], prices[i] - prices[j])
            }
        }
        dp[i] = max(dp[i], dp[i - 1])
        res = max(res, dp[i])
    }
    return res
}


/**
 TestCases: <#Description#>
 */
let testCases = [
    <#Description#>
]

for <#Description#> in testCases {
    print(<#Description#>)
}






