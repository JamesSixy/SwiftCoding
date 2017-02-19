
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

/// Binary Tree Level Order Traversal
/// https://leetcode.com/problems/binary-tree-level-order-traversal/?tab=Description
/// - Parameter root:
/// - Returns: [[Int]]
func levelOrder(_ root: TreeNode?) -> [[Int]] {
    var res: [[Int]] = []
    guard let root = root else { return res }
    var queue: [TreeNode] = [] //use array to mock queue
    queue.append(root)
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
