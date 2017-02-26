
import ZHDataStructure

/// 94. Binary Tree Inorder Traversal
///
/// - Parameter root: <#root description#>
/// - Returns: <#return value description#>

func inorderTraversal(_ root: TreeNode?) -> [Int] {
    var res: [Int] = []
    guard let root = root else { return res }
    var cur: TreeNode? = root
    var stack: [TreeNode] = []
    while !stack.isEmpty || cur != nil {
        while cur != nil {
            stack.append(cur!) //push
            cur = cur!.left
        }
        cur = stack.removeLast() //pop
        res.append(cur!.val)
        cur = cur!.right
    }
    return res
}