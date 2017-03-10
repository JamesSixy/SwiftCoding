
/// 53. Maximum Subarray
/// https://leetcode.com/problems/maximum-subarray/?tab=Description
/// - Parameter nums: <#nums description#>
/// - Returns: <#return value description#>
/*
 Difference between Maximum Subarray & Subarray sum?
 Both use prefix sum but for different purpose.
 Maximum Subarray uses it to get the max subarray sum in each loop
 Subarray sum wants to find a subarray that sums up to 0, 
 so it stores prefix sum in each loop in a map, then if we find existing prefix sum
 it means ps[i] - ps[j] = 0, so nums[j+1 ... i] will be the subarray that sums up to 0
 
 */

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

let testCases = [
    [-2, 1, -3, 4, -1, 2, 1, -5, 4]
]

for arr in testCases {
    print(maxSubArray(arr))
}

/**
 for i in the loop, we sum up from nums[0 ... i]
 and then we calculate sum - minSum, which means
 we get a possible largest subarray sum from substraction of two prefixSums
 res defaults to Int.min and minSum defaults to 0
 and then get max between sub - minSum and res,
 get min between minSum and sum
 
  0 [-2, 1, -3, 4, -1, 2, 1, -5, 4]
               [4, -1, 2, 1] = 6
 
 sum = -2, sum - minSum = -2, res = -2, minSum = -2
 sum = -1, sum - minSum = 1, res = 1, minSum = -2
 sum = -4, sum - minSum = -2, res = 1, minSum = -4
 sum = 0,  sum - minSum = 4, res = 4, minSum = -4
 sum = -1, sum - minSum = 3, res = 4, minSum = -4
 sum = 1,  sum - minSum = 5, res = 5, minSum = -4
 sum = 2,  sum - minSum = 6, res = 6, minSum = -4
 sum = -3, sum - minSum = 1, res = 6, minSum = -4
 sum = 1,  sum - minSum = 5, res = 6, minSum = -4
 
 
 */
