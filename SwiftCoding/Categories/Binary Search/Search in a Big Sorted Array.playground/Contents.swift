
/// Search in a Big Sorted Array
/// http://www.lintcode.com/en/problem/search-in-a-big-sorted-array/#
/// - Parameter reader: <#reader description#>
/// - Returns: index
import UIKit

func searchBigSortedArray(reader: inout [Int], target: Int) -> Int {
    //can't use the length of reader since it's so big
    //just use "" to fake ArrayReader.get(k)
    
    var start = 0, end = 0
    
    while reader.remove(at: end) < target {
        end = end * 2 + 1
    }
    while start + 1 < end {
        let mid = start + (end - start) / 2
        if reader.remove(at: mid) >= target {
            end = mid
        } else {
            start = mid
        }
    }
    if reader.remove(at: start) == target {
        return start
    } else if reader.remove(at: end) == target {
        return end
    } else {
        return -1
    }
}
