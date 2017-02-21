//: Playground - noun: a place where people can play

import ZHDataStructure


/// 114. Flatten Binary Tree to Linked List
/// https://leetcode.com/problems/flatten-binary-tree-to-linked-list
/// - Parameter root: <#root description#>


func flatten(_ root: TreeNode?) {
    helper(root)
}

private func helper(_ root: TreeNode?) -> TreeNode? {
    guard let root = root else {
        return nil
    }
    let leftLast = helper(root.left)
    let rightLast = helper(root.right)
    if let leftLast = leftLast {
        leftLast.right = root.right
        root.right = root.left
        root.left = nil
    }
    if let rightLast = rightLast {
        return rightLast
    }
    if let leftLast = leftLast {
        return leftLast
    }
    return root
}

