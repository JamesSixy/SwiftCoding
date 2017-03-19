
/**
 167. Two Sum II - Input array is sorted
 Category: [TP]
 
 Given an array of integers that is already sorted in ascending order, find two numbers such that they add up to a specific target number.
 
 The function twoSum should return indices of the two numbers such that they add up to the target, where index1 must be less than index2. Please note that your returned answers (both index1 and index2) are not zero-based.
 
 You may assume that each input would have exactly one solution and you may not use the same element twice.
 
 Input: numbers={2, 7, 11, 15}, target=9
 Output: index1=1, index2=2
 
 Link: https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/?tab=Description
 
 Time: O(n), Space: O(1)
 
 */

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    guard nums.count > 0 else { return [] }
    var start = 0, end = nums.count - 1
    while start < end {
        let front = nums[start], rear = nums[end]
        if front + rear == target {
            return [start + 1, end + 1] //0 base or 1 base
        } else if front + rear > target {
            end -= 1
        } else {
            start += 1
        }
    }
    return []
}
