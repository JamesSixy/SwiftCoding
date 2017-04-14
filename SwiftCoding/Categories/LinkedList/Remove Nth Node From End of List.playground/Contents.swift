
import ZHDataStructure
import UIKit

/**
 19. Remove Nth Node From End of List
 Category: [<#Description#>]
 
 Question: Given a linked list, remove the nth node from the end of list and return its head.
 
 For example,
 
 Given linked list: 1->2->3->4->5, and n = 2.
 
 After removing the second node from the end, the linked list becomes 1->2->3->5.
 Note:
 Given n will always be valid.
 Try to do this in one pass.
 
 Link: https://leetcode.com/problems/remove-nth-node-from-end-of-list/#/description
 Solution: <#Description#>
 Return: <#Description#>
 
 Idea: <#Description#>
 
 Time: O(n), Space: O(1)
 
 */

func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    let dummy = ListNode(0)
    dummy.next = head
    var prev: ListNode? = dummy
    var post: ListNode? = dummy
    
    // move post
    for _ in 0 ..< n {
        post = post!.next
    }
    
    // move prev and post at the same time
    while post!.next != nil {
        prev = prev!.next
        post = post!.next
    }
    
    prev!.next = prev!.next!.next
    
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






