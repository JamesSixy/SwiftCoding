
/// 283. Move Zeroes
/// https://leetcode.com/problems/move-zeroes/?tab=Description
/// - Parameter nums: <#nums description#>

/**
 283. Move Zeroes
 Category: [TPFB]
 
 Link: https://leetcode.com/problems/move-zeroes/?tab=Description
 Solution:
 Return: <#Description#>
 
 Idea: <#Description#>
 
 Time: O(n), Space: O(1)
 
 */

func moveZeroes(_ nums: inout [Int]) {
    guard nums.count > 0 else { return }
    var last = 0
    for (i, cur) in nums.enumerated() where cur != 0 {
        if (last != i) {
            swap(&nums[i], &nums[last])
        }
        last += 1
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
    for i in last ..< nums.count where nums[i] != 0 {
        nums[i] = 0
    }
}
