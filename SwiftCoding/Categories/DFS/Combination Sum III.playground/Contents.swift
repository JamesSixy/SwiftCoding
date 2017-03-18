
/**
 216. Combination Sum III
 Category: [DFS]
 
 Question: Find all possible combinations of k numbers that add up to a number n, given that only numbers from 1 to 9 can be used and each combination should be a unique set of numbers.
 
 Link: https://leetcode.com/problems/combination-sum-iii/?tab=Description
 
 通用的DFS时间复杂度计算公式:
 O(答案个数 * 构造每个答案的时间)
 
 Time: O(C(n, k)), Space: O(n)
 
 */

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



