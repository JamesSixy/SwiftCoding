
/**
 78. Subsets
 Category: [DFS]
 
 Question: Given a set of distinct integers, nums, return all possible subsets.
Note: The solution set must not contain duplicate subsets.
 
 Link: https://leetcode.com/problems/subsets/?tab=Description
 Return: all subsets
 
 通用的DFS时间复杂度计算公式:
 O(答案个数 * 构造每个答案的时间)
 
 Subsets问题，求所有的子集。子集个数一共 2^n，每个集合的平均长度是 O(n) 的，所以时间复杂度为 O(n * 2^n)，同理 Permutations 问题的时间复杂度为：O(n * n!)
 
 Time: O(2^n), Space: O(n)
 
 */

func subsets(_ nums: [Int]) -> [[Int]] {
    var res: [[Int]] = []
    guard nums.count > 0 else { return res }
    var container: [Int] = []
    subsetHelper(&res, &container, 0, nums.sorted())
    return res
}

func subsetHelper(_ res: inout [[Int]],
                  _ container: inout [Int],
                  _ start: Int,
                  _ nums: [Int]) {
    res.append(container)
    for i in start ..< nums.count {
        container.append(nums[i])
        subsetHelper(&res, &container, i + 1, nums)
        container.removeLast()
    }
}


/// 90. Subsets II
/// https://leetcode.com/problems/subsets-ii/?tab=Description
/// Given a collection of integers that might contain duplicates, nums, return all possible subsets.

func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
    var res: [[Int]] = []
    guard nums.count > 0 else { return res }
    var container: [Int] = []
    subsetDupHelper(&res, &container, 0, nums.sorted())
    return res
}

func subsetDupHelper(_ res: inout [[Int]],
                  _ container: inout [Int],
                  _ start: Int,
                  _ nums: [Int]) {
    res.append(container)
    for i in start ..< nums.count {
        if i != start && nums[i] == nums[i - 1] {
            continue
        }
        container.append(nums[i])
        subsetDupHelper(&res, &container, i + 1, nums)
        container.removeLast()
    }
}





