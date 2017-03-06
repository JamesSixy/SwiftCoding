
/// 15. 3Sum
/// https://leetcode.com/problems/3sum/?tab=Description
/// - Parameter nums: <#nums description#>
/// - Returns: <#return value description#>

func threeSum(_ nums: [Int]) -> [[Int]] {
    var res: [[Int]] = []
    guard nums.count > 2 else { return res }
    let nums = nums.sorted()
    for i in 0 ..< nums.count - 2 {
        if i != 0 && nums[i] == nums[i - 1] {
            continue
        }
        uniquePairs(&res, nums, i)
    }
    return res
}

private func uniquePairs(_ res: inout [[Int]],
                         _ nums: [Int],
                         _ index: Int) {
    let target = nums[index]
    var start = index + 1, end = nums.count - 1
    while start < end {
        let front = nums[start], rear = nums[end]
        if target + front + rear == 0 {
            res.append([target, front, rear])
            while start < end && nums[start] == front {
                start += 1
            }
            while start < end && nums[end] == rear {
                end -= 1
            }
        } else if target + front + rear > 0 {
            end -= 1
        } else {
            start += 1
        }
    }
}