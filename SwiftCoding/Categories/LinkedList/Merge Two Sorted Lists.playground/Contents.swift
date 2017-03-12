
import ZHDataStructure

/// 21. Merge Two Sorted Lists
/// https://leetcode.com/problems/merge-two-sorted-lists/?tab=Description
/// - Parameters:
///   - l1: <#l1 description#>
///   - l2: <#l2 description#>
/// - Returns: <#return value description#>

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
