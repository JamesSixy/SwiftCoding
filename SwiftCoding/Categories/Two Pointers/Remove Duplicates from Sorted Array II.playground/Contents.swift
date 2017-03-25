
/// 80. Remove Duplicates from Sorted Array II
/// https://leetcode.com/problems/remove-duplicates-from-sorted-array-ii/?tab=Description
/// - Parameter nums: <#nums description#>
/// - Returns: <#return value description#>


/**
 * Question Link: https://leetcode.com/problems/remove-duplicates-from-sorted-array/
 * Primary idea: keep a index, compare the element at that index with the element moving forward
 * Time Complexity: O(n), Space Complexity: O(1)
 *
 */
func removeDuplicatesI(_ nums: inout [Int]) -> Int {
    guard nums.count > 1 else { return nums.count }
    var lastIndex = 0
    for num in nums {
        if num != nums[lastIndex] {
            lastIndex += 1
            nums[lastIndex] = num
        }
    }
    return lastIndex + 1
}


/**
 * Question Link: https://leetcode.com/problems/remove-duplicates-from-sorted-array-ii/
 * Primary idea: keep a index, compare between the element at that index, the element at index - 1,
 *               and the element moving forward
 * Time Complexity: O(n), Space Complexity: O(1)
 *
 */
func removeDuplicates(_ nums: inout [Int]) -> Int {
    // edge case
    guard nums.count > 2 else { return nums.count }
    var lastIndex = 1
    for i in 2 ..< nums.count {
        if nums[lastIndex] != nums[i] || nums[lastIndex] != nums[lastIndex - 1] {
            lastIndex += 1
            nums[lastIndex] = nums[i]
        }
    }
    return lastIndex + 1
}
