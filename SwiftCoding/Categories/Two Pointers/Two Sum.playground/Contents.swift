
/// 1. Two Sum
/// https://leetcode.com/problems/two-sum/?tab=Description
/// - Parameters:
///   - nums: <#nums description#>
///   - target: <#target description#>
/// - Returns: <#return value description#>

//Solution 1: Two pointers - O(nlogn) time, O(n) space in Swift
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    let res: [Int] = []
    guard nums.count > 0 else { return res }
    let tuples: [(index: Int, ele: Int)] = nums.enumerated().map { ($0.offset, $0.element) }.sorted { (t1, t2) -> Bool in
        return t1.ele < t2.ele
    }
    var start = 0, end = tuples.count - 1
    while start < end {
        let startVal = tuples[start].ele, endVal = tuples[end].ele
        let startIndex = tuples[start].index, endIndex = tuples[end].index
        if startVal + endVal > target {
            end -= 1
        } else if startVal + endVal < target {
            start += 1
        } else {
            return [min(startIndex, endIndex), max(startIndex, endIndex)]
        }
    }
    return res
}

//Solution 2 HashMap - O(n) time, O(n) space
func twoSumHM(_ nums: [Int], _ target: Int) -> [Int] {
    let res: [Int] = []
    guard nums.count > 0 else { return res }
    var dict = [Int : Int]()
    for (i, ele) in nums.enumerated() {
        if let lastI = dict[ele] {
            return [lastI, i]
        } else {
            dict[target - ele] = i
        }
    }
    return res
}

//1 2 4 5, 5
//4, 0
//3, 1




