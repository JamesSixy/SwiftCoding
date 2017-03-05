
/// 167. Two Sum II - Input array is sorted
/// https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/?tab=Description
/// - Parameters:
///   - numbers: <#numbers description#>
///   - target: <#target description#>
/// - Returns: <#return value description#>

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    guard nums.count > 0 else { return [] }
    var start = 0, end = nums.count - 1
    while start < end {
        let front = nums[start], rear = nums[end]
        if front + rear == target {
            return [start + 1, end + 1]
        } else if front + rear > target {
            end -= 1
        } else {
            start += 1
        }
    }
    return []
}