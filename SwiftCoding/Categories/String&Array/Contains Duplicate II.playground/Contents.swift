
import ZHDataStructure
import UIKit

/**
 219. Contains Duplicate II Add to List
 Category: [<#Description#>]
 
 Question: Given an array of integers and an integer k, find out whether there are two distinct indices i and j in the array such that nums[i] = nums[j] and the difference between i and j is at most k.
 
 Link: https://leetcode.com/problems/contains-duplicate-ii/#/description
 Solution: https://segmentfault.com/a/1190000003709386
 Return: <#Description#>
 
 Idea: <#Description#>
 
 Time: <#Description#>, Space: <#Description#>
 
 */

func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
    guard nums.count > 1 else { return false }
    // key: nums[index], value: index
    var dict = [Int: Int]()
    for (i, cur) in nums.enumerated() {
        guard let index = dict[cur], i - index <= k else {
            dict[cur] = i
            continue
        }
        return true
    }
    return false
}

/**
 TestCases: <#Description#>
 */
//let testCases = [
//    <#Description#>
//]
//
//for <#Description#> in testCases {
//    print(<#Description#>)
//}






