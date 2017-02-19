
import ZHDataStructure

/// 298. Binary Tree Longest Consecutive Sequence
/// https://leetcode.com/problems/binary-tree-longest-consecutive-sequence/?tab=Description
/// - Parameter root: <#root description#>
/// - Returns: <#return value description#>
/// What is consecutive sequence? [2, 3, 4, 5] each increasing by 1


//Solution1 - Traversal + DC
var longest: Int = 0

func longestConsecutive(_ root: TreeNode?) -> Int {
    helper(root)
    return longest
}

func helper(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }
    var len = 1
    let leftLen = helper(root.left)
    let rightLen = helper(root.right)
    if let _ = root.left, root.val + 1 == root.left?.val {
        len = max(len, leftLen + 1)
    }
    if let _ = root.right, root.val + 1 == root.right?.val {
        len = max(len, rightLen + 1)
    }
    longest = max(longest, len)
    return len
}

//Solution2 - DC

typealias Tuple = (maxInSubtree: Int, maxFromRoot: Int)

func longestConsecutiveDC(_ root: TreeNode?) -> Int {
    return helperDC(root).maxInSubtree
}

func helperDC(_ root: TreeNode?) -> Tuple {
    guard let root = root else {
        return (0, 0)
    }
    let left = helperDC(root.left)
    let right = helperDC(root.right)
    var cur: Tuple = (1, 1)
    if let leftNode = root.left, root.val + 1 == leftNode.val {
        cur.maxFromRoot = max(cur.maxFromRoot, left.maxFromRoot + 1)
    }
    if let rightNode = root.right, root.val + 1 == rightNode.val {
        cur.maxFromRoot = max(cur.maxFromRoot, right.maxFromRoot + 1)
    }
    cur.maxInSubtree = max(cur.maxFromRoot, max(left.maxInSubtree, right.maxInSubtree))
    return cur
}



