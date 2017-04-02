
import ZHDataStructure

/*
 298. Binary Tree Longest Consecutive Sequence
 
 https://leetcode.com/problems/binary-tree-longest-consecutive-sequence/?tab=Description
 
 Given a binary tree, find the length of the longest consecutive sequence path.
 
 The path refers to any sequence of nodes from some starting node to any node in the tree along the parent-child connections. The longest consecutive path need to be from parent to child (cannot be the reverse).
 
 What is consecutive sequence? [2, 3, 4, 5] each increasing by 1
 
 Time: O(n), Space: O(n)
 */


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

typealias LongestConsecutiveTuple = (maxInSub: Int, maxFromRoot: Int)

func longestConsecutiveDC(_ root: TreeNode?) -> Int {
    return longestConsecutiveHelper(root).maxInSub
}

private func longestConsecutiveHelper(_ root: TreeNode?) -> LongestConsecutiveTuple {
    guard let root = root else {
        return (0, 0)
    }
    let left = longestConsecutiveHelper(root.left)
    let right = longestConsecutiveHelper(root.right)
    
    var maxFromRoot = 1
    if let leftNode = root.left, root.val + 1 == leftNode.val {
        maxFromRoot = max(maxFromRoot, left.maxFromRoot + 1)
    }
    if let rightNode = root.right, root.val + 1 == rightNode.val {
        maxFromRoot = max(maxFromRoot, right.maxFromRoot + 1)
    }
    return (max(left.maxInSub, right.maxInSub, maxFromRoot), maxFromRoot)
}




