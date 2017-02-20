
import ZHDataStructure

/// 98. Validate Binary Search Tree
/// https://leetcode.com/problems/validate-binary-search-tree/?tab=Description
/// - Parameter root: <#root description#>
/// - Returns: <#return value description#>
/// when left right recursion out, what should we check?
/// 1.left is BST
/// 2.right is BST
/// 3.left.max < root.val
/// 4.right.min > root.val
/// 5.left is nil - then return (true if 1,2,3,4 is true, min = root.val, max = right.maxValue)
/// 6. right is nil - similar to 5

typealias Tuple = (isBST: Bool, minVal: Int, maxVal: Int)

func isValidBST(_ root: TreeNode?) -> Bool {
    return helper(root).isBST
}

private func helper(_ root: TreeNode?) -> Tuple {
    guard let root = root else {
        return (true, Int.max, Int.min)
    }
    let left = helper(root.left)
    let right = helper(root.right)
    
    if !left.isBST || !right.isBST {
        return (false, 0, 0)
    }
    
    if root.left != nil && left.maxVal >= root.val
        || root.right != nil && right.minVal <= root.val {
        return (false, 0, 0)
    }
    return (true, min(root.val, left.minVal),
            max(root.val, right.maxVal))
}
