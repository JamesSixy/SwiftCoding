
import ZHDataStructure

/// 111. Minimum Depth of Binary Tree
/// https://leetcode.com/problems/minimum-depth-of-binary-tree/?tab=Description
/// - Parameter root: root
/// - Returns: min depth

func minDepth(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }
    return minDepthHelper(root)
}

private func minDepthHelper(_ root: TreeNode?) -> Int {
    guard let root = root else { return Int.max }
    if root.left == nil && root.right == nil { return 1 }
    let left = minDepthHelper(root.left)
    let right = minDepthHelper(root.right)
    return min(left, right) + 1
}