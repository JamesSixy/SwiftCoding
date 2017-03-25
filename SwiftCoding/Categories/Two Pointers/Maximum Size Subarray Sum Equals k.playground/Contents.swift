
/**
 325. Maximum Size Subarray Sum Equals k
 Category: [<#Description#>]
 
 Question: Given an array nums and a target value k, find the maximum length of a subarray that sums to k. If there isn't one, return 0 instead.
 
 Link: https://leetcode.com/problems/maximum-size-subarray-sum-equals-k/?tab=Description
 
 Idea:  Use a dictionary to track the sum so far since the first until the current
 
 Time: O(n), Space: O(n)
 
 */

/**
 [1, -1, 5, -2, 3], k = 3
 
 
 sum = 1, dict[1 - 3 = -2] = nil, dict[1] = 0
 sum = 0, dict[0 - 3 = -3] = nil, skip
 sum = 5, dict[5 - 3 = 2]  = nil, dict[5] = 2
 sum = 3, dict[3 - 3 = 0]  = -1, i - idx = 3 + 1 = 4, dict[3] = 3
 sum = 6, dict[6 - 3 = 3]  = nil, dict[6] = 4
 
 */

func maxSubArrayLen(_ nums: [Int], _ k: Int) -> Int {
    var longestLen = 0, sum = 0
    var sumToIdx = [Int: Int]()
    sumToIdx[0] = -1
    
    for (i, num) in nums.enumerated() {
        sum += num
        
        if let idx = sumToIdx[sum - k] {
            longestLen = max(longestLen, i - idx)
        }
        
        guard sumToIdx[sum] != nil else {
            sumToIdx[sum] = i
            continue
        }
    }
    return longestLen
}