
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

let testCases = [
    [-2, 1, -3, 4, -1, 2, 1, -5, 4]
]

for arr in testCases {
    print(maxSubArray(arr))
}

/**
 
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