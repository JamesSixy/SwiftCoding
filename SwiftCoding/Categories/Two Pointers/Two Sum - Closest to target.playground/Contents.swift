
/// Two Sum - Closest to target
/// http://www.lintcode.com/en/problem/two-sum-closest-to-target/
/// - Parameters:
///   - nums: <#nums description#>
///   - target: <#target description#>
/// - Returns: <#return value description#>

func twoSumClosest(_ nums: [Int], _ target: Int) -> Int {
    guard nums.count > 1 else { return 0 }
    var nums = nums.sorted(), diff = Int.max
    var start = 0, end = nums.count - 1
    while start < end {
        let front = nums[start], rear = nums[end]
        if front + rear == target {
            return 0
        } else if front + rear > target {
            diff = min(diff, target - front - rear)
            end -= 1
        } else {
            diff = min(diff, target - front - rear)
            start += 1
        }
    }
    return diff
}

//let testCases = [
//    ([-1, 2, 1, -4], 4)
//]
//for tuple in testCases {
//    print(twoSumClosest(tuple.0, tuple.1))
//}
