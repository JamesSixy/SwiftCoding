
/// 278. First Bad Version
///
/// - Parameter n:
/// - Returns: n which is the version int
// how does it look??
// <good good ... good good bad bad bad> ***

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