

/// Sqrt(x)
/// https://leetcode.com/problems/sqrtx/
/// - Parameter x: x > 0
/// - Returns: sqrt(x)
/// what should be the target?
/// start from where and end from where?
/// sqrt(1) == ?
import UIKit

func mySqrt(_ x: Int) -> Int {
    guard x > 0 else { return 0 }
    var start = 1, end = x
    while start + 1 < end {
        let mid = start + (end - start) / 2
        if mid * mid <= x {
            start = mid
        } else {
            end = mid
        }
    }
    if end * end <= x {
        return end
    } else {
        return start
    }
}

//what about the type is double?
///http://www.lintcode.com/en/problem/sqrtx-ii/
//http://www.cnblogs.com/AnnieKim/archive/2013/04/18/3028607.html


