
import ZHDataStructure

/*
 61. Rotate List
 
 https://leetcode.com/problems/rotate-list/?tab=Description
 
 Given a list, rotate the list to the right by k places, where k is non-negative.
 
 For example:
 Given 1->2->3->4->5->NULL and k = 2,
 return 4->5->1->2->3->NULL.
 
 */

func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
    if head == nil {
        return head
    }
    
    let len = getLength(head)
    let k = k % len
    let dummy = ListNode(0)
    dummy.next = head
    var head: ListNode? = dummy, tail = head
    for _ in 0 ..< k {
        head = head?.next
    }
    while head?.next != nil {
        head = head?.next
        tail = tail?.next
    }
    
    head?.next = dummy.next
    dummy.next = tail?.next
    tail?.next = nil
    return dummy.next
}

private func getLength(_ head: ListNode?) -> Int {
    var count = 0, head = head
    while head != nil {
        count += 1
        head = head?.next
    }
    return count
}
