
import ZHDataStructure

/// 111. Minimum Depth of Binary Tree
/// https://leetcode.com/problems/minimum-depth-of-binary-tree/?tab=Description
/// - Parameter root: root
/// - Returns: min depth

//Solution 1: pre order way
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

//Solution 2: BFS
func minDepthBFS(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }
    var queue = [root], res = 0
    while !queue.isEmpty {
        let size = queue.count
        res += 1
        for _ in 0 ..< size {
            let cur = queue.removeFirst() //dequeue
            if cur.left == nil && cur.right == nil {
                return res
            }
            if let left = cur.left {
                queue.append(left) //enqueue
            }
            if let right = cur.right {
                queue.append(right) //enqueue
            }
        }
    }
    return res
}


