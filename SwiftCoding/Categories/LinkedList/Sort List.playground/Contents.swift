
import ZHDataStructure

/// 148. Sort List
/// https://leetcode.com/problems/sort-list/?tab=Description
/// - Parameter head: <#head description#>
/// - Returns: <#return value description#>

func sortList(_ head: ListNode?) -> ListNode? {
    if head == nil || head?.next == nil {
        return head
    }
    let mid = findMiddle(head: head)
    let right = sortList(mid?.next)
    mid?.next = nil
    let left = sortList(head)
    return mergeTwoLists(left, right)
}

func findMiddle(head: ListNode?) -> ListNode? {
    var slow = head, fast = head?.next
    while fast != nil && fast?.next != nil {
        fast = fast?.next?.next
        slow = slow?.next
    }
    return slow
}

func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    let dummy = ListNode(1)
    var cur: ListNode? = dummy, l1 = l1, l2 = l2
    while l1 != nil && l2 != nil {
        if l1!.val <= l2!.val {
            cur?.next = l1
            l1 = l1?.next
        } else {
            cur?.next = l2
            l2 = l2?.next
        }
        cur = cur?.next
    }
    cur?.next = l1 == nil ? l2 : l1
    return dummy.next
}