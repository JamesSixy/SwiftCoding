
import ZHDataStructure

/// 86. Partition List
/// https://leetcode.com/problems/partition-list/?tab=Description
/// - Parameters:
///   - head: <#head description#>
///   - x: <#x description#>
/// - Returns: <#return value description#>

func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
    let l1 = ListNode(1), l2 = ListNode(1)
    var small: ListNode? = l1, big: ListNode? = l2
    var cur = head
    while cur != nil {
        if cur!.val < x {
            small?.next = cur
            small = small?.next
        } else {
            big?.next = cur
            big = big?.next
        }
        cur = cur?.next
    }
    big?.next = nil //last one can belong to l1
    small?.next = l2.next
    return l1.next
}
