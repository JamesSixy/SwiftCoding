
import ZHDataStructure
import UIKit

/**
 122. Best Time to Buy and Sell Stock II
 Category: [DP]
 
 Question: Say you have an array for which the ith element is the price of a given stock on day i.
 
 Design an algorithm to find the maximum profit. You may complete as many transactions as you like (ie, buy one and sell one share of the stock multiple times). However, you may not engage in multiple transactions at the same time (ie, you must sell the stock before you buy again).
 
 Link: https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/
 
 Idea:  Add all substractions if sell stock could earn money
 
 Time: O(n), Space: O(1)
 
 */

func maxProfit(_ prices: [Int]) -> Int {
    var max = 0
    guard prices.count > 1 else { return max }
    for i in 1 ..< prices.count where prices[i] > prices[i - 1] {
        max += prices[i] - prices[i - 1]
    }
    return max
}

func maxProfitWithFee(_ prices: [Int], _ fee: Int) -> Int {
    var max = 0
    guard prices.count > 1 else { return max }
    for i in 1 ..< prices.count where prices[i] - prices[i - 1] - 2 * fee > 0  {
        max += prices[i] - prices[i - 1] - 2 * fee
    }
    return max
}

/**
 TestCases: <#Description#>
 */
let testCases = [
    [3,5,1,8,7,5,5,7],//2 + 7 + 2
    [1,4],
    [2,1,4],
    [1,7,2]
]

for arr in testCases {
//    print(maxProfit(arr))
    print(maxProfitWithFee(arr, 2))
}






