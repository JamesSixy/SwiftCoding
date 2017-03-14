
/// 283. Move Zeroes
/// https://leetcode.com/problems/move-zeroes/?tab=Description
/// - Parameter nums: <#nums description#>

func moveZeroes(_ nums: inout [Int]) {
    guard nums.count > 0 else { return }
    var last = 0
    for (i, _) in nums.enumerated() {
        if nums[i] != 0 {
            if (last != i) {
                swap(&nums[i], &nums[last])
            }
            last += 1
        }
    }
}

//Double loop, first round putting all none-zero at front, then set the rest zero
func moveZeroes2(_ nums: inout [Int]) {
    guard nums.count > 0 else { return }
    var last = 0
    for num in nums where num != 0 {
        nums[last] = num
        last += 1
    }
    for i in last ..< nums.count {
        nums[i] = 0
    }
}
