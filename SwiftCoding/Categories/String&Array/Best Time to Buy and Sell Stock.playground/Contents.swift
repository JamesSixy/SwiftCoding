
/// 121. Best Time to Buy and Sell Stock
/// https://leetcode.com/problems/best-time-to-buy-and-sell-stock/?tab=Description
/// - Parameter prices: <#prices description#>
/// - Returns: <#return value description#>
/// enumerate but not DP, DP is like a 2^n, but this one is O(n^2) wrost

func maxProfit(_ prices: [Int]) -> Int {
    guard prices.count > 0 else { return 0 }
    var best = Int.min, minPrice = prices[0]
    for sellPoint in stride(from: 1, to: prices.count, by: 1) {
        best = max(best, prices[sellPoint] - minPrice)
        minPrice = min(minPrice, prices[sellPoint])
    }
    return best
}
