
///  Last Position of Target
///  http://www.lintcode.com/en/problem/last-position-of-target/
/// - Parameters:
///   - nums: <#nums description#>
///   - target: <#target description#>
/// - Returns: index

import UIKit

func lastPosition(nums: [Int], target: Int) -> Int {
    guard nums.count > 0 else { return -1 }
    var start = 0, end = nums.count - 1
    while start + 1 < end {
        let mid = start + (end - start) / 2
        if nums[mid] <= target {
            start = mid
        } else {
            end = mid
        }
    }
    if nums[end] == target {
        return end
    } else if nums[start] == target {
        return start
    } else {
        return -1
    }
}
