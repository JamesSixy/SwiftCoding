
import ZHDataStructure

/// 104. Maximum Depth of Binary Tree
/// https://leetcode.com/problems/maximum-depth-of-binary-tree/?tab=Description
/// - Parameter root: <#root description#>
/// - Returns: <#return value description#>

//Solution 1
func maxDepth(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }
    let left = maxDepth(root.left)
    let right = maxDepth(root.right)
    return max(left, right) + 1
}

//Solution2
func maxDepthBFS(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }
    var queue = [root], res = 0
    while !queue.isEmpty {
        let size = queue.count
        for _ in 0 ..< size {
            let cur = queue.removeFirst()
            if let left = cur.left {
                queue.append(left)
            }
            if let right = cur.right {
                queue.append(right)
            }
        }
        res += 1
    }
    return res
}