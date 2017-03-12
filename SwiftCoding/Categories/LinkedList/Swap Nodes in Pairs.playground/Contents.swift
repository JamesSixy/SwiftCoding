
import ZHDataStructure

/// 24. Swap Nodes in Pairs
/// https://leetcode.com/problems/swap-nodes-in-pairs/?tab=Description
/// - Parameter head: <#head description#>
/// - Returns: <#return value description#>
func swapPairs(_ head: ListNode?) -> ListNode? {
    let dummy = ListNode(0)
    dummy.next = head
    var cur: ListNode? = dummy
    while cur != nil {
        cur = reverseNextK(cur, 2)
    }
    return dummy.next
}

private func reverseNextK(_ cur: ListNode?, _ k: Int) -> ListNode? {
    var n1 = cur?.next, nk = cur
    for _ in stride(from: 0, to: k, by: 1) {
        nk = nk?.next
        if nk == nil {
            return nil
        }
    }
    //reverse
    var prev: ListNode? = nil, node = n1, nkplus = nk?.next
    while node !== nkplus {
        let tmp = node?.next
        node?.next = prev
        prev = node
        node = tmp
    }
    
    //connect
    cur?.next = nk
    n1?.next = nkplus
    return n1
}
