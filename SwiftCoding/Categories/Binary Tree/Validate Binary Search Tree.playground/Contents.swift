
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


typealias IsBSTTuple = (isBST: Bool, minVal: Int, maxVal: Int)

func isValidBST(_ root: TreeNode?) -> Bool {
    return isValidBSTHelper(root).isBST
}

func isValidBSTHelper(_ root: TreeNode?) -> IsBSTTuple {
    guard let root = root else {
        return (true, Int.max, Int.min)
    }
    let left = isValidBSTHelper(root.left)
    let right = isValidBSTHelper(root.right)
    
    if !left.isBST || !right.isBST {
        return (false, 0, 0)
    }
    if root.left == nil && root.right == nil {
        return (true, root.val, root.val)
    }
    if root.val > left.maxVal && root.val < right.minVal {
        return (true, min(left.minVal, root.val),
                max(right.maxVal, root.val))
    }
    
    return (false, 0, 0)
    
    //Another way (after left right division)
//    if !left.isBST || !right.isBST {
//        return (false, 0, 0)
//    }
//    if root.left != nil && left.maxVal >= root.val
//        || root.right != nil && right.minVal <= root.val {
//        return (false, 0, 0)
//    }
//    return (true, min(root.val, left.minVal),
//            max(root.val, right.maxVal))
}

func isValidBSTIterative(_ root: TreeNode?) -> Bool {
    guard let root = root else { return true }
    var stack = [TreeNode]()
    var cur: TreeNode? = root, prev: TreeNode? = nil
    while !stack.isEmpty || cur != nil {
        while cur != nil {
            stack.append(cur!) //push
            cur = cur?.left
        }
        cur = stack.removeLast() //pop
        if prev == nil || cur!.val > prev!.val {
            prev = cur
        } else {
            return false
        }
        cur = cur!.right
    }
    return true
}
