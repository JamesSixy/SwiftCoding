
import ZHDataStructure
import UIKit

/**
 Odd Even Linked List
 Category: [<#Description#>]
 
 Question: Given a singly linked list, group all odd nodes together followed by the even nodes. Please note here we are talking about the node number and not the value in the nodes.
 
 You should try to do it in place. The program should run in O(1) space complexity and O(nodes) time complexity.
 
 Example:
 Given 1->2->3->4->5->NULL,
 return 1->3->5->2->4->NULL.
 
 Note:
 The relative order inside both the even and odd groups should remain as it was in the input.
 The first node is considered odd, the second node even and so on ...
 
 Link: https://leetcode.com/problems/odd-even-linked-list/
 Solution: <#Description#>
 Return: <#Description#>
 
 Idea: Prev-post two pointers; change the prev and move both at a time
 
 Time: O(n), Space: O(1)
 
 */

func oddEvenList(_ head: ListNode?) -> ListNode? {
    guard head != nil && head!.next != nil else {
        return head
    }
    
    let evenHead = head!.next
    var p = head
    var q = evenHead
    var isEndEven = true
    
    while q!.next != nil {
        let node = q!.next
        
        p!.next = node
        
        p = q
        q = node
        isEndEven = !isEndEven
    }
    
    if isEndEven {
        p!.next = evenHead
    } else {
        p!.next = nil
        q!.next = evenHead
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






