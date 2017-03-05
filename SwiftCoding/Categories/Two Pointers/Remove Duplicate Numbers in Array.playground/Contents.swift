
/// 26. Remove Duplicates from Sorted Array
/// https://leetcode.com/problems/remove-duplicates-from-sorted-array/?tab=Description
/// - Parameter nums: nums
/// - Returns: new size
/// Two pointers start at 0 index. One prev, one cur. if same, cur keep going. Else, put cur element at prev

func removeDuplicates(_ nums: inout [Int]) -> Int {
    guard nums.count > 0 else { return 0 }
    var prev = 0
    for i in stride(from: 0, to: nums.count, by: 1) {
        if nums[i] != nums[prev] {
            prev += 1
            nums[prev] = nums[i]
        }
    }
    return prev + 1
}