
/// 46. Permutations
/// https://leetcode.com/problems/permutations/?tab=Description
/// - Parameter nums: <#nums description#>
/// - Returns: <#return value description#>
/// Given a collection of distinct numbers, return all possible permutations.

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
    for i in stride(from: 0, to: nums.count, by: 1) {
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
    for i in stride(from: 0, to: nums.count, by: 1) {
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
