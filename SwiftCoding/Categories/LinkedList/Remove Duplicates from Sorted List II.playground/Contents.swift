
import ZHDataStructure
import UIKit

/**
 82. Remove Duplicates from Sorted List II
 
 Link: https://leetcode.com/problems/remove-duplicates-from-sorted-list-ii/
 
 Category: [<#Description#>]
 
 Question: Given a sorted linked list, delete all nodes that have duplicate numbers, leaving only distinct numbers from the original list.
 
 For example,
 Given 1->2->3->3->4->4->5, return 1->2->5.
 Given 1->1->1->2->3, return 2->3.
 
 Idea: <#Description#>
 
 Time: O(n), Space: O(1)
 
 */

func deleteDuplicates(_ head: ListNode?) -> ListNode? {
    if head == nil || head!.next == nil {
        return head
    }
    
    let dummy = ListNode(0)
    dummy.next = head
    var node = dummy
    
    while node.next != nil && node.next!.next != nil {
        if node.next!.val == node.next!.next!.val {
            let val = node.next!.val
            while node.next != nil && node.next!.val == val {
                node.next = node.next!.next
            }
        } else {
            node = node.next!
        }
    }
    
    return dummy.next
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






