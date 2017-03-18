
/**
 40. Combination Sum II
 Category: [DFS]
 
 Question: Given a collection of candidate numbers (C) and a target number (T), find all unique combinations in C where the candidate numbers sums to T.
 Each number in C may only be used once in the combination.
 
 Link: https://leetcode.com/problems/combination-sum-ii/?tab=Description
 
 通用的DFS时间复杂度计算公式:
 O(答案个数 * 构造每个答案的时间)
 
 Time: O(n!), Space: O(n)
 
 */

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
    for i in start ..< candidates.count {
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




