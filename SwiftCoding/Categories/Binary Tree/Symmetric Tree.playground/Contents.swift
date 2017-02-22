
import ZHDataStructure

/// 101. Symmetric Tree
/// https://leetcode.com/problems/symmetric-tree/?tab=Description
/// - Parameter root:
/// - Returns: Bool

func isSymmetric(_ root: TreeNode?) -> Bool {
    guard let root = root else {
        return true
    }
    return helper(root.left, root.right)
}

private func helper(_ leftChild: TreeNode?, _ rightChild: TreeNode?) -> Bool {

    if leftChild == nil && rightChild == nil {
        return true
    }
    if leftChild == nil || rightChild == nil {
        return false
    }
    if leftChild!.val != rightChild!.val {
        return false
    }
    return helper(leftChild?.left, rightChild?.right) &&
            helper(leftChild?.right, rightChild?.left)
}
