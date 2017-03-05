
import ZHDataStructure

/// 110. Balanced Binary Tree
/// https://leetcode.com/problems/balanced-binary-tree/?tab=Description
/// - Parameter root: <#root description#>
/// - Returns: <#return value description#>

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
