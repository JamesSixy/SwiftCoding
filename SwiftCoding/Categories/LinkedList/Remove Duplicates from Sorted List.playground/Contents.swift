
import ZHDataStructure
import UIKit

/**
 83. Remove Duplicates from Sorted List
 
 Link: https://leetcode.com/problems/remove-duplicates-from-sorted-list/#/description
 
 Category: [<#Description#>]
 
 Question: Given a sorted linked list, delete all duplicates such that each element appear only once.
 
 For example,
 Given 1->1->2, return 1->2.
 Given 1->1->2->3->3, return 1->2->3.
 
 Idea: Iterate the list, jump over duplicates by replacing next with next.next
 
 Time: O(n), Space: O(1)
 
 */

func deleteDuplicates(_ head: ListNode?) -> ListNode? {
    guard let head = head else {
        return nil
    }
    
    var curt = head
    
    while curt.next != nil {
        if curt.next!.val == curt.val {
            curt.next = curt.next!.next
        } else {
            curt = curt.next!
        }
    }
    
    return head
}

/**
 TestCases: <#Description#>
 */
let testCases = [
    <#Description#>
]

for <#Description#> in testCases {
    print(<#Description#>)
}






