
import ZHDataStructure

/// Binary Tree Level Order Traversal
/// https://leetcode.com/problems/binary-tree-level-order-traversal/?tab=Description
/// - Parameter root:
/// - Returns: [[Int]]
func levelOrder(_ root: TreeNode?) -> [[Int]] {
    var res: [[Int]] = []
    guard let root = root else { return res }
    var queue = [root]
    while !queue.isEmpty {
        let size = queue.count
        var level: [Int] = []
        for _ in 0 ..< size {
            let cur = queue.removeFirst()
            level.append(cur.val)
            if let left = cur.left {
                queue.append(left)
            }
            if let right = cur.right {
                queue.append(right)
            }
        }
        res.append(level)
    }
    return res
}
