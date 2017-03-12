
import ZHDataStructure

/// Reverse Nodes in k-Groups
/// http://www.lintcode.com/en/problem/reverse-nodes-in-k-group/
/// - Parameters:
///   - head: <#head description#>
///   - k: <#k description#>
/// - Returns: <#return value description#>

func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
    let dummy = ListNode(0)
    dummy.next = head
    var cur: ListNode? = dummy
    while cur != nil {
        cur = reverseNextK(cur, k)
    }
    return dummy.next
}

/*
 cur -> n1 -> n2 -> ... -> nk -> nkplus
 cur -> nk -> nk-1 -> ... -> n1 -> nkplus
 return n1
 */
private func reverseNextK(_ cur: ListNode?, _ k: Int) -> ListNode? {
    var n1 = cur?.next, nk = cur
    for _ in 0 ..< k {
        nk = nk?.next
        if nk == nil {
            return nil
        }
    }
    //reverse
    var prev: ListNode? = nil, node = n1, nkplus = nk?.next
    while cur !== nkplus {
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
