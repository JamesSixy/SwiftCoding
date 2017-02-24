
import ZHDataStructure

/// 257. Binary Tree Paths
/// https://leetcode.com/problems/binary-tree-paths/?tab=Description
/// - Parameter root: <#root description#>
/// - Returns: <#return value description#>

func binaryTreePaths(_ root: TreeNode?) -> [String] {
    guard let root = root else {
        return []
    }
    let left = binaryTreePaths(root.left)
    let right = binaryTreePaths(root.right)
    
    if left.count == 0 && right.count == 0 {
        return [String(root.val)]
    }
    var res: [String] = []
    for str in left {
        res.append(String(root.val) + "->" + str)
    }
    for str in right {
        res.append(String(root.val) + "->" + str)
    }
    return res
}
