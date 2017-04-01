
/// 162. Find Peak Element
/// https://leetcode.com/problems/find-peak-element/
/// - Parameter nums:
/// - Returns: index!!
// What should be the left neighbor/right neighbor??

import UIKit

func findPeakElement(_ nums: [Int]) -> Int {
    guard nums.count > 0 else { return 0 }
    var start = 0, end = nums.count - 1
    while start + 1 < end {
        let mid = start + (end - start) / 2
        let left = nums[mid - 1], right = nums[mid + 1]
        if nums[mid] > left && nums[mid] > right {
            return mid
        } else if nums[mid] > left && nums[mid] < right {
            start = mid
        } else {
            end = mid
        }
    }
    if nums[start] > nums[end] {
        return start
    } else if nums[end] > nums[start] {
        return end
    } else {
        return 0
    }
}
