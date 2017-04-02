
import ZHDataStructure

/*
 110. Balanced Binary Tree
 
 https://leetcode.com/problems/balanced-binary-tree/?tab=Description
 
 Given a binary tree, determine if it is height-balanced.
 
 For this problem, a height-balanced binary tree is defined as a binary tree in which the depth of the two subtrees of every node never differ by more than 1.
 
 */

typealias IsBalancedTuple = (isBalanced: Bool, maxDepth: Int)

func isBalanced(_ root: TreeNode?) -> Bool {
    return isBalancedHelper(root).isBalanced
}

private func isBalancedHelper(_ root: TreeNode?) -> IsBalancedTuple {
    guard let root = root else {
        return (true, 0)
    }
    let left = isBalancedHelper(root.left)
    let right = isBalancedHelper(root.right)
    
    if !left.isBalanced || !right.isBalanced {
        return (false, 0)
    }
    if abs(left.maxDepth - right.maxDepth) > 1 {
        return (false, 0)
    }
    return (true, max(left.maxDepth, right.maxDepth) + 1)
}
