
/**
 Convert Binary Tree to Linked Lists by Depth
 Category: [PrefixSum]
 
 Say you have an array for which the ith element is the price of a given stock on day i.
 If you were only permitted to complete at most one transaction (ie, buy one and sell one share of the stock), design an algorithm to find the maximum profit.
 
 Example 1:
 Input: [7, 1, 5, 3, 6, 4]
 Output: 5
 max. difference = 6-1 = 5 (not 7-1 = 6, as selling price needs to be larger than buying price)
 
 Link: https://leetcode.com/problems/best-time-to-buy-and-sell-stock/?tab=Description
 
 Enumerate but not DP, DP is like a 2^n, but this one is O(n^2) wrost
 
 Time: O(n), Space: O(1)
 
 Similar to Subarray Sum

 每轮用当前sellPoint减去minPrice(出现过的最小的sellPoint),就是prefixSum的思想
 只不过我们让前面那个前缀和尽可能小，那么两个前缀和相减则最大
 
 [7, 1, 5, 3, 6, 4]
 best = 0, minPrice = 7
 best = max(0, 1 - 7) -> 0
 minPrice = min(7, 1) -> 1
 
 best = max(0, 5 - 1) = 4
 minPrice = min(1, 5) = 1
 
 
 */
func maxProfit(_ prices: [Int]) -> Int {
    guard prices.count > 0 else { return 0 }
    var best = 0, minPrice = prices[0]
    for sellPoint in 1 ..< prices.count {
        best = max(best, prices[sellPoint] - minPrice)
        minPrice = min(minPrice, prices[sellPoint])
    }
    return best
}

func maxProfit2(_ prices: [Int]) -> Int {
    guard prices.count > 0 else { return 0 }
    var best = Int.min, minPrice = 0, sum = 0
    for sellPoint in stride(from: 1, to: prices.count, by: 1) {
        let diff = prices[sellPoint] - prices[sellPoint - 1]
        sum += diff
        best = max(best, sum - minPrice)
        minPrice = min(minPrice, sum)
    }
    return best
}

//Solution 2
func maxProfitConvertFromMaxSub(_ prices: [Int]) -> Int {
    guard prices.count > 0 else { return 0 }
    var nums = [0]
    for i in stride(from: 1, to: prices.count, by: 1) {
        nums.append(prices[i] - prices[i - 1])
    }
    return maxSubArray(nums)
}

func maxSubArray(_ nums: [Int]) -> Int {
    guard nums.count > 0 else { return 0 }
    var res = Int.min, sum = 0, minSum = 0
    for num in nums {
        sum += num
        res = max(res, sum - minSum)
        minSum = min(minSum, sum)
    }
    return res
}

/**
    [7, 1, 5, 3, 6, 4]
   0  -6  4 -2  3 -2
 */

let testCases = [
    [7, 1, 5, 3, 6, 4]
]
for arr in testCases {
    print(maxProfit(arr))
}
