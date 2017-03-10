

/// 33. Search in Rotated Sorted Array
/// https://leetcode.com/problems/search-in-rotated-sorted-array/
/// - Parameters:
///   - nums: <#nums description#>
///   - target: <#target description#>
/// - Returns: index
import UIKit

func search(_ nums: [Int], _ target: Int) -> Int {
    guard nums.count > 0 else { return -1 }
    var start = 0, end = nums.count - 1
    while start + 1 < end {
        let mid = start + (end - start) / 2
        //if we use "if nums[mid] > nums[start] {", it will also work, rest the same. Figure this out in the graph
        if nums[mid] > nums[end] {
            if target >= nums[start] && target <= nums[mid] {
                end = mid
            } else {
                start = mid
            }
        } else {
            if target >= nums[mid] && target <= nums[end] {
                start = mid
            } else {
                end = mid
            }
        }
    }
    if nums[start] == target {
        return start
    } else if nums[end] == target {
        return end
    } else {
        return -1
    }
}

/// 81. Search in Rotated Sorted Array II
/// https://leetcode.com/problems/search-in-rotated-sorted-array-ii/
///
/// Follow up for "Search in Rotated Sorted Array": What if duplicates are allowed?
/// Would this affect the run-time complexity? How and why?
/// - Parameters:
///   - nums: <#nums description#>
///   - target: <#target description#>
/// - Returns: bool
/// Why??
/// [1,1,1,1... 1, 0, 1] you won't know which way to go, can't use BS
func searchII(_ nums: [Int], _ target: Int) -> Bool {
    for num in nums where num == target {
        return true
    }
    return false
}
