
import UIKit
import ZHDataStructure

typealias FindSubtreeTuple = (minRoot: TreeNode?, minSum: Int, allSum: Int)

func findSubtree(_ root: TreeNode?) -> TreeNode? {
    return minSubHelper(root).minRoot
}

private func minSubHelper(_ root: TreeNode?) -> FindSubtreeTuple {
    guard let root = root else {
        return (nil, Int.max, 0)
    }
    let left = minSubHelper(root.left)
    let right = minSubHelper(root.right)
    
    let sum = left.allSum + right.allSum + root.val
    
    if sum < left.minSum && sum < right.minSum {
        return (root, sum, sum)
    } else if left.minSum < right.minSum {
        return (left.minRoot, left.minSum, sum)
    } else {
        return (right.minRoot, right.minSum, sum)
    }
}

typealias LongestConsecutiveTuple = (maxLen: Int, maxFromRoot: Int)

func longestConsecutive(_ root: TreeNode?) -> Int {
    return longestConsecutiveHelper(root).maxLen
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
    return (max(left.maxLen, right.maxLen, maxFromRoot), maxFromRoot)
}

func binaryTreePaths(_ root: TreeNode?) -> [String] {
    guard let root = root else { return [] }
    let left = binaryTreePaths(root.left)
    let right = binaryTreePaths(root.right)
    var res = [String]()
    for path in left {
        res.append(String(root.val) + "->" + path)
    }
    for path in right {
        res.append(String(root.val) + "->" + path)
    }
    if left.count == 0 && right.count == 0 {
        res.append(String(root.val))
    }
    return res
}

func flatten(_ root: TreeNode?) {
    flattenHelper(root)
}

private func flattenHelper(_ root: TreeNode?) -> TreeNode? {
    guard let root = root else { return nil }
    
    let leftLast = flattenHelper(root.left)
    let rightLast = flattenHelper(root.right)
    
    if let leftLast = leftLast {
        leftLast.right = root.right
        root.right = root.left
        root.left = nil
        return rightLast ?? leftLast
    }
    if let rightLast = rightLast {
        return rightLast
    }
    return root
}

typealias IsBalancedTuple = (isBalanced: Bool, maxDepth: Int)

func isBalanced(_ root: TreeNode?) -> Bool {
    return isBalancedHelper(root).isBalanced
}

private func isBalancedHelper(_ root: TreeNode?) -> IsBalancedTuple {
    guard let root = root else {
        return (true, 0)
    }
    let left = isBalancedHelper(root.left)
    let right = isBalancedHelper(root.right)
    
    if !left.isBalanced || !right.isBalanced {
        return (false, 0)
    }
    if abs(left.maxDepth - right.maxDepth) > 1 {
        return (false, 0)
    }
    return (true, max(left.maxDepth, right.maxDepth) + 1)
}

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
}



