
/// 215. Kth Largest Element in an Array
/// https://leetcode.com/problems/kth-largest-element-in-an-array/?tab=Description
/// - Parameters:
///   - nums: <#nums description#>
///   - k: <#k description#>
/// - Returns: <#return value description#>

//Kth largest means get (count - k + 1)th minimum
func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
    guard nums.count > 0 && k > 0 && k <= nums.count else { return -1 }
    var nums = nums, start = 0, end = nums.count - 1, index = nums.count - k
    while start < end {
        let pivot = partition(&nums, start, end)
        if pivot == index {
            return nums[pivot]
        } else if pivot < index {
            start = pivot + 1
        } else {
            end = pivot - 1
        }
     }
    return nums[start]
}

private func partition(_ nums: inout [Int], _ start: Int, _ end: Int) -> Int {
    var start = start, end = end
    let pivot = nums[start]
    while start < end {
        while start < end && nums[end] >= pivot {
            end -= 1
        }
        nums[start] = nums[end]
        while start < end && nums[start] <= pivot {
            start += 1
        }
        nums[end] = nums[start]
    }
    nums[start] = pivot
    return start
}

private func swap<T>(_ nums: inout [T], _ i: Int, _ j: Int) {
    (nums[i], nums[j]) = (nums[j], nums[i])
}

let testCase = [
    ([5,4,6,2],1),
    ([5,2,4,1,3,6,0],2),
    ([3,2,1,3,3,3],2)
]
for tuple in testCase {
    print(tuple.0)
    print(findKthLargest(tuple.0, tuple.1))
    print()
}
