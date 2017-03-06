
/// 75. Sort Colors
/// https://leetcode.com/problems/sort-colors/?tab=Description
/// - Parameter nums: 0, 1, 2

func sortColors(_ nums: inout [Int]) {
    guard nums.count > 0 else { return }
    var left = 0, right = nums.count - 1, i = 0
    while i <= right {
        if nums[i] == 0 {
            swap(&nums, i, left)
            left += 1
            i += 1
        } else if nums[i] == 1 {
            i += 1
        } else {
            swap(&nums, i, right)
            right -= 1
        }
    }
}

private func swap<T>(_ nums: inout [T], _ i: Int, _ j: Int) {
    (nums[i], nums[j]) = (nums[j], nums[i])
}

let testCases = [
    [0, 0, 2, 2, 1, 1, 0, 0],
    [0, 0, 0, 0],
    [1, 1, 1],
    [0],
    [],
    [1, 2, 0, 2, 0, 1]
]

for var arr in testCases {
    sortColors(&arr)
    print(arr)
}