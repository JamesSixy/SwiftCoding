
import ZHDataStructure

/// 257. Binary Tree Paths
/// https://leetcode.com/problems/binary-tree-paths/?tab=Description
/// - Parameter root: <#root description#>
/// - Returns: <#return value description#>

func binaryTreePaths(_ root: TreeNode?) -> [String] {
    guard let root = root else { return [] }
    let left = binaryTreePaths(root.left)
    let right = binaryTreePaths(root.right)
    var res = [String]()
    for path in left {
        res.append(String(root.val) + "->" + path)
    }
    for path in right {
        res.append(String(root.val) + "->" + path)
    }
    if left.count == 0 && right.count == 0 {
        res.append(String(root.val))
    }
    return res
}

