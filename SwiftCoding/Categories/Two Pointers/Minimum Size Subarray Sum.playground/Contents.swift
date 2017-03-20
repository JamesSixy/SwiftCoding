
/// 209. Minimum Size Subarray Sum
/// https://leetcode.com/problems/minimum-size-subarray-sum/?tab=Description
/// - Parameters:
///   - s: <#s description#>
///   - nums: <#nums description#>
/// - Returns: <#return value description#>
/// Two pointer -> Window

/**
 Given an array of n positive integers and a positive integer s, find the minimal length of a contiguous subarray of which the sum ≥ s. If there isn't one, return 0 instead.
 
 For example, given the array [2,3,1,2,4,3] and s = 7,
 the subarray [4,3] has the minimal length under the problem constraint.
 */

func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
    guard nums.count > 0 else { return 0 }
    var res = Int.max
    var j = 0, sum = 0
    for i in 0 ..< nums.count {
        while j < nums.count && sum < s {
            sum += nums[j]
            j += 1
        }
        if sum >= s {
            res = min(res, j - i)
        }
        sum -= nums[i]
    }
    if res == Int.max {
        return 0
    }
    return res
}