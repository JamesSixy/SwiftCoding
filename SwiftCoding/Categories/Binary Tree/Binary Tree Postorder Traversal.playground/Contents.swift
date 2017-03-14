
import ZHDataStructure

/// 145. Binary Tree Postorder Traversal
/// https://leetcode.com/problems/binary-tree-postorder-traversal/?tab=Description
/// http://www.jiuzhang.com/solutions/binary-tree-postorder-traversal/
/// - Parameter root: <#root description#>
/// - Returns: <#return value description#>
func postorderTraversal(_ root: TreeNode?) -> [Int] {
    
    var res = [Int]()
    var stack = [TreeNode]()
    var node = root
    
    while !stack.isEmpty || node != nil {
        if node != nil {
            res.insert(node!.val, at: 0)
            stack.append(node!)
            node = node!.right
        } else {
            node = stack.removeLast().left
        }
    }
    
    return res
}
