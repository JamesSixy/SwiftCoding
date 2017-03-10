
/// 278. First Bad Version
///
/// - Parameter n:
/// - Returns: n which is the version int
// how does it look??
// <good good ... good good bad bad bad> ***
// Tips: If you want to search the left most, you will cut right part which is end = mid. So nums[mid] >= target. If right most, you cut left part which is start = mid, and then the condition is nums[mid] <= target

import UIKit

func firstBadVersion(_ n: Int) -> Int {
    var start = 0, end = n
    while start + 1 < end {
        let mid = start + (end - start) / 2
        if isBadVersion(mid) {
            end = mid
        } else {
            start = mid
        }
    }
    if isBadVersion(start) {
        return start
    } else {
        return end
    }
}

private func isBadVersion(_ n: Int) -> Bool {
    return false //fake
}
