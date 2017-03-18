
/**
 77. Combinations
 Category: [DFS]
 
 Question: Given two integers n and k, return all possible combinations of k numbers out of 1 ... n.
 
 Link: https://leetcode.com/problems/combinations/?tab=Description
 
 通用的DFS时间复杂度计算公式:
 O(答案个数 * 构造每个答案的时间)
 
 Time: O(C(n, k)) < O(2^n), Space: O(n)
 
 */

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
    for i in start ... n {
        container.append(i)
        combineHelper(&res, &container, n, k, i + 1)
        container.removeLast()
    }
}
