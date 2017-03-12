
import ZHDataStructure

/// 143. Reorder List ***** one question contains four questions
/// https://leetcode.com/problems/reorder-list/?tab=Description
/// - Parameter head: <#head description#>

func reorderList(_ head: ListNode?) {
    let middle = findMiddle(head)
    let tail = reverseList(middle?.next)
    middle?.next = nil
    reorderMerge(head, tail)
}

private func findMiddle(_ head: ListNode?) -> ListNode? {
    var slow = head, fast = head?.next
    while fast != nil && fast?.next != nil {
        fast = fast?.next?.next
        slow = slow?.next
    }
    return slow
}

private func reorderMerge(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    let dummy = ListNode(1)
    var cur: ListNode? = dummy, l1 = l1, l2 = l2, index = 0
    while l1 != nil && l2 != nil {
        if index % 2 == 0 {
            cur?.next = l1
            l1 = l1?.next
        } else {
            cur?.next = l2
            l2 = l2?.next
        }
        cur = cur?.next
        index += 1
    }
    cur?.next = l1 == nil ? l2 : l1
    return dummy.next
}

private func reverseList(_ head: ListNode?) -> ListNode? {
    var prev: ListNode? = nil, cur = head
    while cur != nil {
        let tmp = cur?.next
        cur?.next = prev
        prev = cur
        cur = tmp
    }
    return prev
}

