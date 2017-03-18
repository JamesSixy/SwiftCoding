
/**
 46. Permutations
 Category: [DFS]
 
 Question: Given a collection of distinct numbers, return all possible permutations.
 
 Link: https://leetcode.com/problems/permutations/?tab=Description
 
 通用的DFS时间复杂度计算公式:
 O(答案个数 * 构造每个答案的时间)
 
 Permutations问题，求所有的排列。排列个数一共 n！，每个集合的平均长度是 O(n) 的，所以时间复杂度为：O(n * n!)
 
 Time: O(n!), Space: O(n)
 
 */

func permute(_ nums: [Int]) -> [[Int]] {
    var res: [[Int]] = []
    guard nums.count > 0 else { return res }
    var container: [Int] = []
    var visited: Set<Int> = Set()
    permuteHelper(&res, &container, nums, &visited)
    return res
}

func permuteHelper(_ res: inout [[Int]],
                   _ container: inout [Int],
                   _ nums: [Int],
                   _ visited: inout Set<Int>) {
    if container.count == nums.count {
        res.append(container)
        return
    }
    for i in 0 ..< nums.count {
        if visited.contains(nums[i]) {
            continue
        }
        visited.insert(nums[i])
        container.append(nums[i])
        permuteHelper(&res, &container, nums, &visited)
        container.removeLast()
        visited.remove(nums[i])
    }
}

/// 47. Permutations II
/// https://leetcode.com/problems/permutations-ii/?tab=Description
/// - Parameter nums: <#nums description#>
/// - Returns: <#return value description#>

func permuteUnique(_ nums: [Int]) -> [[Int]] {
    var res: [[Int]] = []
    guard nums.count > 0 else { return res }
    var container: [Int] = []
    var visited = Array(repeating: false, count: nums.count)
    permuteUniHelper(&res, &container, nums.sorted(), &visited)
    return res
}

func permuteUniHelper(_ res: inout [[Int]],
                   _ container: inout [Int],
                   _ nums: [Int],
                   _ visited: inout [Bool]) {
    if container.count == nums.count {
        res.append(container)
        return
    }
    for i in 0 ..< nums.count {
        if visited[i] ||
            (i != 0 && nums[i] == nums[i - 1] && !visited[i - 1]) {
            continue
        }
        visited[i] = true
        container.append(nums[i])
        permuteUniHelper(&res, &container, nums, &visited)
        container.removeLast()
        visited[i] = false
    }
}
