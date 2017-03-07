
/// 283. Move Zeroes
/// https://leetcode.com/problems/move-zeroes/?tab=Description
/// - Parameter nums: <#nums description#>

func moveZeroes(_ nums: inout [Int]) {
    guard nums.count > 0 else {
        return
    }
    var last = 0
    for i in stride(from: 0, to: nums.count, by: 1) {
        if nums[i] != 0 {
            if (last != i) {
                swap(&nums[i], &nums[last])
            }
            last += 1
        }
    }
}