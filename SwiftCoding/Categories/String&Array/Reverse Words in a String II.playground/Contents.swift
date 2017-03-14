
import ZHDataStructure
import UIKit

/**
 Reverse Words in a String II
 Category: [<#Description#>]
 
 Could you do it in-place without allocating extra space?
 
 Link: https://leetcode.com/problems/reverse-words-in-a-string-ii/#/description
 Solution: <#Description#>
 Return: <#Description#>
 
 Idea:
 
 Time: <#Description#>, Space: <#Description#>
 
 */

//func reverseWords(_ arr: [Character]) -> String {
//    guard arr.count > 0 else { return "" }
//    var arr = arr
//    reverse(&arr, 0, arr.count - 1)
//    var last = 0, cur = 0
//    while cur < arr.count {
//        if arr[cur] != " " {
//            last = cur
//            while cur < arr.count && arr[cur] != " " {
//                cur += 1
//            }
//            reverse(&arr, last, cur - 1)
//        } else {
//            cur += 1
//        }
//    }
//    return String(arr)
//}
//
//private func reverse(_ arr: inout [Character],
//                     _ start: Int,
//                     _ end: Int) {
//    for i in stride(from: 0, through: (end - start + 1) / 2, by: 1) {
//        swap(&arr, start + i, end - i)
//    }
//}
//
//func swap<T>(_ nums: inout [T], _ p: Int, _ q: Int) {
//    (nums[p], nums[q]) = (nums[q], nums[p])
//}
//
///**
// TestCases: <#Description#>
// */
//let testCases = [
//    "What day is it",
//    "How are you",
//    "Jump it",
//    "Dad",
//    ""
//]
//
//for str in testCases {
//    let arr = [Character](str.characters)
//    print(reverseWords(arr))
//}






