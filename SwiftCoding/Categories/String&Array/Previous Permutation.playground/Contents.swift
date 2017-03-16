
import ZHDataStructure
import UIKit

/**
  Previous Permutation
 Category: [<#Description#>]
 
 Question: <#Description#>
 
 Link: http://www.lintcode.com/en/problem/previous-permutation/
 Solution: http://www.jiuzhang.com/solutions/previous-permutation/
 Return: <#Description#>
 
 Idea: 
 
 2,3,4,5
 
 Time: <#Description#>, Space: <#Description#>
 
 */

func previousPermutation(_ nums: inout [Int]) {
    guard nums.count > 1 else { return }
    var i = nums.count - 1
    while i > 0 && nums[i] >= nums[i - 1] {
        i -= 1
    }
    reverse(&nums, i, nums.count - 1)
    if i != 0 {
        var j = i
        while j < nums.count - 1 && nums[j] >= nums[i - 1] {
            j += 1
        }
        swap(&nums, i - 1, j)
    }
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
    previousPermutation(&arr)
    print(arr)
}





