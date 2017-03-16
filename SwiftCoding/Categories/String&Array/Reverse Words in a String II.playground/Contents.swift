
import ZHDataStructure
import UIKit

/**
 Reverse Words in a String II
 Category: [<#Description#>]
 
 Could you do it in-place without allocating extra space?
 
 Link: https://leetcode.com/problems/reverse-words-in-a-string-ii/#/description
 Solution: <#Description#>
 Return: <#Description#>
 
 Idea:
 
 Time: <#Description#>, Space: <#Description#>
 
 */

func reverseWords(_ arr: inout [Character]) {
    guard arr.count > 0 else { return }
    reverse(&arr, 0, arr.count - 1)
    var last = 0, cur = 0
    while cur < arr.count {
        if arr[cur] != " " {
            last = cur
            while cur < arr.count && arr[cur] != " " {
                cur += 1
            }
            reverse(&arr, last, cur - 1)
        } else {
            cur += 1
        }
    }
}

private func reverse<T>(_ nums: inout [T], _ i: Int, _ j: Int) {
    var i = i, j = j
    while i < j {
        swap(&nums, i, j)
        i += 1
        j -= 1
    }
}

func swap<T>(_ nums: inout [T], _ p: Int, _ q: Int) {
    (nums[p], nums[q]) = (nums[q], nums[p])
}

/**
 TestCases: <#Description#>
 */
let testCases = [
    "What day is it",
    "How are you",
    "Jump it",
    "Dad",
    ""
]

for str in testCases {
    var arr = [Character](str.characters)
    reverseWords(&arr)
    print(String(arr))
}






