
/// 215. Kth Largest Element in an Array
/// https://leetcode.com/problems/kth-largest-element-in-an-array/?tab=Description
/// - Parameters:
///   - nums: <#nums description#>
///   - k: <#k description#>
/// - Returns: <#return value description#>

//Kth largest means get (count - k + 1)th minimum
func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
    guard nums.count > 0 && k > 0 else { return 0 }
    return helper(nums, 0, nums.count - 1, nums.count - k + 1)
}

private func helper(_ nums: [Int], _ l: Int, _ r: Int, _ k: Int) -> Int {
    var nums = nums
    if l == r {
        return nums[l]
    }
    let pos = partition(&nums, l, r)
    if pos + 1 == k {
        return nums[pos]
    } else if pos + 1 < k {
        return helper(nums, pos + 1, r, k)
    } else {
        return helper(nums, l, pos - 1, k)
    }
}

private func partition(_ nums: inout [Int], _ l: Int, _ r: Int) -> Int {
    var l = l, r = r
    let pivot = nums[l]
    while l < r {
        while l < r && nums[r] >= pivot {
            r -= 1
        }
        nums[l] = nums[r]
        while l < r && nums[l] <= pivot {
            l += 1
        }
        nums[r] = nums[l]
    }
    nums[l] = pivot
    return l
}