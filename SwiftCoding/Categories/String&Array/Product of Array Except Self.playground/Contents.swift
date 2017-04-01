
import ZHDataStructure
import UIKit

/**
 238. Product of Array Except Self
 Category: [ARR]
 
 Question: Given an array of n integers where n > 1, nums, return an array output such that output[i] is equal to the product of all the elements of nums except nums[i].
 
 Solve it without division and in O(n).
 
 For example, given [1,2,3,4], return [24,12,8,6].
 
 Follow up:
 Could you solve it with constant space complexity? (Note: The output array does not count as extra space for the purpose of space complexity analysis.)
 
 Link: https://leetcode.com/problems/product-of-array-except-self/#/description
 
 Idea: Use two arrays to hold multiplication result from left and right sides while iterating the original array
        [1,1,2,6] [24,12,4,1]
        [1,2,3,4]
 
 Time: O(n), Space: O(n)
 
 */

func productExceptSelf(nums: [Int]) -> [Int] {
    var res = [Int]()
    guard nums.count > 0 else { return res }
    let left = getLeft(nums)
    let right = getRight(nums)
    for i in 0 ..< nums.count {
        res.append(left[i] * right[i])
    }
    return res
}

private func getLeft(_ nums: [Int]) -> [Int] {
    var left = [Int]()
    left.append(1)
    for i in 1 ..< nums.count {
        left.append(left[i - 1] * nums[i - 1])
    }
    return left
}

private func getRight(_ nums: [Int]) -> [Int] {
    var right = Array(repeating: 1, count: nums.count)
    
    for i in stride(from: nums.count - 2, through: 0, by: -1){
        right[i] = right[i + 1] * nums[i + 1]
    }
    
    return right
}

/**
 TestCases: <#Description#>
 */
let testCases = [
    <#Description#>
]

for <#Description#> in testCases {
    print(<#Description#>)
}






