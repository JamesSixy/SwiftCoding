
/**
 128. Longest Consecutive Sequence
 Category: [<#Description#>]
 
 Question: Given an unsorted array of integers, find the length of the longest consecutive elements sequence.
 
 For example,
 Given [100, 4, 200, 1, 3, 2],
 The longest consecutive elements sequence is [1, 2, 3, 4]. Return its length: 4.
 
 Your algorithm should run in O(n) complexity.
 
 Link: https://leetcode.com/problems/longest-consecutive-sequence/?tab=Description
 Solution: <#Description#>
 Return: <#Description#>
 
 Idea: <#Description#>
 
 Time: <#Description#>, Space: <#Description#>
 
 */

func longestConsecutive(_ nums: [Int]) -> Int {
    guard nums.count > 0 else { return 0 }
    var set = Set(nums), m = 1
    for num in nums {
        var left = num - 1, right = num + 1, count = 1
        while set.contains(left) {
            count += 1
            set.remove(left)
            left -= 1
        }
        while set.contains(right) {
            count += 1
            set.remove(right)
            right += 1
        }
        m = max(m, count)
    }
    return m
}

func longestConsecutive2(_ nums: [Int]) -> Int {
    var set = Set(nums)
    var longest = 0
    
    for num in nums {
        if set.contains(num) {
            set.remove(num)
            longest = max(1 + findConsecutive(&set, num, 1) + findConsecutive(&set, num, -1), longest)
        }
    }
    
    return longest
}

private func findConsecutive(_ set: inout Set<Int>, _ num: Int, _ step: Int) -> Int {
    var len = 0
    var num = num + step
    
    while set.contains(num) {
        set.remove(num)
        len += 1
        num += step
    }
    
    return len
}
