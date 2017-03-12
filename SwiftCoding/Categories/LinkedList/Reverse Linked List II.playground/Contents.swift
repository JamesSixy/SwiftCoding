
import ZHDataStructure

/// 92. Reverse Linked List II [LLFB]
/// https://leetcode.com/problems/reverse-linked-list-ii/?tab=Description
/// - Parameters:
///   - head: <#head description#>
///   - m: <#m description#>
///   - n: <#n description#>
/// - Returns: <#return value description#>

/**
 cur -> n1 -> n2 -> .. -> nk -> nkplus
 cur -> nk -> nk-1 -> .. -> n1 -> nkplus
 return dummy.next
 
 */
func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
    guard m <= n && m >= 1 else { return head }
    
    let dummy = ListNode(0)
    dummy.next = head
    var cur: ListNode? = dummy
    //find m
    for _ in stride(from: 1, to: m, by: 1) {
        cur = cur?.next
        if cur == nil {
            return dummy.next
        }
    }
    //find n
    let n1 = cur?.next
    var nk = n1
    for _ in stride(from: 0, to: n - m, by: 1) {
        nk = nk?.next
        if nk == nil {
            return dummy.next
        }
    }
    //reverse
    var prev: ListNode? = nil, nkplus = nk?.next, node = n1
    while node !== nkplus {
        let tmp = node?.next
        node?.next = prev
        prev = node
        node = tmp
    }
    //connect
    cur?.next = nk
    n1?.next = nkplus
    
    return dummy.next
}
