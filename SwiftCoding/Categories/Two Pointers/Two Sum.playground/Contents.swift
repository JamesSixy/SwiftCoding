
/// 1. Two Sum
/// https://leetcode.com/problems/two-sum/?tab=Description
/// - Parameters:
///   - nums: <#nums description#>
///   - target: <#target description#>
/// - Returns: <#return value description#>

//Solution 1: Two pointers with wrapping
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    let res: [Int] = []
    guard nums.count > 0 else { return res }
    let tuples: [(i: Int, ele: Int)] = nums.enumerated().map { ($0.offset, $0.element) }.sorted { (t1, t2) -> Bool in
        return t1.1 < t2.1
    }
    var start = 0, end = tuples.count - 1
    while start < end {
        let startVal = tuples[start].ele, endVel = tuples[end].ele
        let startIndex = tuples[start].i, endIndex = tuples[end].i
        if startVal + endVel > target {
            end -= 1
        } else if startVal + endVel < target {
            start += 1
        } else {
            return [min(startIndex, endIndex), max(startIndex, endIndex)]
        }
    }
    return res
}