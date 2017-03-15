
import ZHDataStructure
import UIKit

/**
 31. Next Permutation
 Category: [<#Description#>]
 
 Question: <#Description#>
 
 Link: https://leetcode.com/problems/next-permutation/#/description
 Solution: https://segmentfault.com/a/1190000008331355
 Return: <#Description#>
 
 Idea: 1 2 3 -> first, from right to left, find the first i where nums[i - 1] < nums[i]. Then, from right to left again, swap i - 1 & j if nums[j] > nums[i - 1]
 
 2,5,4,3 -> find 2, its index is i - 1 where nums[i - 1] < nums[i]
 2,5,4,3 -> find 3, its index is j where nums[j] > nums[i - 1]
 swap 2 and 3 -> 3,5,4,2
 reverse 5,4,2 since it's descending -> 3,2,4,5
 Solution: <#Description#>
 Return: <#Description#>
 
 Idea: <#Description#>
 
 Time: <#Description#>, Space: <#Description#>
 
 */

func nextPermutation(_ nums: inout [Int]) {
    guard nums.count > 0 else { return }
    var i = nums.count - 1, end = i
    while i > 0 {
        if nums[i - 1] < nums[i] { break }
        i -= 1
    }
    if i != 0 {
        var j = nums.count - 1
        while j > 0 {
            if nums[j] > nums[i - 1] { break }
            j -= 1
        }
        swap(&nums, i - 1, j)
    }
    
    reverse(&nums, i, end)
}

private func swap<T>(_ nums: inout [T], _ i: Int, _ j: Int) {
    (nums[i], nums[j]) = (nums[j], nums[i])
}

private func reverse<T>(_ nums: inout [T], _ i: Int, _ j: Int) {
    var i = i, j = j
    while i < j {
        swap(&nums, i, j)
        i += 1
        j -= 1
    }
}

/**
 TestCases: <#Description#>
 */
let testCases = [
    [1,2,3],
    [1,2],
    [4,3,2,1]
]

for arr in testCases {
    var arr = arr
    nextPermutation(&arr)
    print(arr)
}






