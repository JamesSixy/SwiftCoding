
import ZHDataStructure
import UIKit

/**
 42. Trapping Rain Water
 Category: [TP]
 
 Question: Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it is able to trap after raining.
 
 For example,
 Given [0,1,0,2,1,0,1,3,2,1,2,1], return 6.
 
 Link: https://leetcode.com/problems/trapping-rain-water/#/description
 Solution: <#Description#>
 Return: <#Description#>
 
 Idea: <#Description#>
 
 Time: O(n), Space: O(1)
 
 */

func trap(_ height: [Int]) -> Int {
    guard height.count > 0 else { return 0 }
    var left = 0, right = height.count - 1
    var lH = height[left], rH = height[right]
    var count = 0
    while left < right {
        if lH <= rH {
            left += 1
            if lH > height[left] {
                count += lH - height[left]
            } else {
                lH = height[left]
            }
        } else {
            right -= 1
            if rH > height[right] {
                count += rH - height[right]
            } else {
                rH = height[right]
            }
        }
    }
    return count
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






