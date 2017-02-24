
/// 78. Subsets
/// https://leetcode.com/problems/subsets/?tab=Description
/// - Parameter nums: <#nums description#>
/// - Returns: <#return value description#>
//Given a set of distinct integers, nums, return all possible subsets.
//Note: The solution set must not contain duplicate subsets.

func subsets(_ nums: [Int]) -> [[Int]] {
    var res: [[Int]] = []
    guard nums.count > 0 else {
        return res
    }
    var container: [Int] = []
    subsetHelper(&res, &container, 0, nums.sorted())
    return res
}

func subsetHelper(_ res: inout [[Int]],
                  _ container: inout [Int],
                  _ start: Int,
                  _ nums: [Int]) {
    res.append(container)
    for i in stride(from: start, to: nums.count, by: 1) {
        container.append(nums[i])
        subsetHelper(&res, &container, i + 1, nums)
        container.removeLast()
    }
}


/// 90. Subsets II
/// https://leetcode.com/problems/subsets-ii/?tab=Description
/// - Parameter nums: <#nums description#>
/// - Returns: <#return value description#>

func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
    var res: [[Int]] = []
    guard nums.count > 0 else {
        return res
    }
    var container: [Int] = []
    subsetDupHelper(&res, &container, 0, nums.sorted())
    return res
}

func subsetDupHelper(_ res: inout [[Int]],
                  _ container: inout [Int],
                  _ start: Int,
                  _ nums: [Int]) {
    res.append(container)
    for i in stride(from: start, to: nums.count, by: 1) {
        if i != start && nums[i] == nums[i - 1] {
            continue
        }
        container.append(nums[i])
        subsetDupHelper(&res, &container, i + 1, nums)
        container.removeLast()
    }
}





