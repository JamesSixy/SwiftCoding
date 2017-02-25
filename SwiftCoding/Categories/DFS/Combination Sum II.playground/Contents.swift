
/// 40. Combination Sum II
/// https://leetcode.com/problems/combination-sum-ii/?tab=Description
/// - Parameters:
///   - candidates: <#candidates description#>
///   - target: <#target description#>
/// - Returns: <#return value description#>

func combinationSum2(_ candidates: [Int],
                      _ target: Int) -> [[Int]] {
    var res: [[Int]] = []
    guard candidates.count > 0 else { return res }
    var container: [Int] = []
    combinationSum2Helper(&res,
                          &container,
                          target,
                          candidates.sorted(),
                          0)
    return res
}

private func combinationSum2Helper(_ res: inout [[Int]],
                                   _ container: inout [Int],
                                   _ target: Int,
                                   _ candidates: [Int],
                                   _ start: Int) {
    if target == 0 {
        res.append(container)
        return
    }
    for i in stride(from: start, to: candidates.count, by: 1) {
        if target - candidates[i] < 0 {
            return
        }
        if i != start && candidates[i] == candidates[i - 1] {
            continue
        }
        container.append(candidates[i])
        combinationSum2Helper(&res, &container, target - candidates[i], candidates, i + 1)
        container.removeLast()
    }
}




