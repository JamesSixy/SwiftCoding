
/// Two Sum - Less than or equal to target
/// http://www.lintcode.com/en/problem/two-sum-less-than-or-equal-to-target/
/// - Parameters:
///   - nums: <#nums description#>
///   - target: <#target description#>
/// - Returns: <#return value description#>
//O(nlogn) time, O(1) space

func twoSum5(_ nums: [Int], _ target: Int) -> Int {
    guard nums.count > 0 else { return 0 }
    var nums = nums.sorted(), count = 0
    var start = 0, end = nums.count - 1
    while start < end {
        let front = nums[start], rear = nums[end]
        if front + rear <= target {
            count += end - start
            start += 1
        } else {
            end -= 1
        }
    }
    return count
}
