
/// 153. Find Minimum in Rotated Sorted Array
/// https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/
/// - Parameter nums:
/// - Returns: element
/// What should be the target??

import UIKit

func findMin(_ nums: [Int]) -> Int {
    guard nums.count > 0 else {
        return -1
    }
    var start = 0, end = nums.count - 1
    let target = nums[end]
    while start + 1 < end {
        let mid = start + (end - start) / 2
        if nums[mid] > target {
            start = mid
        } else {
            end = mid
        }
    }
    if nums[start] > nums[end] {
        return nums[end]
    } else {
        return nums[start]
    }
}
