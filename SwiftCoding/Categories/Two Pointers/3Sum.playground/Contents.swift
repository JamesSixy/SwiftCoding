
/**
 15. 3Sum
 Category: [TP]
 
 Given an array S of n integers, are there elements a, b, c in S such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.
 Note: The solution set must not contain duplicate triplets.
 
 Link: https://leetcode.com/problems/3sum/?tab=Description
 
 Time: O(nlogn) + O(n^2) = O(n^2), Space: O(n)
 
 Idea: Contains duplicates. Sort first and do a loop with uniquePairs within. Outer loop should also take care of duplicates
 
 */

func threeSum(_ nums: [Int]) -> [[Int]] {
    var res: [[Int]] = []
    guard nums.count > 2 else { return res }
    let nums = nums.sorted()
    for i in 0 ..< nums.count - 2 {
        if i != 0 && nums[i] == nums[i - 1] {
            continue
        }
        uniquePairs(&res, nums, i)
    }
    return res
}

private func uniquePairs(_ res: inout [[Int]],
                         _ nums: [Int],
                         _ index: Int) {
    let target = nums[index]
    var start = index + 1, end = nums.count - 1
    while start < end {
        let front = nums[start], rear = nums[end]
        let sum = target + front + rear
        if sum == 0 {
            res.append([target, front, rear])
            while start < end && nums[start] == front {
                start += 1
            }
            while start < end && nums[end] == rear {
                end -= 1
            }
        } else if sum > 0 {
            end -= 1
        } else {
            start += 1
        }
    }
}
