
import ZHDataStructure


/// Convert Binary Search Tree to Doubly Linked List
/// http://www.lintcode.com/en/problem/convert-binary-search-tree-to-doubly-linked-list/
/// - Parameter root: <#root description#>
/// - Returns: doubly list node

typealias Tuple = (first: DoublyListNode?, last: DoublyListNode?)

public func bstToDoublyList(_ root: TreeNode?) -> DoublyListNode? {
    return helper(root).first
}

private func helper(_ root: TreeNode?) -> Tuple {
    guard let root = root else {
        return (nil, nil)
    }
    let leftTuple = helper(root.left)
    let rightTuple = helper(root.right)
    
    var rootTuple: Tuple = (nil, nil)
    let node = DoublyListNode(root.val)
    
    if root.left != nil {
        rootTuple.first = leftTuple.first
        leftTuple.last?.next = node
        node.prev = leftTuple.last
    } else {
        rootTuple.first = node
    }
    
    if root.right != nil {
        rootTuple.last = rightTuple.last
        rightTuple.first?.prev = node
        node.next = rightTuple.first
    } else {
        rootTuple.last = node
    }
    return rootTuple
}
