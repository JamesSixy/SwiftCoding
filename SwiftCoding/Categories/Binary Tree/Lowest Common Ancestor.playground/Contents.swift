
import ZHDataStructure

/// Lowest Common Ancestor III
/// http://www.lintcode.com/en/problem/lowest-common-ancestor-iii/
/// - Parameters:
///   - root: <#root description#>
///   - A: <#A description#>
///   - B: <#B description#>
/// - Returns: <#return value description#>
/// what should we check after left right devision?
/// if root is A or B, then return aExists, bExists. Check node

typealias LCA3Tuple = (aExists: Bool, bExists: Bool, node: TreeNode?)

func lowestCommonAncestor3(_ root: TreeNode?,
                           _ A: TreeNode?,
                           _ B: TreeNode?) -> TreeNode? {
    let tuple = lowestCommonAncestor3Helper(root, A, B)
    return tuple.aExists && tuple.bExists ? tuple.node : nil
}

private func lowestCommonAncestor3Helper(_ root: TreeNode?,
                                         _ A: TreeNode?,
                                         _ B: TreeNode?) -> LCA3Tuple {
    guard let root = root else {
        return (false, false, nil)
    }
    let left = lowestCommonAncestor3Helper(root.left, A, B)
    let right = lowestCommonAncestor3Helper(root.right, A, B)
    
    let aExists = left.aExists || right.aExists || root === A
    let bExists = left.bExists || right.bExists || root === B
    
    if root === A || root === B {
        return (aExists, bExists, root)
    }
    if let _ = left.node, let _ = right.node {
        return (aExists, bExists, root)
    } else if let leftNode = left.node {
        return (aExists, bExists, leftNode)
    } else if let rightNode = right.node {
        return (aExists, bExists, rightNode)
    } else {
        return (aExists, bExists, nil)
    }
}

//Test
//let arr = [1, -5, 2, 0, 2, -4, -5]
//let root = arrayToBinaryTree(arr, 0)
//print(preorderTraversal(root))
//print(lowestCommonAncestor3(root, root?.left?.left, root?.right?.right)!.val)
//print(lowestCommonAncestor3(root, root, root?.right?.right)?.val)
//print(lowestCommonAncestor3(root, root, nil)?.val)
//print(lowestCommonAncestor3(root, nil, nil)?.val)
//print(lowestCommonAncestor3(root, root?.left, root?.left?.right)?.val)
