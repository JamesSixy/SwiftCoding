
/// 216. Combination Sum III
/// https://leetcode.com/problems/combination-sum-iii/?tab=Description
/// - Parameters:
///   - candidates: <#candidates description#>
///   - target: <#target description#>
/// - Returns: <#return value description#>

func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
    var res: [[Int]] = []
    guard k > 0, n > 0 else { return res }
    var container: [Int] = []
    combinationSum3Helper(&res, &container, n, k, 1)
    return res
}


private func combinationSum3Helper(_ res: inout [[Int]],
                                   _ container: inout [Int],
                                   _ n: Int,
                                   _ k: Int,
                                   _ start: Int) {
    if n == 0 && container.count == k {
        res.append(container)
        return
    }
    for i in stride(from: start, through: 9, by: 1) {
        if n - i < 0 {
            return
        }
        container.append(i)
        combinationSum3Helper(&res, &container, n - i, k, i + 1)
        container.removeLast()
    }
}

/*
 k = 2, n = 4
 
 [1, 3]
 
 
 */



