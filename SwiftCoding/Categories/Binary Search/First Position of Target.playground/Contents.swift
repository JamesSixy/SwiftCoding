
/// First Position of Target
/// http://www.lintcode.com/en/problem/first-position-of-target/
///
/// - Parameters:
///   - nums: <#nums description#>
///   - target: <#target description#>
/// - Returns: index

import UIKit

func firstPosition(nums: [Int], target: Int) -> Int {
    guard nums.count > 0 else { return -1 }
    var start = 0, end = nums.count - 1
    while start + 1 < end {
        let mid = start + (end - start) / 2
        if nums[mid] >= target {
            end = mid
        } else {
            start = mid
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

//firstPosition(nums: [1, 2, 3, 3, 4, 5, 10], target: 3)
