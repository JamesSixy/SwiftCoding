
/// 121. Best Time to Buy and Sell Stock
/// https://leetcode.com/problems/best-time-to-buy-and-sell-stock/?tab=Description
/// - Parameter prices: <#prices description#>
/// - Returns: <#return value description#>
/// enumerate but not DP, DP is like a 2^n, but this one is O(n^2) wrost

func maxProfit(_ prices: [Int]) -> Int {
    guard prices.count > 0 else { return 0 }
    var best = 0, minPrice = prices[0]
    for sellPoint in stride(from: 1, to: prices.count, by: 1) {
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
