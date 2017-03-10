
/// 53. Maximum Subarray
/// https://leetcode.com/problems/maximum-subarray/?tab=Description
/// - Parameter nums: <#nums description#>
/// - Returns: <#return value description#>

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