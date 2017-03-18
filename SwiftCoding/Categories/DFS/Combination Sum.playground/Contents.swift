
/**
 39. Combination Sum
 Category: [DFS]
 
 Question: Given a set of candidate numbers (C) (without duplicates) and a target number (T), find all unique combinations in C where the candidate numbers sums to T.
 The same repeated number may be chosen from C unlimited number of times.
 
 Link: https://leetcode.com/problems/combination-sum/?tab=Description
 
 通用的DFS时间复杂度计算公式:
 O(答案个数 * 构造每个答案的时间)
 
 Time: O(n!), Space: O(n)
 
 */

func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
    var res: [[Int]] = []
    guard candidates.count > 0 else { return res }
    var container: [Int] = []
    combinationSumHelper(&res, &container, target, candidates.sorted(), 0)
    return res
}

func combinationSumHelper(_ res: inout [[Int]],
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
            return //no need for calculating the rest ascending
        }
        container.append(candidates[i])
        combinationSumHelper(&res, &container, target - candidates[i], candidates, i)
        container.removeLast()
    }
}

/*
 [2, 3, 6, 7]  7
 
 [2] 5
 [2, 2] 3
 [2, 2, 2] 1
 [2, 2, 3] 0
 
 */
