
import ZHDataStructure

/// 114. Flatten Binary Tree to Linked List
/// https://leetcode.com/problems/flatten-binary-tree-to-linked-list
/// - Parameter root: <#root description#>

func flatten(_ root: TreeNode?) {
    flattenHelper(root)
}

private func flattenHelper(_ root: TreeNode?) -> TreeNode? {
    guard let root = root else { return nil }
    
    let leftLast = flattenHelper(root.left)
    let rightLast = flattenHelper(root.right)
    
    if let leftLast = leftLast {
        leftLast.right = root.right
        root.right = root.left
        root.left = nil
        return rightLast ?? leftLast
    }
    if let rightLast = rightLast {
        return rightLast
    }
    return root
}

