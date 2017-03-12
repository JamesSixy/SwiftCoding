
import ZHDataStructure

/// 141. Linked List Cycle
/// https://leetcode.com/problems/linked-list-cycle/?tab=Description
/// - Parameter head: <#head description#>
/// - Returns: <#return value description#>

func hasCycle(head: ListNode?) -> Bool {
    var slow = head, fast = head
    while fast != nil && fast?.next != nil {
        fast = fast?.next?.next
        slow = slow?.next
        if slow === fast {
            return true
        }
    }
    return false
}
