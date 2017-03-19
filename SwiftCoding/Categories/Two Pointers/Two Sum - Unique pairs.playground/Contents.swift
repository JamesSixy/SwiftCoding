
/**
 Two Sum - Unique pairs
 Category: [TP]
 
 Given an array of integers, find how many unique pairs in the array such that their sum is equal to a specific target number. Please return the number of pairs.
 
 Link: http://www.lintcode.com/en/problem/two-sum-unique-pairs/
 
 Time: O(nlong), Space: O(1)
 
 Idea: Numbers may duplicate. Sort first and whenever find a match, do two whiles one find left end and one and right start so that it skips duplicated pairs
 
 */

func twoSum6(_ nums: [Int], _ target: Int) -> Int {
    guard nums.count > 0 else { return 0 }
    var nums = nums.sorted(), count = 0
    var start = 0, end = nums.count - 1
    while start < end {
        let front = nums[start], rear = nums[end]
        if front + rear == target {
            count += 1
            while start < end && nums[start] == front {
                start += 1
            }
            while start < end && nums[end] == rear {
                end -= 1
            }
        } else if front + end > target {
            end -= 1
        } else {
            start += 1
        }
    }
    return count
}
