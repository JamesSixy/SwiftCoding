
import ZHDataStructure

/// 206. Reverse Linked List [LLFB]
/// https://leetcode.com/problems/reverse-linked-list/?tab=Description
/// - Parameter head: <#head description#>
/// - Returns: <#return value description#>

func reverseList(_ head: ListNode?) -> ListNode? {
    var prev: ListNode? = nil, cur = head
    while cur != nil {
        let tmp = cur?.next
        cur?.next = prev
        prev = cur
        cur = tmp
    }
    return prev
}
