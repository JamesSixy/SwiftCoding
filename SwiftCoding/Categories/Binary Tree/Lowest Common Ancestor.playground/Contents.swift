
import ZHDataStructure

/// Lowest Common Ancestor III
/// http://www.lintcode.com/en/problem/lowest-common-ancestor-iii/
/// - Parameters:
///   - root: <#root description#>
///   - A: <#A description#>
///   - B: <#B description#>
/// - Returns: <#return value description#>

typealias Tuple = (aExists: Bool, bExists: Bool, node: TreeNode?)

public func lowestCommonAncestor3(_ root: TreeNode?,
                                  _ A: TreeNode?,
                                  _ B: TreeNode?) -> TreeNode? {
    let tuple = helper3(root, A, B)
    if tuple.aExists && tuple.bExists {
        return tuple.node
    }
    return nil
}

private func helper3(_ root: TreeNode?,
                     _ A: TreeNode?,
                     _ B: TreeNode?) -> Tuple {
    guard let root = root else {
        return (false, false, nil)
    }
    let left = helper3(root.left, A, B)
    let right = helper3(root.right, A, B)
    
    let aExists = left.aExists || right.aExists || root === A
    let bExists = left.bExists || right.bExists || root === B
    
    // what should we check here?
    //if root is A or B, then return aExists, bExists
    
    if root === A || root === B {
        return (aExists, bExists, root)
    }
    if let _ = left.node, let _ = right.node {
        return (aExists, bExists, root)
    } else if let node = left.node {
        return (aExists, bExists, node)
    } else if let node = right.node {
        return (aExists, bExists, node)
    }
    return (aExists, bExists, nil)
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
