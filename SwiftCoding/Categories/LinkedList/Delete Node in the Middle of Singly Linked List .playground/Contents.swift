
import ZHDataStructure

/// Delete Node in the Middle of Singly Linked List
/// http://www.lintcode.com/en/problem/delete-node-in-the-middle-of-singly-linked-list/
/// - Parameter node: <#node description#>
func deleteNode(_ node: ListNode?) {
    guard let node = node, let next = node.next else { return }
    node.val = next.val
    node.next = next.next
}
