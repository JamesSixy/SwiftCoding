

/// 77. Combinations
/// https://leetcode.com/problems/combinations/?tab=Description
/// - Parameters:
///   - n: <#n description#>
///   - k: <#k description#>
/// - Returns: <#return value description#>

func combine(_ n: Int, _ k: Int) -> [[Int]] {
    var res: [[Int]] = []
    guard n > 0, k <= n else { return res }
    var container: [Int] = []
    combineHelper(&res, &container, n, k, 1)
    return res
}

func combineHelper(_ res: inout [[Int]],
                   _ container: inout [Int],
                   _ n: Int,
                   _ k: Int,
                   _ start: Int) {
    if container.count == k {
        res.append(container)
        return
    }
    for i in stride(from: start, through: n, by: 1) {
        container.append(i)
        combineHelper(&res, &container, n, k, i + 1)
        container.removeLast()
    }
}
