
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
