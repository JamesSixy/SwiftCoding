
/**
 16. 3Sum Closest
 Category: [TP]
 
 Given an array S of n integers, find three integers in S such that the sum is closest to a given number, target. Return the sum of the three integers. You may assume that each input would have exactly one solution.
 For example, given array S = {-1 2 1 -4}, and target = 1.
 The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).
 
 Link: https://leetcode.com/problems/3sum-closest/?tab=Description
 
 Time: O(nlogn) + O(n^2) = O(n^2), Space: O(1)
 
 Idea: Similar to two sum closest but it returns the sum that is closest, not the difference. So we need to compare the diff first and update the result sum.
 
 */

func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
    guard nums.count > 2 else { return -1 }
    var res = nums[0] + nums[1] + nums[2]
    let nums = nums.sorted()
    for i in 0 ..< nums.count - 2 {
        var start = i + 1, end = nums.count - 1
        while start < end {
            let sum = nums[i] + nums[start] + nums[end]
            res = abs(target - sum) < abs(target - res) ? sum : res
            if sum > target {
                end -= 1
            } else {
                start += 1
            }
        }
    }
    return res
}
