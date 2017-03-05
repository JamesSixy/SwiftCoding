
/// Two Sum - Unique pairs
/// http://www.lintcode.com/en/problem/two-sum-unique-pairs/
/// - Parameters:
///   - nums: <#nums description#>
///   - target: <#target description#>
/// - Returns: <#return value description#>

func twoSum6(_ nums: [Int], _ target: Int) -> Int {
    guard nums.count > 0 else { return 0 }
    var nums = nums.sorted(), count = 0
    var start = 0, end = nums.count - 1
    while start < end {
        let front = nums[start], rear = nums[end]
        if front + rear == target {
            count += 1
            while start < end && nums[start] == front {
                start += 1
            }
            while start < end && nums[end] == rear {
                end -= 1
            }
        } else if front + end > target {
            end -= 1
        } else {
            start += 1
        }
    }
    return count
}