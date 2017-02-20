
import ZHDataStructure

/// 110. Balanced Binary Tree
/// https://leetcode.com/problems/balanced-binary-tree/?tab=Description
/// - Parameter root: <#root description#>
/// - Returns: <#return value description#>

typealias Tuple = (isBalanced: Bool, depth: Int)

func isBalanced(_ root: TreeNode?) -> Bool {
    let tuple = helper(root)
    return tuple.isBalanced
}

private func helper(_ root: TreeNode?) -> Tuple {
    guard let root = root else {
        return (true, 0)
    }
    let left = helper(root.left)
    let right = helper(root.right)
    
    if !left.isBalanced || !right.isBalanced {
        return (false, 0)
    }
    if abs(left.depth - right.depth) > 1 {
        return (false, 0)
    }
    return (true, max(left.depth, right.depth) + 1)
}
