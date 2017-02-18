
/// Wood cut
/// http://www.lintcode.com/en/problem/wood-cut/
/// - Parameters:
///   - L: woods
///   - k: k pieces
/// - Returns: max length

func woodCut(_ L: [Int], _ k: Int) -> Int {
    guard L.count > 0, k > 0 else {
        return 0
    }
    var maxLen = 0
    for i in L where i > maxLen {
        maxLen = i
    }
    var start = 1, end = maxLen
    while start + 1 < end {
        let mid = start + (end - start) / 2
        if countWood(mid, L) >= k {
            start = mid
        } else {
            end = mid
        }
    }
    if countWood(end, L) >= k {
        return end
    } else if countWood(start, L) >= k {
        return start
    } else {
        return 0
    }
}

private func countWood(_ len: Int, _ L: [Int]) -> Int {
    var count = 0
    for wood in L {
        count += wood / len
    }
    return count
}

//woodCut([232, 124, 456], 7)
