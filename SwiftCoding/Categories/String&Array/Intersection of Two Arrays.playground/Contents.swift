
import ZHDataStructure

/// 349. Intersection of Two Arrays
/// https://leetcode.com/problems/intersection-of-two-arrays/?tab=Description
/// - Parameters:
///   - nums1: <#nums1 description#>
///   - nums2: <#nums2 description#>
/// - Returns: <#return value description#>

/*
 1.Hash
 2.Merge two sorted arrays
 3.binary search
 */

func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    guard nums1.count > 0 && nums2.count > 0 else { return [] }
    let nums1Longer = nums1.count > nums2.count
    let small = (nums1Longer ? nums2 : nums1).sorted()
    let big = nums1Longer ? nums1 : nums2
    var set = Set<Int>()
    for num in big {
        if !set.contains(num) && binarySearch(small, num) != -1 {
            set.insert(num)
        }
    }
    return Array(set)
}
